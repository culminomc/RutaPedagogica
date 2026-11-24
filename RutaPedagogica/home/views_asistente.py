import json

from django.contrib.admin.views.decorators import staff_member_required
from django.http import JsonResponse
from django.views.decorators.http import require_http_methods

from home.asistente import procesar


@staff_member_required
@require_http_methods(["POST"])
def chat_asistente(request):
    archivo = request.FILES.get("archivo")
    if archivo is not None:
        mensaje = request.POST.get("mensaje", "")
        data = procesar(request, mensaje, archivo=archivo)
        return JsonResponse(data)

    try:
        payload = json.loads(request.body.decode("utf-8") or "{}")
    except json.JSONDecodeError:
        payload = {}
    mensaje = payload.get("mensaje") or request.POST.get("mensaje", "")
    data = procesar(request, mensaje)
    return JsonResponse(data)
