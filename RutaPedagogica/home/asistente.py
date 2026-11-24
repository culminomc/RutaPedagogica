import re
import unicodedata

from django.contrib.auth import get_user_model
from django.utils.text import slugify
from wagtail.documents import get_document_model
from wagtail.images import get_image_model
from wagtail.models import Page

from home.models import AjustesSitio, ContenidoPage, HomePage
from home.permisos import PERFILES, asegurar_grupos
from home.uploads import get_max_upload_legible, validar_archivo

SESSION_KEY = "asistente_flujo"
User = get_user_model()

CHIPS_INICIO = [
    "Crear una página",
    "Subir imagen o video",
    "Administrar usuarios",
    "Límite de videos",
    "Editar la portada",
    "Ver consultas",
]


def _norm(texto):
    texto = unicodedata.normalize("NFD", (texto or "").lower())
    return "".join(c for c in texto if unicodedata.category(c) != "Mn")


def _msg(texto, pasos=None, enlaces=None, chips=None, subir=False):
    return {
        "texto": texto,
        "pasos": pasos or [],
        "enlaces": enlaces or [],
        "chips": chips if chips is not None else CHIPS_INICIO,
        "subir": subir,
    }


def _estado(request):
    return request.session.get(SESSION_KEY) or {}


def _guardar(request, estado):
    request.session[SESSION_KEY] = estado
    request.session.modified = True


def _reset(request):
    request.session[SESSION_KEY] = {}
    request.session.modified = True


def _es_cancelar(texto):
    n = _norm(texto)
    return n in {"cancelar", "cancelá", "cancela", "salir", "volver", "menu", "inicio"} or "cancelar" in n


def procesar(request, mensaje, archivo=None):
    texto = (mensaje or "").strip()
    if archivo is not None:
        return _subir_archivo(request, archivo, texto)

    if not texto:
        return _bienvenida()

    if _es_cancelar(texto):
        _reset(request)
        return _msg("Listo, cancelé el trámite. ¿En qué seguimos?", chips=CHIPS_INICIO)

    estado = _estado(request)
    flujo = estado.get("flujo")
    if flujo == "crear_pagina":
        return _flujo_pagina(request, texto, estado)
    if flujo == "crear_usuario":
        return _flujo_usuario(request, texto, estado)
    if flujo == "config_video":
        return _flujo_video(request, texto, estado)

    return _enrutar(request, texto)


def _bienvenida():
    return _msg(
        "Soy el asistente del panel de Rutas Pedagógicas. Puedo guiarte y también hacer las tareas: "
        "crear páginas, cargar imágenes o videos, administrar usuarios y cambiar el límite de carga. "
        "Decime qué necesitás, o elegí una opción.",
        pasos=[
            "Crear o editar páginas sin tocar código.",
            "Subir, reemplazar o borrar imágenes, documentos y videos.",
            "Crear, editar, desactivar o eliminar usuarios con perfiles.",
            "Configurar el tamaño máximo de los videos.",
        ],
    )


