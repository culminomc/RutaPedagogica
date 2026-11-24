import os

from django.core.exceptions import ImproperlyConfigured

from .base import *
from mysite.sqlserver_config import build_sqlserver_database

DATABASES = {
    "default": build_sqlserver_database(
        name=os.environ.get("MSSQL_NAME"),
    ),
}

if not DATABASES["default"].get("NAME"):
    raise ImproperlyConfigured(
        "Falta MSSQL_NAME. Definí las variables MSSQL_HOST, MSSQL_NAME, "
        "MSSQL_USER y MSSQL_PASSWORD (o MSSQL_TRUSTED=1)."
    )
