"""Genera un script T-SQL con esquema y datos actuales (SQLite -> SQL Server)."""

from __future__ import annotations

import re
import sqlite3
from datetime import date, datetime
from pathlib import Path

DB = Path(__file__).resolve().parent / "db.sqlite3"
OUT = Path(__file__).resolve().parent / "RutaPedagogica_sqlserver.sql"
DB_NAME = "RutaPedagogica"


def q(name: str) -> str:
    return "[" + str(name).replace("]", "]]") + "]"


def is_int_type(declared: str) -> bool:
    low = (declared or "integer").lower()
    if any(x in low for x in ("char", "text", "clob", "blob", "date", "time", "bool", "numeric", "decimal")):
        return False
    return (not low.strip()) or "int" in low


def has_identity(cols) -> bool:
    pk_cols = [c for c in cols if c[5]]
    if len(pk_cols) != 1:
        return False
    return is_int_type(pk_cols[0][2])


def map_type(declared: str, identity: bool) -> tuple[str, bool]:
    t = (declared or "").strip()
    low = t.lower()
    if identity:
        return "BIGINT IDENTITY(1,1)", True
    if low in {"bool", "boolean"}:
        return "BIT", False
    if low in {"datetime", "timestamp"}:
        return "DATETIME2(6)", False
    if low == "date":
        return "DATE", False
    if low == "time":
        return "TIME(7)", False
    if low in {"text", "clob", "json", "jsonb"}:
        return "NVARCHAR(MAX)", False
    if low in {"blob"}:
        return "VARBINARY(MAX)", False
    if low in {"real", "float", "double", "double precision"}:
        return "FLOAT", False
    m = re.match(r"(var)?char\((\d+)\)", low)
    if m:
        n = min(int(m.group(2)), 4000)
        return f"NVARCHAR({n})", False
    m = re.match(r"nvarchar\((\d+|max)\)", low)
    if m:
        return f"NVARCHAR({m.group(1).upper()})", False
    m = re.match(r"decimal\((.+)\)", low)
    if m:
        return f"DECIMAL({m.group(1)})", False
    m = re.match(r"numeric\((.+)\)", low)
    if m:
        return f"NUMERIC({m.group(1)})", False
    if "bigint" in low:
        return "BIGINT", False
    if "smallint" in low:
        return "SMALLINT", False
    if "int" in low:
        return "BIGINT", False
    return "NVARCHAR(MAX)", False


def parse_index(sql: str):
    text = (sql or "").strip().rstrip(";")
    unique = "UNIQUE " if re.search(r"CREATE\s+UNIQUE\s+INDEX", text, re.I) else ""
    on_at = re.search(r"\bON\b", text, re.I)
    if not on_at:
        return None
    rest = text[on_at.end() :].strip()
    paren = rest.find("(")
    if paren < 0:
        return None
    depth = 0
    end = None
    for i, ch in enumerate(rest[paren:], paren):
        if ch == "(":
            depth += 1
        elif ch == ")":
            depth -= 1
            if depth == 0:
                end = i
                break
    if end is None:
        return None
    cols_raw = rest[paren + 1 : end]
    inner = ", ".join(
        q(p.strip().strip('"').strip("`").strip("[]").split()[0])
        for p in cols_raw.split(",")
        if p.strip()
    )
    after = rest[end + 1 :].strip()
    where = None
    if after.upper().startswith("WHERE"):
        where = re.sub(r'"(\w+)"', r"[\1]", after[5:].strip())
        where = re.sub(r"'([^']*)'", r"N'\1'", where)
    return unique, inner, where


def lit(value) -> str:
    if value is None:
        return "NULL"
    if isinstance(value, (bytes, memoryview, bytearray)):
        data = bytes(value)
        if not data:
            return "NULL"
        return "0x" + data.hex().upper()
    if isinstance(value, bool):
        return "1" if value else "0"
    if isinstance(value, int) and not isinstance(value, bool):
        return str(value)
    if isinstance(value, float):
        return repr(value)
    if isinstance(value, datetime):
        return "N'" + value.strftime("%Y-%m-%d %H:%M:%S.%f")[:-3] + "'"
    if isinstance(value, date):
        return "N'" + value.isoformat() + "'"
    text = str(value).replace("'", "''")
    return "N'" + text + "'"


