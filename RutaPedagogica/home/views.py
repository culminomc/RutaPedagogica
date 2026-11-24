from django.shortcuts import redirect
from django.views.decorators.http import require_POST

from home.models import CITY_CHOICES, Consulta


@require_POST
def enviar_consulta(request):
    ciudades = {value for value, _label in CITY_CHOICES}
    ciudad = request.POST.get("ciudad", "")
    if ciudad not in ciudades:
        ciudad = "Ushuaia"
    Consulta.objects.create(
        nombre=request.POST.get("nombre", "").strip()[:160],
        ciudad=ciudad,
        email=request.POST.get("email", "").strip()[:254],
        institucion=request.POST.get("institucion", "").strip()[:180],
        mensaje=request.POST.get("mensaje", "").strip(),
    )
    return redirect("/?enviado=1#contacto")
