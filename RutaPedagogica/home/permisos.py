from django.contrib.auth.models import Group, Permission
from wagtail.models import Collection, GroupCollectionPermission, GroupPagePermission, Page


PERFILES = {
    "administrador": "Administradores",
    "carga": "Carga",
    "visor": "Visores",
}

PERFILES_VIEJOS = ("Editores", "Autores")


def _permiso(codename, app="wagtailcore"):
    return Permission.objects.filter(codename=codename, content_type__app_label=app).first()


def perfil_de(user):
    if not getattr(user, "is_authenticated", False) or not getattr(user, "pk", None):
        return None
    if user.is_superuser:
        return "administrador"
    nombres = set(user.groups.values_list("name", flat=True))
    for clave, nombre in PERFILES.items():
        if nombre in nombres:
            return clave
    return None


def es_visor(user):
    return perfil_de(user) == "visor"


def asegurar_grupos():
    """Crea los tres perfiles: Administrador, Carga y Visor."""
    grupos = {}
    for clave, nombre in PERFILES.items():
        grupos[clave], _ = Group.objects.get_or_create(name=nombre)

    acceso = _permiso("access_admin", "wagtailadmin")
    if acceso:
        for grupo in grupos.values():
            grupo.permissions.add(acceso)

    for code in ("add_user", "change_user", "delete_user", "view_user"):
        perm = _permiso(code, "auth")
        if perm:
            grupos["administrador"].permissions.add(perm)

    root = Page.get_first_root_node()
    paginas = {
        "administrador": [
            "add_page",
            "change_page",
            "publish_page",
            "lock_page",
            "unlock_page",
            "delete_page",
        ],
        "carga": ["add_page", "change_page", "publish_page", "lock_page", "unlock_page"],
        "visor": ["change_page"],
    }
    if root is not None:
        for clave, codes in paginas.items():
            grupo = grupos[clave]
            for code in codes:
                perm = _permiso(code)
                if perm:
                    GroupPagePermission.objects.get_or_create(group=grupo, page=root, permission=perm)
        borrar = _permiso("delete_page")
        if borrar:
            GroupPagePermission.objects.filter(
                group__in=[grupos["carga"], grupos["visor"]],
                permission=borrar,
            ).delete()
        for code in ("add_page", "publish_page", "lock_page", "unlock_page"):
            perm = _permiso(code)
            if perm:
                GroupPagePermission.objects.filter(group=grupos["visor"], permission=perm).delete()

    coleccion = Collection.get_first_root_node()
    if coleccion:
        ver = [
            ("choose_image", "wagtailimages"),
            ("change_image", "wagtailimages"),
            ("choose_document", "wagtaildocs"),
            ("change_document", "wagtaildocs"),
        ]
        cargar = ver + [
            ("add_image", "wagtailimages"),
            ("add_document", "wagtaildocs"),
        ]
        administrar = cargar + [
            ("delete_image", "wagtailimages"),
            ("delete_document", "wagtaildocs"),
        ]
        por_perfil = {
            "visor": ver,
            "carga": cargar,
            "administrador": administrar,
        }
        for clave, codes in por_perfil.items():
            grupo = grupos[clave]
            for code, app in codes:
                perm = _permiso(code, app)
                if perm:
                    GroupCollectionPermission.objects.get_or_create(
                        group=grupo, collection=coleccion, permission=perm
                    )
        for code, app in (("add_image", "wagtailimages"), ("add_document", "wagtaildocs"), ("delete_image", "wagtailimages"), ("delete_document", "wagtaildocs")):
            perm = _permiso(code, app)
            if perm:
                GroupCollectionPermission.objects.filter(group=grupos["visor"], permission=perm).delete()
        for code, app in (("delete_image", "wagtailimages"), ("delete_document", "wagtaildocs")):
            perm = _permiso(code, app)
            if perm:
                GroupCollectionPermission.objects.filter(group=grupos["carga"], permission=perm).delete()
    return grupos


def aplicar_perfil(user, clave):
    if clave not in PERFILES:
        clave = "carga"
    grupos = asegurar_grupos()
    user.is_staff = True
    user.is_superuser = clave == "administrador"
    user.save()
    quitar = list(grupos.values()) + list(Group.objects.filter(name__in=PERFILES_VIEJOS))
    user.groups.remove(*quitar)
    user.groups.add(grupos[clave])
    return user