def _enrutar(request, texto):
    n = _norm(texto)

    if any(p in n for p in ("crear pagina", "nueva pagina", "agregar pagina", "crear una pagina")):
        return _iniciar_pagina(request)
    if any(p in n for p in ("editar pagina", "modificar pagina", "cambiar contenido", "editar la portada", "portada")):
        return _ayuda_editar(n)
    if any(p in n for p in ("subir", "imagen", "video", "documento", "multimedia", "archivo", "media")):
        return _ayuda_media()
    if any(p in n for p in ("usuario", "usuarios", "permiso", "perfil", "desactivar", "eliminar usuario")):
        if "crear" in n or "nuevo" in n or "alta" in n:
            return _iniciar_usuario(request)
        return _ayuda_usuarios(n)
    if any(
        p in n
        for p in (
            "limite de video",
            "limite de videos",
            "tamano de video",
            "carga de video",
            "maximo de video",
        )
    ) or re.search(r"\d+\s*(mb|gb)\b", n):
        return _iniciar_video(request, texto)
    if "consulta" in n:
        return _msg(
            "Las consultas del formulario público están en Consultas de Vinculación Educativa. "
            "Ahí marcás si ya las gestionaste.",
            enlaces=[{"label": "Abrir consultas", "url": "/admin/snippets/home/consulta/"}],
        )
    if "ayuda" in n or "que podes" in n or "qué podés" in texto.lower() or n in {"hola", "buenas", "hey"}:
        return _bienvenida()
    if "publicar" in n:
        return _msg(
            "Después de editar una página, arriba a la derecha está Publicar. "
            "Si solo guardás borrador, el sitio público no cambia.",
            enlaces=[{"label": "Páginas del sitio", "url": "/admin/pages/"}],
        )

    return _msg(
        "Te puedo ayudar con páginas, archivos, usuarios o el límite de videos. "
        "Probá con una de estas opciones o escribí, por ejemplo: «crear una página sobre talleres».",
    )


def _iniciar_pagina(request):
    _guardar(request, {"flujo": "crear_pagina", "paso": 1, "datos": {}})
    return _msg(
        "Vamos a crear una página nueva, paso a paso. ¿Cuál es el título?",
        pasos=["1. Título", "2. Bajada (resumen corto)", "3. Texto principal", "4. Confirmar y publicar"],
        chips=["Cancelar"],
    )


def _flujo_pagina(request, texto, estado):
    paso = estado.get("paso", 1)
    datos = estado.get("datos") or {}
    if paso == 1:
        datos["title"] = texto[:180]
        estado.update({"paso": 2, "datos": datos})
        _guardar(request, estado)
        return _msg(
            f"Título listo: «{datos['title']}». Ahora escribí una bajada corta (o decí «sin bajada»).",
            chips=["Sin bajada", "Cancelar"],
        )
    if paso == 2:
        datos["intro"] = "" if _norm(texto) in {"sin bajada", "no", "ninguna"} else texto[:500]
        estado.update({"paso": 3, "datos": datos})
        _guardar(request, estado)
        return _msg(
            "Ahora el contenido principal: párrafos, listas o lo que quieras publicar. Después vas a poder sumar imágenes y videos.",
            chips=["Cancelar"],
        )
    if paso == 3:
        datos["cuerpo"] = f"<p>{texto}</p>"
        estado.update({"paso": 4, "datos": datos})
        _guardar(request, estado)
        return _msg(
            f"Revisá: título «{datos['title']}». Si está bien, escribí «publicar». Si querés dejarla en borrador, escribí «borrador».",
            chips=["Publicar", "Borrador", "Cancelar"],
        )
    if paso == 4:
        publicar = "borrador" not in _norm(texto)
        return _crear_pagina(request, datos, publicar)
    return _iniciar_pagina(request)


def _crear_pagina(request, datos, publicar=True):
    home = HomePage.objects.first()
    if home is None:
        _reset(request)
        return _msg("No encontré la portada. Abrí Páginas y creá primero el sitio raíz.")
    slug = slugify(datos["title"], allow_unicode=True) or "nueva-pagina"
    base = slug
    n = 2
    while Page.objects.filter(slug=slug).exists():
        slug = f"{base}-{n}"
        n += 1
    page = ContenidoPage(
        title=datos["title"],
        slug=slug,
        intro=datos.get("intro") or "",
        cuerpo=datos.get("cuerpo") or "<p></p>",
        live=False,
    )
    home.add_child(instance=page)
    revision = page.save_revision(user=request.user)
    if publicar:
        revision.publish(user=request.user)
        estado_txt = "publicada"
    else:
        estado_txt = "guardada como borrador"
    _reset(request)
    edit = f"/admin/pages/{page.id}/edit/"
    return _msg(
        f"La página «{page.title}» quedó {estado_txt}. "
        "En el editor podés agregar imagen de portada, un video de YouTube o un archivo MP4, y más secciones.",
        pasos=[
            "Imagen: campo Imagen principal o el botón de imagen en el texto.",
            "Video de YouTube/Vimeo: campo Video embebido.",
            "Video propio: subilo en Documentos (ojo el tamaño máximo) y elegilo en Archivo de video.",
            "Diseño: el tipo Página de contenido usa la identidad del sitio. No hace falta código.",
        ],
        enlaces=[
            {"label": "Seguir editando la página", "url": edit},
            {"label": "Verla en el sitio", "url": page.url or "/"},
        ],
    )


