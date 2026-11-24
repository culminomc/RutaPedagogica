from django.contrib import messages
from django.shortcuts import redirect

from home.permisos import es_visor


class VisorSoloLecturaMiddleware:
    """El perfil Visor puede recorrer el panel, pero no guardar cambios."""

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        user = getattr(request, "user", None)
        if (
            request.method not in ("GET", "HEAD", "OPTIONS")
            and request.path.startswith("/admin/")
            and user
            and user.is_authenticated
            and es_visor(user)
            and not request.path.rstrip("/").endswith("/logout")
        ):
            messages.error(request, "El perfil Visor solo puede consultar. No puede guardar cambios.")
            return redirect("/admin/")
        return self.get_response(request)
