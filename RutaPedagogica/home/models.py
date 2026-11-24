import re

from django import forms
from django.db import models
from modelcluster.fields import ParentalKey
from modelcluster.models import ClusterableModel
from wagtail.admin.panels import FieldPanel, HelpPanel, InlinePanel, MultiFieldPanel, ObjectList, PageChooserPanel, TabbedInterface
from wagtail.contrib.settings.models import BaseGenericSetting, register_setting
from wagtail.fields import RichTextField
from wagtail.models import Orderable, Page
from wagtail.snippets.models import register_snippet
from wagtail.snippets.views.snippets import SnippetViewSet


THEME_CHOICES = [
    ("bio", "Verde · Bioeconomía"),
    ("data", "Azul · Datos e IA"),
    ("game", "Rojo · Videojuegos"),
    ("neutral", "Neutro"),
]

CITY_CHOICES = [
    ("Ushuaia", "Ushuaia"),
    ("Tolhuin", "Tolhuin"),
    ("Río Grande", "Río Grande"),
]

LEVEL_CHOICES = [
    ("Inicial", "Inicial"),
    ("Primario", "Primario"),
    ("Secundario", "Secundario"),
    ("Transversal", "Transversal"),
]

HOME_SECTION_CHOICES = [
    ("portada", "Portada"),
    ("ejes", "Ejes pedagógicos y 3 rutas"),
    ("niveles", "Niveles (Inicial, Primario y Secundario)"),
    ("carrusel", "Carrusel"),
    ("impacto", "Impacto"),
    ("escuelas", "Escuelas"),
    ("galeria", "Galería y voces"),
    ("biblioteca", "Biblioteca"),
    ("contacto", "Contacto"),
]

DEFAULT_HOME_SECTIONS = [clave for clave, _label in HOME_SECTION_CHOICES]

COLOR_WIDGET = forms.TextInput(attrs={"type": "color"})


def color_seguro(value, fallback):
    text = (value or "").strip()
    if re.fullmatch(r"#[0-9A-Fa-f]{6}", text):
        return text
    return fallback


def embed_de_video(url):
    text = (url or "").strip()
    if "youtu.be/" in text:
        video_id = text.split("youtu.be/")[-1].split("?")[0].split("&")[0]
        return f"https://www.youtube.com/embed/{video_id}"
    if "youtube.com" in text and "v=" in text:
        video_id = text.split("v=")[-1].split("&")[0]
        return f"https://www.youtube.com/embed/{video_id}"
    if "vimeo.com/" in text:
        video_id = text.rstrip("/").split("/")[-1].split("?")[0]
        return f"https://player.vimeo.com/video/{video_id}"
    return ""


