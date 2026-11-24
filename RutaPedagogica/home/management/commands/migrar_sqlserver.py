"""Copia el esquema y todos los datos de SQLite a SQL Server."""

from __future__ import annotations

import datetime
from decimal import Decimal, InvalidOperation

from django.core.management import call_command
from django.core.management.base import BaseCommand, CommandError
from django.db import connections
from django.utils.dateparse import parse_date, parse_datetime, parse_time

from mysite.sqlserver_config import build_sqlserver_database, pyodbc_conn_str

SKIP_TABLES = {
    "sqlite_sequence",
    "sqlite_stat1",
    "sqlite_stat4",
    "django_migrations",
}


def quote_ident(name: str) -> str:
    return "[" + str(name).replace("]", "]]") + "]"


def convert_value(value, data_type: str):
    if value is None:
        return None
    dt = (data_type or "").lower()
    if isinstance(value, memoryview):
        value = value.tobytes()
    if dt == "bit":
        if isinstance(value, (bytes, bytearray)):
            return 1 if value and value[0] else 0
        return 1 if value in (True, 1, "1", b"\x01") else 0
    if dt in {"int", "bigint", "smallint", "tinyint"}:
        if value == "":
            return None
        return int(value)
    if dt in {"float", "real"}:
        if value == "":
            return None
        return float(value)
    if dt in {"decimal", "numeric", "money", "smallmoney"}:
        if value == "":
            return None
        try:
            return Decimal(str(value))
        except (InvalidOperation, ValueError):
            return value
    if dt in {"datetime", "datetime2", "smalldatetime", "datetimeoffset"}:
        if isinstance(value, datetime.datetime):
            return value
        if isinstance(value, str):
            return parse_datetime(value) or value
    if dt == "date":
        if isinstance(value, datetime.date) and not isinstance(value, datetime.datetime):
            return value
        if isinstance(value, str):
            return parse_date(value) or value
    if dt == "time":
        if isinstance(value, datetime.time):
            return value
        if isinstance(value, str):
            return parse_time(value) or value
    return value


