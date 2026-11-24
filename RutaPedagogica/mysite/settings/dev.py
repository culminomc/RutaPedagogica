from .base import *
from mysite.sqlserver_config import DEFAULT_NAME_LOCAL, build_sqlserver_database

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = "django-insecure-+3(ria1!&g17)z-$2jm0pv*#v%trlbr^z!g%6e@9wr4nfk^eke"

# SECURITY WARNING: define the correct hosts in production!
ALLOWED_HOSTS = ["*"]

DATABASES = {
    "default": build_sqlserver_database(name=DEFAULT_NAME_LOCAL),
}

MAILERS = {
    "default": {
        "BACKEND": "django.core.mail.backends.console.EmailBackend",
    },
}

try:
    from .local import *
except ImportError:
    pass