class HomePage(Page):
    eyebrow = models.CharField("etiqueta", max_length=160, default="Programa Educativo Provincial · Tierra del Fuego")
    headline = models.CharField("título", max_length=180, default="Rutas Pedagógicas:")
    headline_highlight = models.CharField("título destacado", max_length=180, default="Un espacio digital")
    headline_rest = models.CharField(
        "resto del título",
        max_length=255,
        default="para integrar, organizar y compartir propuestas educativas innovadoras.",
    )
    intro = RichTextField(
        "introducción",
        features=["bold", "italic", "link"],
        default="<p>Articulamos ciencia, tecnología y creatividad en las aulas de <strong>Ushuaia, Tolhuin y Río Grande</strong>. Acompañamos a 56 docentes y 364 estudiantes en 7 rutas activas de construcción de conocimiento fueguino.</p>",
    )
    polos_url = models.URLField("enlace Polos Creativos", default="https://polos.aif.gob.ar/")
    aif_url = models.URLField("enlace sitio AIF", default="https://www.aif.gob.ar/")
    campus_url = models.URLField(
        "enlace Campus Virtual",
        default="https://educaciondigital.tierradelfuego.edu.ar/campusvirtual/login/index.php",
    )
    alcance = models.CharField("alcance curricular", max_length=180, default="Nivel Inicial, Nivel Primario, Nivel Secundario")
    mapa_titulo = models.CharField("pie del mapa", max_length=120, default="Recorrido Territorial TDF")
    mapa_ciudades = models.CharField("ciudades del mapa", max_length=180, default="Ushuaia · Tolhuin · Río Grande")

    carrusel_titulo = models.CharField(
        "título del carrusel",
        max_length=180,
        default="Rutas Pedagógicas en Acción · Tierra del Fuego",
    )

    impacto_etiqueta = models.CharField("etiqueta de impacto", max_length=160, default="Estadísticas Oficiales Verificadas")
    impacto_aviso = models.CharField("aviso de impacto", max_length=180, default="Capacitaciones en curso continuo")
    impacto_titulo = models.CharField("título de impacto", max_length=180, default="Impacto real en Tierra del Fuego")
    impacto_texto = RichTextField(
        "texto de impacto",
        features=["bold", "italic", "link"],
        default="<p>Consolidado territorial de rutas registradas, docentes y estudiantes participantes en Ushuaia, Tolhuin y Río Grande. <strong>Las instancias de capacitación y acompañamiento docente se encuentran en trabajo permanente y crecimiento activo</strong> en toda la provincia.</p>",
    )
    cta_texto = models.CharField("botón principal", max_length=80, default="Descubrí más")
    cta_pagina = models.ForeignKey(
        "wagtailcore.Page",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        verbose_name="página de Descubrí más",
        help_text="Si está cargada, el botón abre esta página del sitio. Si no, usa el enlace externo.",
    )
    cta_url = models.URLField(
        "enlace externo del botón principal",
        blank=True,
        default="https://script.google.com/macros/s/AKfycbw6-k21aE__icoLThz_fuCgoM-J88MTaPj0c_njMucoeBnKAsUqam8piSUQCrxbqd26Sg/exec",
        help_text="Solo se usa si no hay una página interna asignada.",
    )

    escuelas_etiqueta = models.CharField("etiqueta de escuelas", max_length=120, default="Organización Territorial")
    escuelas_titulo = models.CharField("título de escuelas", max_length=180, default="Escuelas Participantes por Ciudad")
    escuelas_texto = RichTextField(
        "texto de escuelas",
        features=["bold", "italic", "link"],
        default="<p>Explorá las instituciones educativas organizadas por localidad: <strong>Escuelas Ushuaia</strong>, <strong>Escuelas Tolhuin</strong> y <strong>Escuelas Río Grande</strong>.</p>",
    )

    galeria_etiqueta = models.CharField("etiqueta de galería", max_length=120, default="Registro Visual")
    galeria_titulo = models.CharField("título de galería", max_length=180, default="Galería de experiencias")
    galeria_texto = models.TextField(
        "texto de galería",
        default="Ilustraciones y espacios para las fotografías reales de las jornadas en Ushuaia, Tolhuin y Río Grande.",
    )

    voces_etiqueta = models.CharField("etiqueta de voces", max_length=120, default="Territorio")
    voces_titulo = models.CharField("título de voces", max_length=180, default="Voces del territorio")
    instagram_url = models.URLField("Instagram", default="https://www.instagram.com/aif.tdf/")
    instagram_titulo = models.CharField("título de Instagram", max_length=180, default="Seguí el trabajo en las escuelas")

    rutas_etiqueta = models.CharField("etiqueta de rutas", max_length=120, default="Ejes Pedagógicos Provinciales")
    rutas_titulo = models.CharField("título de rutas", max_length=180, default="Las 3 Rutas Temáticas")
    rutas_texto = RichTextField(
        "texto de rutas",
        features=["bold", "italic", "link"],
        default="<p>Propuestas articuladas para niveles <strong>Inicial, Primario y Secundario</strong> con acompañamiento de la Agencia de Innovación Fueguina.</p>",
    )
    niveles_etiqueta = models.CharField(
        "etiqueta de niveles",
        max_length=120,
        default="Alcance curricular",
    )
    niveles_titulo = models.CharField(
        "título de niveles",
        max_length=180,
        default="Nivel Inicial, Nivel Primario y Nivel Secundario",
    )

    biblioteca_etiqueta = models.CharField("etiqueta de biblioteca", max_length=120, default="Repositorio Pedagógico")
    biblioteca_titulo = models.CharField("título de biblioteca", max_length=180, default="Biblioteca de Manuales y Guías")
    biblioteca_texto = RichTextField(
        "texto de biblioteca",
        features=["bold", "italic", "link"],
        default="<p>Explorá los materiales por eje temático (<strong>Verde</strong> Bioeconomía, <strong>Azul</strong> Ciencia de Datos e IA, <strong>Rojo</strong> Videojuegos) o accedé al Campus Virtual.</p>",
    )
    campus_titulo = models.CharField(
        "título del campus",
        max_length=180,
        default="Campus Virtual de Educación Digital · Tierra del Fuego",
    )
    campus_texto = models.TextField(
        "texto del campus",
        default="Ingresá a las aulas virtuales, cursos activos y materiales complementarios de formación docente continua.",
    )
    pitch_titulo = models.CharField(
        "título de la guía",
        max_length=180,
        default="Guía de Pitch: Cómo defender tu investigación en 5 minutos",
    )
    pitch_texto = models.TextField(
        "texto de la guía",
        default="Estructura paso a paso y checklist previo para presentar los proyectos en Fábrica de Talentos e I.P.R.A.",
    )
    pitch_cuerpo = RichTextField(
        "contenido de la guía",
        features=["h3", "bold", "italic", "ol", "ul", "link"],
        default=(
            "<h3>1. Problema</h3><p>Esto afecta a… y ocurre en…</p>"
            "<h3>2. Solución</h3><p>Proponemos… porque…</p>"
            "<h3>3. Producto</h3><p>Les mostramos cómo funciona…</p>"
            "<h3>4. Viabilidad</h3><p>En TDF se aplica porque…</p>"
            "<h3>5. Impacto</h3><p>Con esto mejora… y se mide con…</p>"
        ),
    )
    informe = models.ForeignKey(
        "wagtaildocs.Document",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        verbose_name="informe oficial (PDF)",
    )

    contacto_titulo = models.CharField("título de contacto", max_length=180, default="Agencia de Innovación Fueguina")
    contacto_texto = models.TextField(
        "texto de contacto",
        default="Comunicate con nuestro equipo territorial o seguí las novedades de todas las escuelas en nuestro Instagram oficial.",
    )
    email = models.EmailField("correo institucional", default="rutaspedagogicas@aif.gob.ar")
    sede_ushuaia = models.CharField("sede Ushuaia", max_length=180, default="Fábrica de Talentos · Av. Maipú 1255")
    sede_rio_grande = models.CharField("sede Río Grande", max_length=180, default="I.P.R.A. · Perito Moreno 168")
    formulario_titulo = models.CharField("título del formulario", max_length=180, default="Formulario de Vinculación Educativa")
    formulario_texto = models.CharField(
        "texto del formulario",
        max_length=255,
        default="Completá los datos para sumar tu institución o consultar al equipo pedagógico.",
    )
    redes_titulo = models.CharField("título de redes", max_length=180, default="¡SEGUINOS EN NUESTRAS REDES!")

    marca_titulo = models.CharField("nombre del sitio", max_length=80, default="RUTAS PEDAGÓGICAS")
    marca_subtitulo = models.CharField(
        "bajada del nombre",
        max_length=120,
        default="AGENCIA DE INNOVACIÓN FUEGUINA",
    )
    gobierno_texto = models.CharField(
        "texto de la barra superior",
        max_length=120,
        default="Gobierno de Tierra del Fuego",
    )
    instagram_usuario = models.CharField("usuario de Instagram", max_length=80, default="@aif.tdf")
    boton_escuelas = models.CharField("texto del botón de escuelas", max_length=80, default="Escuelas por Ciudad")
    boton_polos = models.CharField("texto del botón de Polos", max_length=80, default="Polos Creativos")
    logo = models.ForeignKey(
        "wagtailimages.Image",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        verbose_name="logo",
        help_text="Si lo cargás, reemplaza el ícono de las tres rutas en el encabezado.",
    )
    imagen_portada = models.ForeignKey(
        "wagtailimages.Image",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        verbose_name="imagen de la portada",
    )
    video_titulo = models.CharField("título del video", max_length=180, blank=True, default="Video de presentación")
    video_url = models.URLField(
        "video de la portada (YouTube o Vimeo)",
        blank=True,
        help_text="Pegá el enlace público. Si también subís un archivo, se muestra el archivo.",
    )
    video_archivo = models.ForeignKey(
        "wagtaildocs.Document",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        verbose_name="archivo de video de la portada",
        help_text="MP4, WebM o MOV. El tamaño máximo se configura en Ajustes del sitio.",
    )
    color_fondo = models.CharField("color de fondo", max_length=7, default="#fdf6e3")
    color_texto = models.CharField("color de texto", max_length=7, default="#1a1a1a")
    color_verde = models.CharField("color verde", max_length=7, default="#38a169")
    color_azul = models.CharField("color azul", max_length=7, default="#0056b3")
    color_rojo = models.CharField("color rojo", max_length=7, default="#e53e3e")
    color_acento = models.CharField("color de acento", max_length=7, default="#e06a12")

    content_panels = [
        FieldPanel("title"),
        MultiFieldPanel(
            [
                FieldPanel("eyebrow"),
                FieldPanel("headline"),
                FieldPanel("headline_highlight"),
                FieldPanel("headline_rest"),
                FieldPanel("intro"),
                FieldPanel("alcance"),
                FieldPanel("polos_url"),
                FieldPanel("aif_url"),
                FieldPanel("mapa_titulo"),
                FieldPanel("mapa_ciudades"),
            ],
            heading="Portada",
        ),
    ]

    edit_handler = TabbedInterface(
        [
            ObjectList(
                [
                    HelpPanel(
                        heading="Qué se cambia acá",
                        content=(
                            "<p>Logo, colores, imagen y video de la página de inicio. "
                            "Las fotos del carrusel y de la galería se cargan en sus pestañas. "
                            "Después de guardar, pulsá <strong>Publicar</strong>.</p>"
                        ),
                    ),
                    MultiFieldPanel(
                        [
                            FieldPanel("marca_titulo"),
                            FieldPanel("marca_subtitulo"),
                            FieldPanel("gobierno_texto"),
                            FieldPanel("logo"),
                            FieldPanel("instagram_usuario"),
                            FieldPanel("boton_escuelas"),
                            FieldPanel("boton_polos"),
                        ],
                        heading="Marca y botones",
                    ),
                    MultiFieldPanel(
                        [
                            FieldPanel("color_fondo", widget=COLOR_WIDGET),
                            FieldPanel("color_texto", widget=COLOR_WIDGET),
                            FieldPanel("color_verde", widget=COLOR_WIDGET),
                            FieldPanel("color_azul", widget=COLOR_WIDGET),
                            FieldPanel("color_rojo", widget=COLOR_WIDGET),
                            FieldPanel("color_acento", widget=COLOR_WIDGET),
                        ],
                        heading="Colores",
                    ),
                    MultiFieldPanel(
                        [
                            FieldPanel("imagen_portada"),
                            FieldPanel("video_titulo"),
                            FieldPanel("video_url"),
                            FieldPanel("video_archivo"),
                        ],
                        heading="Imagen y video de la portada",
                    ),
                ],
                heading="Imágenes, colores y videos",
            ),
            ObjectList(content_panels, heading="Portada"),
            ObjectList(
                [
                    HelpPanel(
                        heading="Cómo reordenar",
                        content=(
                            "<p>Arrastrá cada fila para mover la sección de <strong>arriba hacia abajo</strong>. "
                            "Desmarcá <em>mostrar</em> para ocultarla sin borrar el contenido. "
                            "Los tres niveles también se reordenan arrastrando.</p>"
                        ),
                    ),
                    InlinePanel("layout_sections", label="Secciones de la página de inicio"),
                    FieldPanel("niveles_etiqueta"),
                    FieldPanel("niveles_titulo"),
                    InlinePanel("niveles_home", label="Nivel Inicial, Primario y Secundario"),
                ],
                heading="Orden y niveles",
            ),
            ObjectList(
                [
                    FieldPanel("carrusel_titulo"),
                    InlinePanel("slides", label="Diapositivas del carrusel"),
                ],
                heading="Carrusel",
            ),
            ObjectList(
                [
                    FieldPanel("impacto_etiqueta"),
                    FieldPanel("impacto_aviso"),
                    FieldPanel("impacto_titulo"),
                    FieldPanel("impacto_texto"),
                    FieldPanel("cta_texto"),
                    HelpPanel(
                        heading="Página Descubrí más",
                        content=(
                            "<p>El botón abre la página hija <strong>Descubrí más</strong>. "
                            "Editá esa página desde el menú lateral y pulsá <strong>Publicar</strong> para ver los cambios en el sitio.</p>"
                        ),
                    ),
                    InlinePanel("metrics", label="Indicadores"),
                    InlinePanel("city_stats", label="Ciudades"),
                ],
                heading="Impacto",
            ),
            ObjectList(
                [
                    FieldPanel("escuelas_etiqueta"),
                    FieldPanel("escuelas_titulo"),
                    FieldPanel("escuelas_texto"),
                    InlinePanel("schools", label="Escuelas"),
                ],
                heading="Escuelas",
            ),
            ObjectList(
                [
                    FieldPanel("galeria_etiqueta"),
                    FieldPanel("galeria_titulo"),
                    FieldPanel("galeria_texto"),
                    InlinePanel("gallery_items", label="Galería"),
                    FieldPanel("voces_etiqueta"),
                    FieldPanel("voces_titulo"),
                    FieldPanel("instagram_url"),
                    FieldPanel("instagram_titulo"),
                    InlinePanel("testimonials", label="Testimonios"),
                ],
                heading="Galería y voces",
            ),
            ObjectList(
                [
                    FieldPanel("rutas_etiqueta"),
                    FieldPanel("rutas_titulo"),
                    FieldPanel("rutas_texto"),
                    HelpPanel(
                        heading="Páginas de cada ruta",
                        content=(
                            "<p>Las tres tarjetas salen de las páginas hijas de tipo <strong>Ruta temática</strong>. "
                            "Para cambiar textos, descripciones o la progresión, usá el menú lateral "
                            "(Ruta: Videojuego, Ruta: Datos e IA, Ruta: Biotecnología) y pulsá <strong>Publicar</strong>.</p>"
                        ),
                    ),
                ],
                heading="Rutas",
            ),
            ObjectList(
                [
                    FieldPanel("biblioteca_etiqueta"),
                    FieldPanel("biblioteca_titulo"),
                    FieldPanel("biblioteca_texto"),
                    FieldPanel("campus_url"),
                    FieldPanel("campus_titulo"),
                    FieldPanel("campus_texto"),
                    FieldPanel("pitch_titulo"),
                    FieldPanel("pitch_texto"),
                    FieldPanel("pitch_cuerpo"),
                    FieldPanel("informe"),
                    InlinePanel("resources", label="Materiales"),
                ],
                heading="Biblioteca",
            ),
            ObjectList(
                [
                    FieldPanel("contacto_titulo"),
                    FieldPanel("contacto_texto"),
                    FieldPanel("email"),
                    FieldPanel("sede_ushuaia"),
                    FieldPanel("sede_rio_grande"),
                    FieldPanel("formulario_titulo"),
                    FieldPanel("formulario_texto"),
                    FieldPanel("redes_titulo"),
                    InlinePanel("social_links", label="Redes y sitios"),
                ],
                heading="Contacto",
            ),
            ObjectList(Page.promote_panels, heading="Promoción"),
            ObjectList(Page.settings_panels, heading="Ajustes"),
        ]
    )

    def secciones_publicas(self):
        items = list(self.layout_sections.all())
        if not items:
            return [type("Seccion", (), {"clave": clave, "visible": True})() for clave in DEFAULT_HOME_SECTIONS]
        return [item for item in items if item.visible]

    @property
    def fondo_css(self):
        return color_seguro(self.color_fondo, "#fdf6e3")

    @property
    def texto_css(self):
        return color_seguro(self.color_texto, "#1a1a1a")

    @property
    def verde_css(self):
        return color_seguro(self.color_verde, "#38a169")

    @property
    def azul_css(self):
        return color_seguro(self.color_azul, "#0056b3")

    @property
    def rojo_css(self):
        return color_seguro(self.color_rojo, "#e53e3e")

    @property
    def acento_css(self):
        return color_seguro(self.color_acento, "#e06a12")

    @property
    def video_embed(self):
        return embed_de_video(self.video_url)

    def alcance_items(self):
        return [item.strip() for item in self.alcance.split(",") if item.strip()]

    def highlight_words(self):
        return [word for word in self.headline_highlight.split() if word]

    def schools_by_city(self):
        grouped = {}
        for school in self.schools.all():
            grouped.setdefault(school.city, []).append(school)
        order = [value for value, _label in CITY_CHOICES]
        return [(city, grouped[city]) for city in order if city in grouped]

    def get_context(self, request, *args, **kwargs):
        context = super().get_context(request, *args, **kwargs)
        context["city_choices"] = CITY_CHOICES
        context["enviado"] = request.GET.get("enviado")
        context["rutas_paginas"] = list(
            RutaTematicaPage.objects.child_of(self).live().order_by("path")
        )
        descubri = DescubriMasPage.objects.child_of(self).live().first()
        context["descubri_url"] = descubri.url if descubri else "/descubri-mas/"
        return context

    parent_page_types = ["wagtailcore.Page"]
    subpage_types = ["home.ContenidoPage", "home.RutaTematicaPage", "home.DescubriMasPage"]
    max_count = 1

    def cta_href(self):
        descubri = DescubriMasPage.objects.child_of(self).live().first()
        if descubri:
            return descubri.url
        return "/descubri-mas/"