def main():
    con = sqlite3.connect(str(DB))
    con.row_factory = sqlite3.Row
    cur = con.cursor()
    tables = [
        r[0]
        for r in cur.execute(
            "SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%' "
            "AND name NOT LIKE '%_fts%' AND name NOT LIKE 'fts_%' ORDER BY name"
        )
    ]

    meta = {}
    for table in tables:
        cols = list(cur.execute(f"PRAGMA table_info({q(table)})"))
        fks = list(cur.execute(f"PRAGMA foreign_key_list({q(table)})"))
        meta[table] = {"cols": cols, "fks": fks}

    lines = []
    a = lines.append
    a("/* Rutas Pedagógicas — volcado SQLite -> SQL Server */")
    a("/* Generado desde db.sqlite3 del sistema actual */")
    a("SET NOCOUNT ON;")
    a("SET ANSI_NULLS ON;")
    a("SET QUOTED_IDENTIFIER ON;")
    a(f"IF DB_ID(N'{DB_NAME}') IS NULL CREATE DATABASE {q(DB_NAME)} COLLATE Modern_Spanish_CI_AS;")
    a("GO")
    a(f"ALTER DATABASE {q(DB_NAME)} SET RECOVERY SIMPLE;")
    a("GO")
    a(f"USE {q(DB_NAME)};")
    a("GO")
    a("")
    a("DECLARE @drop_fk NVARCHAR(MAX) = N'';")
    a("SELECT @drop_fk = @drop_fk + N'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id))")
    a("    + N'.' + QUOTENAME(OBJECT_NAME(parent_object_id)) + N' DROP CONSTRAINT ' + QUOTENAME(name) + N';'")
    a("FROM sys.foreign_keys;")
    a("IF @drop_fk <> N'' EXEC sp_executesql @drop_fk;")
    a("GO")
    a("")

    for table in tables:
        a(f"IF OBJECT_ID(N'dbo.{table}', N'U') IS NOT NULL DROP TABLE {q(table)};")
    a("GO")
    a("")

    for table in tables:
        cols = meta[table]["cols"]
        col_sql = []
        pk_cols = []
        ident = has_identity(cols)
        for cid, name, ctype, notnull, dflt, pk in cols:
            sql_type, _ident = map_type(ctype, ident and bool(pk))
            null_sql = "NOT NULL" if notnull or pk else "NULL"
            col_sql.append(f"    {q(name)} {sql_type} {null_sql}")
            if pk:
                pk_cols.append(name)
        a(f"CREATE TABLE {q(table)} (")
        a(",\n".join(col_sql))
        if pk_cols:
            pk = ", ".join(q(c) for c in pk_cols)
            a(f"    , CONSTRAINT {q('PK_' + table)} PRIMARY KEY ({pk})")
        a(");")
        a("GO")
        a("")

    indexes = cur.execute(
        "SELECT name, tbl_name, sql FROM sqlite_master WHERE type='index' AND sql IS NOT NULL AND name NOT LIKE 'sqlite_%'"
    ).fetchall()
    table_set = set(tables)
    for name, tbl, sql in indexes:
        if tbl not in table_set or not sql:
            continue
        parsed = parse_index(sql)
        if not parsed:
            continue
        unique, inner, where = parsed
        idx_name = name[:120]
        a(
            f"IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'{idx_name}' AND object_id = OBJECT_ID(N'dbo.{tbl}'))"
        )
        stmt = f"    CREATE {unique}INDEX {q(idx_name)} ON {q(tbl)} ({inner})"
        if where:
            stmt += f" WHERE {where}"
        a(stmt + ";")
    if indexes:
        a("GO")
        a("")

    for table in tables:
        cols = meta[table]["cols"]
        names = [c[1] for c in cols]
        identity = has_identity(cols)
        rows = cur.execute(
            "SELECT " + ", ".join(q(n) for n in names) + f" FROM {q(table)}"
        ).fetchall()
        a(f"-- {table}: {len(rows)} filas")
        if not rows:
            a("")
            continue
        col_list = ", ".join(q(n) for n in names)
        if identity:
            a(f"SET IDENTITY_INSERT {q(table)} ON;")
        batch = []
        for row in rows:
            vals = ", ".join(lit(row[n]) for n in names)
            batch.append(f"INSERT INTO {q(table)} ({col_list}) VALUES ({vals});")
            if len(batch) >= 200:
                a("\n".join(batch))
                batch = []
        if batch:
            a("\n".join(batch))
        if identity:
            a(f"SET IDENTITY_INSERT {q(table)} OFF;")
            idcol = next((c[1] for c in cols if c[5]), names[0])
            a(
                f"DECLARE @max_{table} BIGINT; SELECT @max_{table} = ISNULL(MAX({q(idcol)}), 0) FROM {q(table)};"
            )
            a(
                f"IF @max_{table} > 0 DBCC CHECKIDENT (N'dbo.{table}', RESEED, @max_{table});"
            )
        a("GO")
        a("")

    fk_i = 0
    for table in tables:
        for fk in meta[table]["fks"]:
            fk_i += 1
            _id, seq, dest, frm, to, on_upd, on_del, _match = fk
            if seq != 0:
                continue
            on_delete = (on_del or "").upper()
            action = "NO ACTION"
            if on_delete == "CASCADE":
                action = "CASCADE"
            elif on_delete == "SET NULL":
                action = "SET NULL"
            elif on_delete == "SET DEFAULT":
                action = "SET DEFAULT"
            cname = f"FK_{table}_{frm}_{fk_i}"
            a(
                f"ALTER TABLE {q(table)} WITH NOCHECK ADD CONSTRAINT {q(cname)} "
                f"FOREIGN KEY ({q(frm)}) REFERENCES {q(dest)} ({q(to)}) ON DELETE {action};"
            )
    if fk_i:
        a("GO")
    a("")
    a("PRINT N'Volcado completado.';")
    OUT.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"OK {OUT} ({OUT.stat().st_size} bytes) tablas={len(tables)}")


if __name__ == "__main__":
    main()
