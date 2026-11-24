from django.templatetags.static import static
from django.urls import path, reverse
from django.utils.html import format_html
from django.utils.safestring import mark_safe

from wagtail import hooks
from wagtail.admin.menu import MenuItem
from wagtail.admin.ui.sidebar import ActionMenuItem as SidebarActionMenuItem
from wagtail.admin.ui.components import Component

from home import views_asistente


class GuiaPanel(Component):
    order = 10

    def render_html(self, parent_context):
        return mark_safe(
            """
            <section class="rp-admin-guide">
                <h2>Cómo editar el sitio</h2>
                <p>Desde acá se administra toda la página pública. No hace falta tocar código.</p>
                <ol>
                    <li><strong>Asistente:</strong> el botón naranja de la esquina inferior derecha. Pedile en castellano que cree una página, suba un video o dé de alta un usuario.</li>
                    <li><strong>Portada:</strong> Páginas → Rutas Pedagógicas. Título, cifras, escuelas, biblioteca y contacto.</li>
                    <li><strong>Las 3 rutas:</strong> en el menú lateral, “Ruta: Videojuego”, “Ruta: Datos e IA” y “Ruta: Biotecnología”. Cada una tiene su página pública. Después de editar, pulsá Publicar.</li>
                    <li><strong>Descubrí más:</strong> menú lateral → Descubrí más. Ese es el contenido del botón naranja de la portada.</li>
                    <li><strong>Archivos:</strong> Imágenes y Documentos (incluye videos). El tamaño máximo se cambia en Ajustes de carga y videos.</li>
                    <li><strong>Usuarios:</strong> Configuración → Usuarios. Al crear una cuenta elegí el perfil: Administrador, Carga o Visor.</li>
                    <li><strong>Consultas del formulario:</strong> Consultas de Vinculación Educativa.</li>
                </ol>
            </section>
            """
        )


@hooks.register("construct_homepage_panels")
def agregar_guia(request, panels):
    panels.append(GuiaPanel())


@hooks.register("insert_global_admin_css")
def css_del_admin():
    return format_html(
        '<link rel="stylesheet" href="{}?v=aif6"><link rel="stylesheet" href="{}?v=aif1">',
        static("css/admin.css"),
        static("css/asistente.css"),
    )


@hooks.register("insert_global_admin_js")
def js_del_admin():
    salir = reverse("wagtailadmin_logout")
    return mark_safe(
        f'<script src="{static("js/asistente.js")}?v=aif2" defer></script>'
        "<script>document.addEventListener('DOMContentLoaded',function(){"
        "var zona=document.getElementById('w-slim-header-buttons');"
        "if(!zona||document.querySelector('.rp-salir-btn'))return;"
        "var token=(document.cookie.match(/(?:^|; )csrftoken=([^;]+)/)||[])[1]||'';"
        "var form=document.createElement('form');"
        f"form.method='post';form.action='{salir}';form.className='rp-salir-form';"
        "form.innerHTML='<input type=\"hidden\" name=\"csrfmiddlewaretoken\" value=\"'+decodeURIComponent(token)+'\"><button class=\"rp-salir-btn\" type=\"submit\">Salir</button>';"
        "zona.appendChild(form);"
        "});</script>"
    )


@hooks.register("register_admin_urls")
def urls_asistente():
    return [
        path("asistente/chat/", views_asistente.chat_asistente, name="asistente_chat"),
    ]


class SalirMenuItem(MenuItem):
    def render_component(self, request):
        return SidebarActionMenuItem(
            "salir",
            "Salir",
            reverse("wagtailadmin_logout"),
            icon_name="logout",
            classname="rp-salir",
        )


def _item_edicion(page, label, order, icon="doc-full"):
    if page is None:
        return None
    return MenuItem(
        label,
        reverse("wagtailadmin_pages:edit", args=[page.id]),
        icon_name=icon,
        order=order,
    )


@hooks.register("construct_main_menu")
def menu_paginas_editables(request, menu_items):
    from home.models import DescubriMasPage, RutaTematicaPage

    menu_items.append(
        MenuItem("Asistente IA", "#rp-asistente", icon_name="help", order=145)
    )

    etiquetas = {
        "industria-del-videojuego": ("Ruta: Videojuego", 230),
        "ciencia-de-datos-e-inteligencia-artificial": ("Ruta: Datos e IA", 231),
        "biotecnologia-y-bioeconomia": ("Ruta: Biotecnología", 232),
    }
    for page in RutaTematicaPage.objects.all().order_by("path"):
        label, order = etiquetas.get(page.slug, (page.title, 233))
        item = _item_edicion(page, label, order)
        if item:
            menu_items.append(item)

    descubri = DescubriMasPage.objects.first()
    item = _item_edicion(descubri, "Descubrí más", 234, "plus-inverse")
    if item:
        menu_items.append(item)
    menu_items.append(SalirMenuItem("Salir", reverse("wagtailadmin_logout"), icon_name="logout", order=900))