def _ayuda_editar(n):
    home = HomePage.objects.first()
    enlaces = [{"label": "Todas las páginas", "url": "/admin/pages/"}]
    if home:
        enlaces.insert(0, {"label": "Editar la portada", "url": f"/admin/pages/{home.id}/edit/"})
    return _msg(
        "Para cambiar textos, fotos o bloques: abrí la página, editá los campos y pulsá Publicar. "
        "Si me pedís «crear una página», la armo con vos acá mismo.",
        pasos=[
            "Portada: menú Páginas → Rutas Pedagógicas (o el botón de abajo).",
            "Rutas: en el menú, Ruta: Videojuego / Datos e IA / Biotecnología.",
            "Descubrí más: ítem Descubrí más.",
            "Páginas nuevas: las creás conmigo o con Páginas → Agregar.",
        ],
        enlaces=enlaces,
        chips=["Crear una página", "Subir imagen o video"] + CHIPS_INICIO[2:],
    )


def _ayuda_media():
    return _msg(
        "Los archivos se gestionan desde el panel, sin código. Podés subirlos acá mismo: adjuntá el archivo en el clip del chat.",
        pasos=[
            f"Videos: máximo {get_max_upload_legible()} (lo cambiás en Ajustes o pidiéndome «límite de videos»).",
            "Imágenes: menú Imágenes. Documentos y videos: menú Documentos.",
            "Para reemplazar: abrí el archivo y cargá uno nuevo. Para borrar: menú del ítem → Eliminar.",
            "Después, en cada página, elegí la imagen o el documento en el campo correspondiente.",
        ],
        enlaces=[
            {"label": "Imágenes", "url": "/admin/images/"},
            {"label": "Documentos y videos", "url": "/admin/documents/"},
            {"label": "Ajustes de carga", "url": "/admin/settings/home/ajustessitio/"},
        ],
        chips=["Límite de videos", "Crear una página"],
        subir=True,
    )


def _subir_archivo(request, archivo, titulo=""):
    error = validar_archivo(archivo)
    if error:
        return _msg(error, chips=CHIPS_INICIO, subir=True)
    nombre = archivo.name or "archivo"
    titulo = (titulo or "").strip() or nombre.rsplit(".", 1)[0]
    from wagtail.models import Collection

    from home.uploads import es_video

    coleccion = Collection.get_first_root_node()
    if nombre.lower().endswith((".png", ".jpg", ".jpeg", ".gif", ".webp")):
        Image = get_image_model()
        obj = Image(title=titulo, collection=coleccion)
        obj.file.save(nombre, archivo, save=True)
        url = f"/admin/images/{obj.id}/"
        tipo = "imagen"
    else:
        Document = get_document_model()
        obj = Document(title=titulo, collection=coleccion)
        obj.file.save(nombre, archivo, save=True)
        url = f"/admin/documents/{obj.id}/"
        tipo = "video" if es_video(nombre) else "documento"
    return _msg(
        f"Subí el {tipo} «{obj.title}». Ya está en la biblioteca. "
        "Abrilo para reemplazarlo o, si es un video, asignalo en el campo Archivo de video de una página.",
        enlaces=[{"label": f"Abrir {tipo}", "url": url}],
        chips=CHIPS_INICIO,
        subir=True,
    )