class ContenidoPage(Page):
    """Página libre para notas, secciones y contenidos nuevos del sitio."""

    intro = models.TextField("bajada", blank=True)
    cuerpo = RichTextField(
        "contenido",
        features=["h2", "h3", "bold", "italic", "ol", "ul", "link", "document-link", "image", "embed"],
    )
    imagen = models.ForeignKey(
        "wagtailimages.Image",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        verbose_name="imagen principal",
    )
    video_url = models.URLField(
        "video embebido (YouTube o Vimeo)",
        blank=True,
        help_text="Pegá el enlace público del video. Se muestra en la página.",
    )
    video_archivo = models.ForeignKey(
        "wagtaildocs.Document",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        verbose_name="archivo de video",
        help_text="Subí un MP4, WebM o MOV desde Documentos. El tamaño máximo se configura en Ajustes del sitio.",
    )

    content_panels = Page.content_panels + [
        FieldPanel("intro"),
        FieldPanel("imagen"),
        FieldPanel("video_url"),
        FieldPanel("video_archivo"),
        FieldPanel("cuerpo"),
    ]

    parent_page_types = ["home.HomePage", "home.ContenidoPage"]
    subpage_types = ["home.ContenidoPage"]

    class Meta:
        verbose_name = "Página de contenido"
        verbose_name_plural = "Páginas de contenido"


