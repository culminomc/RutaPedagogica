#!/usr/bin/env python
"""Copia todas las tablas y datos de SQLite a SQL Server.

Ejemplo:
  env\\Scripts\\python.exe migrar_a_sqlserver.py --host 10.1.9.113 --name RutaPedagogica --user SA --password *****
"""

import os
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
os.chdir(ROOT)
sys.path.insert(0, str(ROOT))
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mysite.settings.dev")

from django.core.management import execute_from_command_line

execute_from_command_line(["manage.py", "migrar_sqlserver", *sys.argv[1:]])
