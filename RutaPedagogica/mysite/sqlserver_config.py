"""Configuración de conexión a SQL Server vía variables de entorno o argumentos."""

import os

DEFAULT_HOST = "10.1.9.113"
DEFAULT_USER = "SA"
DEFAULT_PASSWORD = "Davinci2024#"
DEFAULT_NAME_LOCAL = "RutaPedagogica_Test"
DEFAULT_NAME_PROD = "RutaPedagogica_Prod"


def default_odbc_driver():
    env = (os.environ.get("MSSQL_DRIVER") or "").strip()
    if env:
        return env
    try:
        import pyodbc

        installed = pyodbc.drivers()
    except Exception:
        installed = []
    for name in (
        "ODBC Driver 18 for SQL Server",
        "ODBC Driver 17 for SQL Server",
        "SQL Server",
    ):
        if name in installed:
            return name
    return "ODBC Driver 17 for SQL Server"


def build_sqlserver_database(
    host=None,
    port=None,
    name=None,
    user=None,
    password=None,
    driver=None,
    trusted=False,
    default_name=None,
):
    host = host or os.environ.get("MSSQL_HOST", DEFAULT_HOST)
    port = "" if port in (None, "", 0) else str(port)
    if not port:
        port = os.environ.get("MSSQL_PORT", "")
    name = name or os.environ.get("MSSQL_NAME") or default_name or DEFAULT_NAME_LOCAL
    user = user if user is not None else os.environ.get("MSSQL_USER", DEFAULT_USER)
    password = (
        password if password is not None else os.environ.get("MSSQL_PASSWORD", DEFAULT_PASSWORD)
    )
    driver = driver or default_odbc_driver()
    trusted = trusted or os.environ.get("MSSQL_TRUSTED", "").lower() in {"1", "true", "yes", "si"}

    extra = "TrustServerCertificate=yes;Encrypt=yes"
    config = {
        "ENGINE": "mssql",
        "NAME": name,
        "HOST": host,
        "PORT": port,
        "OPTIONS": {
            "driver": driver,
            "extra_params": extra,
        },
    }
    if trusted or not user:
        config["OPTIONS"]["extra_params"] = extra + ";Trusted_Connection=yes"
    else:
        config["USER"] = user
        config["PASSWORD"] = password
    return config


def pyodbc_conn_str(database, host=None, port=None, user=None, password=None, driver=None, trusted=False):
    cfg = build_sqlserver_database(
        host=host, port=port, name=database, user=user, password=password, driver=driver, trusted=trusted
    )
    server = cfg["HOST"]
    if cfg.get("PORT"):
        server = f"{server},{cfg['PORT']}"
    parts = [
        f"DRIVER={{{cfg['OPTIONS']['driver']}}}",
        f"SERVER={server}",
        f"DATABASE={database}",
        "TrustServerCertificate=yes",
        "Encrypt=yes",
    ]
    if "USER" in cfg:
        parts.append(f"UID={cfg['USER']}")
        parts.append(f"PWD={cfg['PASSWORD']}")
    else:
        parts.append("Trusted_Connection=yes")
    return ";".join(parts)
