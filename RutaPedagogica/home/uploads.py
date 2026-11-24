from django.template.defaultfilters import filesizeformat

VIDEO_EXTENSIONS = {"mp4", "webm", "mov", "mkv", "avi", "m4v"}


def get_ajustes():
    try:
        from home.models import AjustesSitio

        return AjustesSitio.load()
    except Exception:
        return None


def get_max_upload_bytes():
    ajustes = get_ajustes()
    if ajustes:
        return ajustes.video_max_bytes()
    return 200 * 1024 * 1024


def get_max_upload_legible():
    ajustes = get_ajustes()
    if ajustes:
        return ajustes.video_max_legible()
    return "200 MB"


def es_video(nombre):
    ext = (nombre or "").rsplit(".", 1)
    return len(ext) == 2 and ext[1].lower() in VIDEO_EXTENSIONS


def validar_archivo(archivo):
    """Devuelve un mensaje de error o None."""
    if archivo is None:
        return None
    max_bytes = get_max_upload_bytes()
    if archivo.size and archivo.size > max_bytes:
        return (
            f"El archivo pesa {filesizeformat(archivo.size)}. "
            f"El máximo configurado es {get_max_upload_legible()} "
            f"({filesizeformat(max_bytes)})."
        )
    return None
