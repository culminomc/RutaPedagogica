#!/bin/sh
set -e
mkdir -p /app/media
chown -R wagtail:wagtail /app/media || true
python manage.py migrate --noinput
exec gunicorn --bind "0.0.0.0:${PORT:-8000}" --workers 3 --timeout 120 mysite.wsgi:application