RICHTEXT_SECCION = ["h2", "h3", "bold", "italic", "ol", "ul", "link", "document-link", "image", "embed"]


class RutaTematicaPage(Page):
    """Página completa de cada ruta: Videojuegos, Datos e IA, o Biotecnología."""

    code = models.CharField("código visible", max_length=40, default="Ruta 01")
    subtitle = models.CharField("bajada", max_length=220, blank=True)
    summary = models.TextField("resumen", blank=True)
    theme = models.CharField("color", max_length=20, choices=THEME_CHOICES, default="game")
    icon = models.CharField("ícono Phosphor", max_length=60, default="ph-game-controller")
    cuerpo = RichTextField("contenido principal", features=RICHTEXT_SECCION, blank=True)
    enlace_externo = models.URLField(
        "enlace original (opcional)",
        blank=True,
        help_text="Por ejemplo, la aplicación de Google Apps Script si todavía se quiere ofrecer.",
    )
    enlace_externo_texto = models.CharField(
        "texto del enlace original",
        max_length=120,
        blank=True,
        default="Abrir versión original",
    )

    content_panels = Page.content_panels + [
        MultiFieldPanel(
            [
                FieldPanel("code"),
                FieldPanel("subtitle"),
                FieldPanel("summary"),
                FieldPanel("theme"),
                FieldPanel("icon"),
            ],
            heading="Encabezado de la ruta",
        ),
        FieldPanel("cuerpo"),
        InlinePanel("niveles", label="Progresión por nivel"),
        InlinePanel("bloques", label="Bloques de contenido"),
    ]

    parent_page_types = ["home.HomePage"]
    subpage_types = ["home.ContenidoPage"]

    class Meta:
        verbose_name = "Ruta temática"
        verbose_name_plural = "Rutas temáticas"

    def get_context(self, request, *args, **kwargs):
        context = super().get_context(request, *args, **kwargs)
        mostrada = self
        if getattr(request, "user", None) and request.user.is_staff:
            mostrada = self.get_latest_revision_as_object()
            context["page"] = mostrada
        parent = self.get_parent()
        context["home"] = parent.specific if parent else None
        context["otras_rutas"] = RutaTematicaPage.objects.live().sibling_of(self, inclusive=False)
        context["edit_url"] = f"/admin/pages/{self.id}/edit/"
        return context


