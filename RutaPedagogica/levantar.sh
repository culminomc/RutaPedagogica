#!/bin/sh
set -e
cd "$(dirname "$0")"

docker build -t rutapedagogica:prod .

docker stop rutapedagogica >/dev/null 2>&1 || true
docker rm rutapedagogica >/dev/null 2>&1 || true

docker run -d \
  --name rutapedagogica \
  --restart unless-stopped \
  -p 83:8000 \
  -e DJANGO_SETTINGS_MODULE=mysite.settings.production \
  -e MSSQL_HOST=10.1.9.113 \
  -e MSSQL_NAME=RutaPedagogica_Prod \
  -e MSSQL_USER=SA \
  -e MSSQL_PASSWORD='Davinci2024#' \
  -e 'MSSQL_DRIVER=ODBC Driver 18 for SQL Server' \
  -e ALLOWED_HOSTS=10.1.9.194,localhost,127.0.0.1 \
  -e CSRF_TRUSTED_ORIGINS=http://10.1.9.194:83 \
  -e WAGTAILADMIN_BASE_URL=http://10.1.9.194:83 \
  -v rutapedagogica_media:/app/media \
  rutapedagogica:prod

docker ps --filter name=rutapedagogica
echo "Sitio: http://10.1.9.194:83/"
echo "Admin: http://10.1.9.194:83/admin/"
echo "Logs:  docker logs -f rutapedagogica"