def _ayuda_usuarios(n):
    asegurar_grupos()
    if "listar" in n or "ver" in n or "quienes" in n:
        return _listar_usuarios()
    return _msg(
        "Desde Usuarios creás cuentas del panel. Hay tres perfiles: Administrador, Carga y Visor. "
        "También puedo dar de alta a alguien si me decís «crear usuario».",
        pasos=[
            "Administrador: crea cuentas y administra todo el sitio.",
            "Carga: sube y publica páginas, imágenes y videos.",
            "Visor: entra al panel y consulta, sin poder guardar cambios.",
            "Para desactivar: no borres de entrada, pedime «desactivar usuario NOMBRE».",
        ],
        enlaces=[{"label": "Usuarios", "url": "/admin/users/"}],
        chips=["Crear usuario", "Listar usuarios", "Cancelar"],
    )


def _listar_usuarios():
    filas = []
    for u in User.objects.order_by("username")[:20]:
        estado = "activo" if u.is_active else "desactivado"
        rol = "administrador" if u.is_superuser else ", ".join(g.name for g in u.groups.all()) or "sin perfil"
        filas.append(f"{u.username} · {rol} · {estado}")
    texto = "Usuarios actuales:\n" + "\n".join(filas) if filas else "Todavía no hay usuarios además del sistema."
    return _msg(texto, enlaces=[{"label": "Administrar usuarios", "url": "/admin/users/"}])


def _iniciar_usuario(request):
    _guardar(request, {"flujo": "crear_usuario", "paso": 1, "datos": {}})
    return _msg(
        "Alta de usuario. ¿Qué nombre de usuario querés? (sin espacios)",
        pasos=["1. Usuario", "2. Correo", "3. Contraseña", "4. Perfil", "5. Confirmar"],
        chips=["Cancelar"],
    )


def _flujo_usuario(request, texto, estado):
    paso = estado.get("paso", 1)
    datos = estado.get("datos") or {}
    if paso == 1:
        username = re.sub(r"\s+", "", texto)
        if User.objects.filter(username__iexact=username).exists():
            return _msg("Ese usuario ya existe. Probá otro nombre.", chips=["Cancelar"])
        datos["username"] = username
        estado.update({"paso": 2, "datos": datos})
        _guardar(request, estado)
        return _msg("¿Cuál es el correo?", chips=["Cancelar"])
    if paso == 2:
        datos["email"] = texto.strip()
        estado.update({"paso": 3, "datos": datos})
        _guardar(request, estado)
        return _msg("Definí una contraseña (mínimo 8 caracteres).", chips=["Cancelar"])
    if paso == 3:
        if len(texto) < 8:
            return _msg("La contraseña tiene que tener al menos 8 caracteres.", chips=["Cancelar"])
        datos["password"] = texto
        estado.update({"paso": 4, "datos": datos})
        _guardar(request, estado)
        return _msg(
            "¿Qué perfil? Administrador, Carga o Visor.",
            chips=["Administrador", "Carga", "Visor", "Cancelar"],
        )
    if paso == 4:
        n = _norm(texto)
        perfil = "carga"
        if "admin" in n:
            perfil = "administrador"
        elif "visor" in n or "ver" in n:
            perfil = "visor"
        datos["perfil"] = perfil
        estado.update({"paso": 5, "datos": datos})
        _guardar(request, estado)
        return _msg(
            f"Voy a crear {datos['username']} como {perfil}. Escribí «confirmar».",
            chips=["Confirmar", "Cancelar"],
        )
    if paso == 5:
        if "confirma" not in _norm(texto) and _norm(texto) != "si" and _norm(texto) != "sí":
            return _msg("Escribí «confirmar» o «cancelar».", chips=["Confirmar", "Cancelar"])
        return _crear_usuario(request, datos)
    return _iniciar_usuario(request)