class RutaNivel(Orderable):
    page = ParentalKey(RutaTematicaPage, on_delete=models.CASCADE, related_name="niveles")
    level = models.CharField("nivel", max_length=40)
    description = models.TextField("descripción")
    panels = [FieldPanel("level"), FieldPanel("description")]


class RutaBloque(Orderable):
    page = ParentalKey(RutaTematicaPage, on_delete=models.CASCADE, related_name="bloques")
    titulo = models.CharField("título", max_length=180)
    texto = RichTextField("texto", features=RICHTEXT_SECCION, blank=True)
    enlace = models.URLField("enlace", blank=True)
    enlace_texto = models.CharField("texto del enlace", max_length=120, blank=True)
    imagen = models.ForeignKey(
        "wagtailimages.Image",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        verbose_name="imagen",
    )
    panels = [
        FieldPanel("titulo"),
        FieldPanel("texto"),
        FieldPanel("enlace"),
        FieldPanel("enlace_texto"),
        FieldPanel("imagen"),
    ]


class DescubriMasPage(Page):
    """Contenido del botón Descubrí más, editable sin tocar código."""

    intro = models.TextField("bajada", blank=True)
    cuerpo = RichTextField("contenido principal", features=RICHTEXT_SECCION, blank=True)
    imagen = models.ForeignKey(
        "wagtailimages.Image",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        verbose_name="imagen principal",
    )

    content_panels = Page.content_panels + [
        FieldPanel("intro"),
        FieldPanel("imagen"),
        FieldPanel("cuerpo"),
        InlinePanel("bloques", label="Bloques de contenido"),
    ]

    parent_page_types = ["home.HomePage"]
    subpage_types = ["home.ContenidoPage"]
    max_count = 1

    class Meta:
        verbose_name = "Página Descubrí más"
        verbose_name_plural = "Páginas Descubrí más"

    def get_context(self, request, *args, **kwargs):
        context = super().get_context(request, *args, **kwargs)
        if getattr(request, "user", None) and request.user.is_staff:
            context["page"] = self.get_latest_revision_as_object()
        parent = self.get_parent()
        home = parent.specific if parent else None
        context["home"] = home
        context["rutas"] = (
            RutaTematicaPage.objects.live().descendant_of(parent) if parent else []
        )
        context["edit_url"] = f"/admin/pages/{self.id}/edit/"
        return context


