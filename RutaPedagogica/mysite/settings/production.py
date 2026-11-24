import os

from .base import *
from mysite.sqlserver_config import DEFAULT_NAME_PROD, build_sqlserver_database

DEBUG = False

SECRET_KEY = os.environ.get(
    "SECRET_KEY",
    os.environ.get(
        "DJANGO_SECRET_KEY",
        "django-insecure-+3(ria1!&g17)z-$2jm0pv*#v%trlbr^z!g%6e@9wr4nfk^eke",
    ),
)

ALLOWED_HOSTS = [
    h.strip()
    for h in os.environ.get("ALLOWED_HOSTS", "*").split(",")
    if h.strip()
]

CSRF_TRUSTED_ORIGINS = [
    o.strip()
    for o in os.environ.get("CSRF_TRUSTED_ORIGINS", "http://10.1.9.194:83").split(",")
    if o.strip()
]

WAGTAILADMIN_BASE_URL = os.environ.get("WAGTAILADMIN_BASE_URL", "http://10.1.9.194:83")

SECURE_PROXY_SSL_HEADER = ("HTTP_X_FORWARDED_PROTO", "https")

MIDDLEWARE = [
    MIDDLEWARE[0],
    "whitenoise.middleware.WhiteNoiseMiddleware",
    *MIDDLEWARE[1:],
]

DATABASES = {
    "default": build_sqlserver_database(
        name=os.environ.get("MSSQL_NAME", DEFAULT_NAME_PROD),
        default_name=DEFAULT_NAME_PROD,
    ),
}

# ManifestStaticFilesStorage is recommended in production, to prevent
# outdated JavaScript / CSS assets being served from cache
# (e.g. after a Wagtail upgrade).
# See https://docs.djangoproject.com/en/5.2/ref/contrib/staticfiles/#manifeststaticfilesstorage
STORAGES["staticfiles"]["BACKEND"] = "whitenoise.storage.CompressedStaticFilesStorage"

try:
    from .local import *
except ImportError:
    pass
