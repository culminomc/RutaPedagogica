
# This stage installs build dependencies and compiles Python packages.
# It will be discarded in the final image, keeping only the compiled packages.
FROM python:3.14-slim-bookworm AS builder

# Install system packages required to build Python packages.
RUN apt-get update --yes --quiet && apt-get install --yes --quiet --no-install-recommends \
    build-essential \
    unixodbc-dev \
    libpq-dev \
    libmariadb-dev \
    libjpeg62-turbo-dev \
    zlib1g-dev \
    libwebp-dev \
 && rm -rf /var/lib/apt/lists/* \
 && python -m venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

# Install the project requirements.
COPY requirements.txt /
RUN pip install -r /requirements.txt

# Install the application server.
RUN pip install "gunicorn==25.1.0"


# RUNTIME STAGE
# Use an official Python runtime based on Debian 12 "bookworm" as a parent image.
FROM python:3.14-slim-bookworm AS runtime

# Install runtime system packages required by Wagtail, Django and SQL Server.
RUN apt-get update --yes --quiet && apt-get install --yes --quiet --no-install-recommends \
    curl \
    gnupg2 \
    apt-transport-https \
    ca-certificates \
    unixodbc \
    libpq5 \
    libmariadb3 \
    libjpeg62-turbo \
    libwebp7 \
 && curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg \
 && echo "deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/microsoft-prod.gpg] https://packages.microsoft.com/debian/12/prod bookworm main" > /etc/apt/sources.list.d/mssql-release.list \
 && apt-get update --yes --quiet \
 && ACCEPT_EULA=Y apt-get install --yes --quiet --no-install-recommends msodbcsql18 \
 && rm -rf /var/lib/apt/lists/*

# Add user that will be used in the container.
RUN useradd wagtail

# Port used by this container to serve HTTP.
EXPOSE 8000

# Local (manage.py / runserver) usa RutaPedagogica_Test.
# Esta imagen de deploy apunta a RutaPedagogica_Prod.
# El # de la contraseña debe ir entre comillas: en un Dockerfile inicia un comentario.
ENV PYTHONUNBUFFERED=1 \
    PORT=8000 \
    PATH="/opt/venv/bin:$PATH" \
    DJANGO_SETTINGS_MODULE=mysite.settings.production \
    MSSQL_HOST=10.1.9.113 \
    MSSQL_NAME=RutaPedagogica_Prod \
    MSSQL_USER=SA \
    MSSQL_PASSWORD="Davinci2024#" \
    MSSQL_DRIVER="ODBC Driver 18 for SQL Server" \
    ALLOWED_HOSTS=10.1.9.194,localhost,127.0.0.1 \
    CSRF_TRUSTED_ORIGINS=http://10.1.9.194 \
    WAGTAILADMIN_BASE_URL=http://10.1.9.194



# Copy the virtual environment from the builder stage.
COPY --from=builder /opt/venv /opt/venv

# Use /app folder as a directory where the source code is stored.
WORKDIR /app

# Set this directory to be owned by the "wagtail" user.
RUN chown wagtail:wagtail /app

# Copy the source code of the project into the container.
COPY --chown=wagtail:wagtail . .

# Collect static files as the app user, then run as root so el volumen
# de media se pueda crear y gunicorn escuche en 0.0.0.0.
USER wagtail
RUN python manage.py collectstatic --noinput --clear
USER root
RUN mkdir -p /app/media && chown -R wagtail:wagtail /app/media

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