class ExplorarBloque(Orderable):
    page = ParentalKey(DescubriMasPage, on_delete=models.CASCADE, related_name="bloques")
    titulo = models.CharField("título", max_length=180)
    texto = RichTextField("texto", features=RICHTEXT_SECCION, blank=True)
    enlace = models.URLField("enlace", blank=True)
    enlace_texto = models.CharField("texto del enlace", max_length=120, blank=True)
    imagen = models.ForeignKey(
        "wagtailimages.Image",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        verbose_name="imagen",
    )
    panels = [
        FieldPanel("titulo"),
        FieldPanel("texto"),
        FieldPanel("enlace"),
        FieldPanel("enlace_texto"),
        FieldPanel("imagen"),
    ]


class HomeLayoutSection(Orderable):
    page = ParentalKey(HomePage, on_delete=models.CASCADE, related_name="layout_sections")
    clave = models.CharField("sección", max_length=30, choices=HOME_SECTION_CHOICES)
    visible = models.BooleanField("mostrar en el sitio", default=True)
    panels = [FieldPanel("clave"), FieldPanel("visible")]

    class Meta(Orderable.Meta):
        verbose_name = "sección de la portada"
        verbose_name_plural = "secciones de la portada"

    def __str__(self):
        return self.get_clave_display()


class HomeNivel(Orderable):
    page = ParentalKey(HomePage, on_delete=models.CASCADE, related_name="niveles_home")
    titulo = models.CharField("título", max_length=80, default="Nivel Inicial")
    bajada = models.TextField("descripción", blank=True)
    theme = models.CharField("color", max_length=20, choices=THEME_CHOICES, default="bio")
    icon = models.CharField("ícono Phosphor", max_length=60, default="ph-plant")
    pagina = models.ForeignKey(
        "wagtailcore.Page",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        verbose_name="página vinculada",
        help_text="Opcional. Si está cargada, el recuadro abre esa página.",
    )
    panels = [
        FieldPanel("titulo"),
        FieldPanel("bajada"),
        FieldPanel("theme"),
        FieldPanel("icon"),
        PageChooserPanel("pagina"),
    ]

    class Meta(Orderable.Meta):
        verbose_name = "nivel educativo"
        verbose_name_plural = "niveles educativos"

    def __str__(self):
        return self.titulo


class HeroSlide(Orderable):
    page = ParentalKey(HomePage, on_delete=models.CASCADE, related_name="slides")
    title = models.CharField("título", max_length=180)
    theme = models.CharField("color de respaldo", max_length=20, choices=THEME_CHOICES, default="data")
    image = models.ForeignKey(
        "wagtailimages.Image",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        verbose_name="foto",
    )
    video_url = models.URLField("video (YouTube o Vimeo)", blank=True)
    video_archivo = models.ForeignKey(
        "wagtaildocs.Document",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        verbose_name="archivo de video",
    )
    panels = [
        FieldPanel("title"),
        FieldPanel("theme"),
        FieldPanel("image"),
        FieldPanel("video_url"),
        FieldPanel("video_archivo"),
    ]

    @property
    def video_embed(self):
        return embed_de_video(self.video_url)


