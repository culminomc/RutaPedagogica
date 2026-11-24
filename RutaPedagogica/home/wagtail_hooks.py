from django.templatetags.static import static
from django.urls import reverse
from django.utils.html import format_html
from django.utils.safestring import mark_safe

from wagtail import hooks
from wagtail.admin.menu import MenuItem
from wagtail.admin.ui.components import Component


class GuiaPanel(Component):
    order = 10

    def render_html(self, parent_context):
        return mark_safe(
            """
            <section class="rp-admin-guide">
                <h2>Cómo editar el sitio</h2>
                <p>Desde acá se administra toda la página pública. No hace falta tocar código.</p>
                <ol>
                    <li><strong>Portada:</strong> Páginas → Rutas Pedagógicas. Título, cifras, escuelas, biblioteca y contacto.</li>
                    <li><strong>Las 3 rutas:</strong> en el menú lateral, “Ruta: Videojuego”, “Ruta: Datos e IA” y “Ruta: Biotecnología”. Cada una tiene su página pública. Después de editar, pulsá Publicar.</li>
                    <li><strong>Descubrí más:</strong> menú lateral → Descubrí más. Ese es el contenido del botón naranja de la portada.</li>
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
    return format_html('<link rel="stylesheet" href="{}?v=aif4">', static("css/admin.css"))


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
