from django.contrib.auth.models import Group, Permission
from wagtail.models import Collection, GroupCollectionPermission, GroupPagePermission, Page


PERFILES = {
    "administrador": "Administradores",
    "editor": "Editores",
    "autor": "Autores",
}


def _permiso(codename, app="wagtailcore"):
    return Permission.objects.filter(codename=codename, content_type__app_label=app).first()


def asegurar_grupos():
    """Crea perfiles del panel: Administradores, Editores y Autores."""
    grupos = {}
    for clave, nombre in PERFILES.items():
        grupos[clave], _ = Group.objects.get_or_create(name=nombre)

    root = Page.get_first_root_node()
    coleccion = Collection.get_first_root_node()
    paginas = {
        "administrador": ["add_page", "change_page", "publish_page", "lock_page", "unlock_page", "delete_page"],
        "editor": ["add_page", "change_page", "publish_page", "lock_page", "unlock_page"],
        "autor": ["add_page", "change_page"],
    }
    for clave, codes in paginas.items():
        grupo = grupos[clave]
        if root is None:
            continue
        for code in codes:
            perm = _permiso(code)
            if perm:
                GroupPagePermission.objects.get_or_create(group=grupo, page=root, permission=perm)

    media_codes = [
        ("add_image", "wagtailimages"),
        ("change_image", "wagtailimages"),
        ("add_document", "wagtaildocs"),
        ("change_document", "wagtaildocs"),
        ("choose_document", "wagtaildocs"),
        ("choose_image", "wagtailimages"),
    ]
    if coleccion:
        for clave in PERFILES:
            grupo = grupos[clave]
            for code, app in media_codes:
                perm = _permiso(code, app)
                if perm:
                    GroupCollectionPermission.objects.get_or_create(
                        group=grupo, collection=coleccion, permission=perm
                    )
            if clave == "administrador":
                for code, app in [
                    ("delete_image", "wagtailimages"),
                    ("delete_document", "wagtaildocs"),
                ]:
                    perm = _permiso(code, app)
                    if perm:
                        GroupCollectionPermission.objects.get_or_create(
                            group=grupo, collection=coleccion, permission=perm
                        )
    return grupos