class Metric(Orderable):
    page = ParentalKey(HomePage, on_delete=models.CASCADE, related_name="metrics")
    value = models.PositiveIntegerField("número")
    label = models.CharField("nombre", max_length=120)
    detail = models.CharField("detalle", max_length=220)
    theme = models.CharField("color", max_length=20, choices=THEME_CHOICES, default="data")
    icon = models.CharField("ícono Phosphor", max_length=60, default="ph-map-pin-line", help_text="Por ejemplo: ph-student")
    panels = [FieldPanel("value"), FieldPanel("label"), FieldPanel("detail"), FieldPanel("theme"), FieldPanel("icon")]


class CityStat(Orderable):
    page = ParentalKey(HomePage, on_delete=models.CASCADE, related_name="city_stats")
    city = models.CharField("ciudad", max_length=40, choices=CITY_CHOICES)
    routes = models.PositiveIntegerField("rutas", default=0)
    teachers = models.PositiveIntegerField("docentes", default=0)
    students = models.PositiveIntegerField("estudiantes", default=0)
    theme = models.CharField("color", max_length=20, choices=THEME_CHOICES, default="data")
    panels = [
        FieldPanel("city"),
        FieldPanel("routes"),
        FieldPanel("teachers"),
        FieldPanel("students"),
        FieldPanel("theme"),
    ]

    @property
    def total(self):
        return self.teachers + self.students


class School(Orderable):
    page = ParentalKey(HomePage, on_delete=models.CASCADE, related_name="schools")
    name = models.CharField("escuela", max_length=180)
    city = models.CharField("ciudad", max_length=40, choices=CITY_CHOICES)
    level = models.CharField("nivel", max_length=20, choices=LEVEL_CHOICES, default="Secundario")
    route = models.CharField("ruta", max_length=120)
    teachers = models.CharField("equipo docente", max_length=220, blank=True)
    panels = [
        FieldPanel("name"),
        FieldPanel("city"),
        FieldPanel("level"),
        FieldPanel("route"),
        FieldPanel("teachers"),
    ]


class GalleryItem(Orderable):
    page = ParentalKey(HomePage, on_delete=models.CASCADE, related_name="gallery_items")
    badge = models.CharField("etiqueta", max_length=120)
    title = models.CharField("título", max_length=180)
    caption = models.TextField("texto")
    theme = models.CharField("color", max_length=20, choices=THEME_CHOICES, default="bio")
    image = models.ForeignKey(
        "wagtailimages.Image",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        verbose_name="foto",
    )
    video_archivo = models.ForeignKey(
        "wagtaildocs.Document",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        verbose_name="video",
    )
    panels = [
        FieldPanel("badge"),
        FieldPanel("title"),
        FieldPanel("caption"),
        FieldPanel("theme"),
        FieldPanel("image"),
        FieldPanel("video_archivo"),
    ]


class Testimonial(Orderable):
    page = ParentalKey(HomePage, on_delete=models.CASCADE, related_name="testimonials")
    category = models.CharField(
        "quién",
        max_length=20,
        choices=[("docente", "Docente"), ("estudiante", "Estudiante")],
        default="docente",
    )
    role = models.CharField("rol", max_length=120)
    author = models.CharField("autor", max_length=120)
    route = models.CharField("ruta", max_length=120)
    theme = models.CharField("color", max_length=20, choices=THEME_CHOICES, default="bio")
    quote = models.TextField("cita")
    panels = [
        FieldPanel("category"),
        FieldPanel("role"),
        FieldPanel("author"),
        FieldPanel("route"),
        FieldPanel("theme"),
        FieldPanel("quote"),
    ]


class Route(Orderable, ClusterableModel):
    page = ParentalKey(HomePage, on_delete=models.CASCADE, related_name="routes")
    code = models.CharField("código visible", max_length=40, default="Ruta 01 · Rojo")
    title = models.CharField("título", max_length=180)
    subtitle = models.CharField("bajada del encabezado", max_length=220)
    summary = models.TextField("resumen")
    theme = models.CharField("color", max_length=20, choices=THEME_CHOICES, default="game")
    icon = models.CharField("ícono Phosphor", max_length=60, default="ph-game-controller")
    external_url = models.URLField(
        "enlace externo",
        blank=True,
        help_text="Solo se usa si no hay una página interna asignada.",
    )
    pagina = models.ForeignKey(
        "wagtailcore.Page",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        verbose_name="página de la ruta",
        help_text="Página editable del sitio. Si está cargada, el botón abre esa página.",
    )
    panels = [
        FieldPanel("code"),
        FieldPanel("title"),
        FieldPanel("subtitle"),
        FieldPanel("summary"),
        FieldPanel("theme"),
        FieldPanel("icon"),
        PageChooserPanel("pagina"),
        FieldPanel("external_url"),
        InlinePanel("levels", label="Progresión por nivel"),
    ]

    def destino_url(self):
        if self.pagina:
            return self.pagina.url
        return ""