class Command(BaseCommand):
    help = (
        "Crea el esquema en SQL Server (migrate) y copia todas las tablas "
        "con sus datos desde SQLite, conservando las claves primarias."
    )

    def add_arguments(self, parser):
        parser.add_argument("--host", default=None, help="Servidor SQL Server (MSSQL_HOST)")
        parser.add_argument("--port", default=None, help="Puerto (MSSQL_PORT)")
        parser.add_argument("--name", default=None, help="Base de datos destino (MSSQL_NAME)")
        parser.add_argument("--user", default=None, help="Usuario (MSSQL_USER)")
        parser.add_argument("--password", default=None, help="Contraseña (MSSQL_PASSWORD)")
        parser.add_argument("--driver", default=None, help="Driver ODBC")
        parser.add_argument(
            "--trusted",
            action="store_true",
            help="Autenticación de Windows (sin usuario/contraseña)",
        )
        parser.add_argument(
            "--solo-esquema",
            action="store_true",
            help="Solo crea tablas con migrate, no copia datos",
        )
        parser.add_argument(
            "--sin-crear-bd",
            action="store_true",
            help="No intenta CREATE DATABASE; la base ya debe existir",
        )

    def handle(self, *args, **options):
        cfg = build_sqlserver_database(
            host=options["host"],
            port=options["port"],
            name=options["name"],
            user=options["user"],
            password=options["password"],
            driver=options["driver"],
            trusted=options["trusted"],
        )
        if not cfg.get("NAME"):
            raise CommandError("Indicá --name o MSSQL_NAME.")
        if "USER" in cfg and not cfg.get("PASSWORD"):
            raise CommandError("Indicá --password o MSSQL_PASSWORD.")

        if not options["sin_crear_bd"]:
            self._crear_base(cfg, options)

        from django.conf import settings

        settings.DATABASES["sqlserver"] = cfg
        connections.databases["sqlserver"] = cfg
        connections.close_all()

        self.stdout.write(self.style.NOTICE(f"Creando esquema en {cfg['HOST']} / {cfg['NAME']} ..."))
        try:
            call_command("migrate", database="sqlserver", interactive=False, verbosity=1)
        except Exception as exc:
            raise CommandError(f"Falló migrate sobre SQL Server: {exc}") from exc

        if options["solo_esquema"]:
            self.stdout.write(self.style.SUCCESS("Esquema creado. No se copiaron datos."))
            return

        copiadas, omitidas, errores = self._copiar_tablas()
        self.stdout.write("")
        self.stdout.write(self.style.SUCCESS(f"Tablas copiadas: {copiadas}"))
        if omitidas:
            self.stdout.write(f"Tablas omitidas (no existen en SQL Server o están vacías de origen): {len(omitidas)}")
        if errores:
            self.stdout.write(self.style.ERROR(f"Tablas con error: {len(errores)}"))
            for tabla, msg in errores:
                self.stdout.write(self.style.ERROR(f"  - {tabla}: {msg}"))
            raise CommandError("La migración terminó con errores en algunas tablas.")
        self.stdout.write("")
        self.stdout.write("Para usar SQL Server en el sitio:")
        self.stdout.write("  $env:MSSQL_HOST='...' ; $env:MSSQL_NAME='...' ; $env:MSSQL_USER='...' ; $env:MSSQL_PASSWORD='...'")
        self.stdout.write("  $env:DJANGO_SETTINGS_MODULE='mysite.settings.sqlserver'")
        self.stdout.write("  .\\env\\Scripts\\python.exe manage.py runserver 127.0.0.1:8003")

    def _crear_base(self, cfg, options):
        import pyodbc

        dbname = cfg["NAME"]
        conn_str = pyodbc_conn_str(
            "master",
            host=cfg["HOST"],
            port=cfg.get("PORT"),
            user=cfg.get("USER"),
            password=cfg.get("PASSWORD"),
            driver=cfg["OPTIONS"]["driver"],
            trusted="USER" not in cfg,
        )
        self.stdout.write(f"Conectando a {cfg['HOST']} (master) para asegurar la base {dbname} ...")
        try:
            conn = pyodbc.connect(conn_str, autocommit=True, timeout=15)
        except pyodbc.Error as exc:
            conn_str_no_encrypt = conn_str.replace("Encrypt=yes", "Encrypt=no")
            try:
                conn = pyodbc.connect(conn_str_no_encrypt, autocommit=True, timeout=15)
                cfg["OPTIONS"]["extra_params"] = cfg["OPTIONS"]["extra_params"].replace(
                    "Encrypt=yes", "Encrypt=no"
                )
            except pyodbc.Error:
                raise CommandError(
                    "No se pudo conectar a SQL Server. Revisá host, usuario, contraseña y el driver ODBC. "
                    f"Detalle: {exc}"
                ) from exc
        try:
            cur = conn.cursor()
            cur.execute(
                "IF DB_ID(?) IS NULL "
                "EXEC('CREATE DATABASE " + quote_ident(dbname) + " COLLATE Modern_Spanish_CI_AS')",
                dbname,
            )
        finally:
            conn.close()

    def _copiar_tablas(self):
        sqlite = connections["default"]
        mssql = connections["sqlserver"]
        with sqlite.cursor() as src:
            src.execute(
                "SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%' ORDER BY name"
            )
            origen = [row[0] for row in src.fetchall() if row[0] not in SKIP_TABLES]

        with mssql.cursor() as dst:
            dst.execute(
                "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES "
                "WHERE TABLE_TYPE='BASE TABLE' AND TABLE_SCHEMA='dbo'"
            )
            destino = {row[0] for row in dst.fetchall()}

        copiadas = 0
        omitidas = []
        errores = []

        with mssql.cursor() as dst:
            for tabla in sorted(destino):
                dst.execute(f"ALTER TABLE {quote_ident(tabla)} NOCHECK CONSTRAINT ALL")

        for tabla in origen:
            if tabla not in destino:
                omitidas.append(tabla)
                continue
            try:
                n = self._copiar_tabla(sqlite, mssql, tabla)
                if n == 0:
                    omitidas.append(tabla)
                else:
                    copiadas += 1
                    self.stdout.write(f"  {tabla}: {n} filas")
            except Exception as exc:
                errores.append((tabla, str(exc)))
                self.stderr.write(self.style.ERROR(f"  {tabla}: {exc}"))

        with mssql.cursor() as dst:
            for tabla in sorted(destino):
                try:
                    dst.execute(f"ALTER TABLE {quote_ident(tabla)} WITH CHECK CHECK CONSTRAINT ALL")
                except Exception:
                    dst.execute(f"ALTER TABLE {quote_ident(tabla)} CHECK CONSTRAINT ALL")

        return copiadas, omitidas, errores

    def _copiar_tabla(self, sqlite, mssql, tabla):
        qtable = quote_ident(tabla)
        with mssql.cursor() as dst:
            dst.execute(
                """
                SELECT c.name, t.name AS type_name, c.is_identity, c.is_computed
                FROM sys.columns c
                JOIN sys.tables tb ON c.object_id = tb.object_id
                JOIN sys.types t ON c.user_type_id = t.user_type_id
                WHERE tb.name = %s AND SCHEMA_NAME(tb.schema_id) = 'dbo'
                ORDER BY c.column_id
                """,
                [tabla],
            )
            dest_cols = [
                {"name": row[0], "type": row[1], "identity": bool(row[2]), "computed": bool(row[3])}
                for row in dst.fetchall()
            ]

        insert_cols = [c for c in dest_cols if not c["computed"]]
        if not insert_cols:
            return 0
        col_names = [c["name"] for c in insert_cols]
        types = {c["name"]: c["type"] for c in insert_cols}
        identity_cols = [c["name"] for c in insert_cols if c["identity"]]

        sqlite_q = sqlite.ops.quote_name
        with sqlite.cursor() as src:
            src.execute(f"PRAGMA table_info({sqlite_q(tabla)})")
            sqlite_cols = [row[1] for row in src.fetchall()]
        comunes = [c for c in col_names if c in sqlite_cols]
        if not comunes:
            return 0

        select_sql = "SELECT " + ", ".join(sqlite_q(c) for c in comunes) + f" FROM {sqlite_q(tabla)}"
        with sqlite.cursor() as src:
            src.execute(select_sql)
            filas = src.fetchall()
        if not filas:
            return 0

        convertidas = []
        for fila in filas:
            convertidas.append(
                tuple(convert_value(valor, types.get(col, "")) for col, valor in zip(comunes, fila))
            )

        placeholders = ",".join(["%s"] * len(comunes))
        insert_sql = (
            f"INSERT INTO {qtable} ("
            + ",".join(quote_ident(c) for c in comunes)
            + f") VALUES ({placeholders})"
        )

        with mssql.cursor() as dst:
            dst.execute(f"DELETE FROM {qtable}")
            if identity_cols and any(c in comunes for c in identity_cols):
                dst.execute(f"SET IDENTITY_INSERT {qtable} ON")
            try:
                dst.executemany(insert_sql, convertidas)
            finally:
                if identity_cols and any(c in comunes for c in identity_cols):
                    dst.execute(f"SET IDENTITY_INSERT {qtable} OFF")
            if identity_cols:
                ident = quote_ident(identity_cols[0])
                dst.execute(f"SELECT ISNULL(MAX({ident}), 0) FROM {qtable}")
                max_id = dst.fetchone()[0]
                if max_id:
                    dst.execute(f"DBCC CHECKIDENT ('dbo.{tabla}', RESEED, {int(max_id)})")
        mssql.commit()
        return len(convertidas)
