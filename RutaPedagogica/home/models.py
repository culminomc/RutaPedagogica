from django.db import models
from modelcluster.fields import ParentalKey
from modelcluster.models import ClusterableModel
from wagtail.admin.panels import FieldPanel, HelpPanel, InlinePanel, MultiFieldPanel, ObjectList, PageChooserPanel, TabbedInterface
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
            ObjectList(content_panels, heading="Portada"),
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
        features=["h2", "h3", "bold", "italic", "ol", "ul", "link", "document-link", "image"],
    )
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
    ]

    parent_page_types = ["home.HomePage", "home.ContenidoPage"]
    subpage_types = ["home.ContenidoPage"]

    class Meta:
        verbose_name = "Página de contenido"
        verbose_name_plural = "Páginas de contenido"


RICHTEXT_SECCION = ["h2", "h3", "bold", "italic", "ol", "ul", "link", "document-link", "image"]


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
    panels = [FieldPanel("title"), FieldPanel("theme"), FieldPanel("image")]


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
    panels = [FieldPanel("badge"), FieldPanel("title"), FieldPanel("caption"), FieldPanel("theme"), FieldPanel("image")]


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