class RouteLevel(Orderable):
    route = ParentalKey(Route, on_delete=models.CASCADE, related_name="levels")
    level = models.CharField("nivel", max_length=40)
    description = models.TextField("descripción")
    panels = [FieldPanel("level"), FieldPanel("description")]


class Resource(Orderable):
    page = ParentalKey(HomePage, on_delete=models.CASCADE, related_name="resources")
    title = models.CharField("título", max_length=180)
    level = models.CharField("nivel", max_length=20, choices=LEVEL_CHOICES, default="Primario")
    route = models.CharField("ruta", max_length=80)
    kind = models.CharField("tipo de material", max_length=80)
    description = models.TextField("descripción")
    theme = models.CharField("color", max_length=20, choices=THEME_CHOICES, default="bio")
    document = models.ForeignKey(
        "wagtaildocs.Document",
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        verbose_name="archivo",
    )
    panels = [
        FieldPanel("title"),
        FieldPanel("level"),
        FieldPanel("route"),
        FieldPanel("kind"),
        FieldPanel("description"),
        FieldPanel("theme"),
        FieldPanel("document"),
    ]


class SocialLink(Orderable):
    page = ParentalKey(HomePage, on_delete=models.CASCADE, related_name="social_links")
    label = models.CharField("texto", max_length=80)
    url = models.URLField("enlace")
    icon = models.CharField("ícono Phosphor", max_length=60, default="ph-globe")
    panels = [FieldPanel("label"), FieldPanel("url"), FieldPanel("icon")]


class Consulta(models.Model):
    nombre = models.CharField("Nombre", max_length=160)
    ciudad = models.CharField("Ciudad", max_length=40, choices=CITY_CHOICES)
    email = models.EmailField("Correo")
    institucion = models.CharField("Escuela o institución", max_length=180)
    mensaje = models.TextField("Mensaje")
    creada = models.DateTimeField("Fecha de envío", auto_now_add=True)
    leida = models.BooleanField(
        "Gestionada",
        default=False,
        help_text="Marcala cuando la solicitud ya fue revisada o respondida.",
    )

    panels = [
        FieldPanel("nombre", read_only=True),
        FieldPanel("ciudad", read_only=True),
        FieldPanel("email", read_only=True),
        FieldPanel("institucion", read_only=True),
        FieldPanel("mensaje", read_only=True),
        FieldPanel("creada", read_only=True),
        FieldPanel("leida"),
    ]

    class Meta:
        verbose_name = "Consulta de vinculación educativa"
        verbose_name_plural = "Consultas de Vinculación Educativa"
        ordering = ["-creada"]

    def __str__(self):
        return f"{self.nombre} · {self.institucion}"


class ConsultaViewSet(SnippetViewSet):
    # Menú propio: Consultas de Vinculación Educativa.
    model = Consulta
    icon = "mail"
    menu_label = "Consultas de Vinculación Educativa"
    menu_icon = "mail"
    menu_order = 220
    add_to_admin_menu = True
    copy_view_enabled = False
    inspect_view_enabled = True
    inspect_view_fields = ["nombre", "ciudad", "email", "institucion", "mensaje", "creada", "leida"]
    list_display = ["nombre", "email", "institucion", "ciudad", "creada", "leida"]
    list_filter = ["ciudad", "leida"]
    search_fields = ["nombre", "email", "institucion", "mensaje"]


register_snippet(ConsultaViewSet)


@register_setting(icon="cog", order=850)
class AjustesSitio(BaseGenericSetting):
    """Límites de carga y ayudas del panel, editables sin tocar código."""

    video_max_valor = models.PositiveIntegerField(
        "tamaño máximo de video",
        default=200,
        help_text="Número entero. Combinado con la unidad define el tope para MP4, WebM, MOV y similares.",
    )
    video_max_unidad = models.CharField(
        "unidad",
        max_length=2,
        choices=[("MB", "MB"), ("GB", "GB")],
        default="MB",
    )
    techo_servidor_mb = models.PositiveIntegerField(
        "techo técnico del servidor (MB)",
        default=2048,
        help_text="No puede superarse aunque el límite de video sea mayor. Debe coincidir con el máximo real de IIS/Apache/nginx.",
    )

    panels = [
        HelpPanel(
            content=(
                "<p>Este tope se aplica a los videos subidos como documentos. "
                "Si el servidor (IIS, Apache o nginx) tiene un límite menor, el archivo se cortará antes de llegar a Django. "
                "En ese caso bajá el techo técnico o pedí ampliar <code>client_max_body_size</code> / <code>upload_max_filesize</code>.</p>"
            )
        ),
        FieldPanel("video_max_valor"),
        FieldPanel("video_max_unidad"),
        FieldPanel("techo_servidor_mb"),
    ]

    class Meta:
        verbose_name = "Ajustes de carga y videos"

    def video_max_bytes(self):
        valor = self.video_max_valor or 200
        unidad = (self.video_max_unidad or "MB").upper()
        bruto = valor * (1024 ** 3 if unidad == "GB" else 1024 ** 2)
        techo = (self.techo_servidor_mb or 2048) * 1024 * 1024
        return min(bruto, techo)

    def video_max_legible(self):
        unidad = (self.video_max_unidad or "MB").upper()
        return f"{self.video_max_valor} {unidad}"