def _crear_usuario(request, datos):
    if not request.user.is_superuser:
        _reset(request)
        return _msg("Solo un administrador puede crear usuarios.")
    grupos = asegurar_grupos()
    user = User.objects.create_user(
        username=datos["username"],
        email=datos.get("email") or "",
        password=datos["password"],
    )
    user.is_staff = True
    perfil = datos.get("perfil") or "editor"
    if perfil == "administrador":
        user.is_superuser = True
    user.save()
    grupo = grupos.get(perfil)
    if grupo:
        user.groups.add(grupo)
    _reset(request)
    return _msg(
        f"Usuario {user.username} creado con perfil {PERFILES.get(perfil, perfil)}. Ya puede entrar a /admin/.",
        enlaces=[{"label": "Ver usuarios", "url": "/admin/users/"}],
    )


def _iniciar_video(request, texto=""):
    parsed = _parse_tamano(texto)
    if parsed:
        return _guardar_limite(request, *parsed)
    _guardar(request, {"flujo": "config_video", "paso": 1, "datos": {}})
    return _msg(
        f"Hoy el máximo de video es {get_max_upload_legible()}. "
        "Escribí el nuevo tope, por ejemplo «300 MB» o «1 GB». "
        "No puede pasar el techo del servidor (por defecto 2 GB).",
        chips=["100 MB", "200 MB", "500 MB", "1 GB", "Cancelar"],
    )


def _flujo_video(request, texto, estado):
    parsed = _parse_tamano(texto)
    if not parsed:
        return _msg("No entendí el tamaño. Probá con «200 MB» o «1 GB».", chips=["200 MB", "500 MB", "1 GB", "Cancelar"])
    return _guardar_limite(request, *parsed)


def _parse_tamano(texto):
    n = _norm(texto).replace(",", ".")
    match = re.search(r"(\d+(?:\.\d+)?)\s*(gb|mb|giga|mega)?", n)
    if not match:
        return None
    valor = float(match.group(1))
    unidad = (match.group(2) or "mb").lower()
    if unidad.startswith("g"):
        return int(valor) if valor >= 1 else 1, "GB"
    return int(valor) if valor >= 1 else 1, "MB"


def _guardar_limite(request, valor, unidad):
    if not request.user.is_superuser and not request.user.is_staff:
        return _msg("No tenés permiso para cambiar este ajuste.")
    ajustes = AjustesSitio.load()
    ajustes.video_max_valor = valor
    ajustes.video_max_unidad = unidad
    ajustes.save()
    _reset(request)
    return _msg(
        f"Quedó configurado: máximo {valor} {unidad} por video. "
        f"El techo técnico del servidor es {ajustes.techo_servidor_mb} MB; si el hosting corta antes, hay que subirlo ahí también.",
        enlaces=[{"label": "Ajustes de carga", "url": "/admin/settings/home/ajustessitio/"}],
    )


def _desactivar_usuario(request, texto):
    n = _norm(texto)
    match = re.search(r"(desactivar|eliminar|borrar)\s+usuario\s+(\S+)", n)
    if not match:
        return None
    username = match.group(2)
    accion = match.group(1)
    if not request.user.is_superuser:
        return _msg("Solo un administrador puede desactivar o borrar usuarios.")
    user = User.objects.filter(username__iexact=username).first()
    if user is None:
        return _msg(f"No encontré el usuario {username}.")
    if user.pk == request.user.pk:
        return _msg("No podés desactivarte a vos mismo.")
    if accion == "desactivar":
        user.is_active = False
        user.save()
        return _msg(f"{user.username} quedó desactivado. Ya no puede entrar.")
    user.delete()
    return _msg(f"Eliminé el usuario {username}.")


# Enrutar desactivar antes del flujo genérico
_enrutar_original = _enrutar


def _enrutar(request, texto):
    extra = _desactivar_usuario(request, texto)
    if extra:
        return extra
    n = _norm(texto)
    if n in {"listar usuarios", "ver usuarios"}:
        return _listar_usuarios()
    if n == "crear usuario":
        return _iniciar_usuario(request)
    return _enrutar_original(request, texto)
