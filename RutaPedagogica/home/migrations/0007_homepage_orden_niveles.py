from django.db import migrations, models
import django.db.models.deletion
import modelcluster.fields


SECCIONES = [
    "portada",
    "ejes",
    "niveles",
    "carrusel",
    "impacto",
    "escuelas",
    "galeria",
    "biblioteca",
    "contacto",
]

NIVELES = [
    (
        "Nivel Inicial",
        "Propuestas lúdicas y de exploración para las salas de Tierra del Fuego, articuladas con las tres rutas temáticas.",
        "bio",
        "ph-plant",
    ),
    (
        "Nivel Primario",
        "Proyectos áulicos que integran bioeconomía, datos e inteligencia artificial y videojuegos en el primer y segundo ciclo.",
        "data",
        "ph-book-open",
    ),
    (
        "Nivel Secundario",
        "Investigación, pitch y producción de proyectos con las tres rutas temáticas hacia Fábrica de Talentos e I.P.R.A.",
        "game",
        "ph-graduation-cap",
    ),
]


LAYOUT_FIELDS = dict(
    name="HomeLayoutSection",
    fields=[
        ("id", models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name="ID")),
        ("sort_order", models.IntegerField(blank=True, editable=False, null=True)),
        (
            "clave",
            models.CharField(
                choices=[
                    ("portada", "Portada"),
                    ("ejes", "Ejes pedagógicos y 3 rutas"),
                    ("niveles", "Niveles (Inicial, Primario y Secundario)"),
                    ("carrusel", "Carrusel"),
                    ("impacto", "Impacto"),
                    ("escuelas", "Escuelas"),
                    ("galeria", "Galería y voces"),
                    ("biblioteca", "Biblioteca"),
                    ("contacto", "Contacto"),
                ],
                max_length=30,
                verbose_name="sección",
            ),
        ),
        ("visible", models.BooleanField(default=True, verbose_name="mostrar en el sitio")),
        (
            "page",
            modelcluster.fields.ParentalKey(
                on_delete=django.db.models.deletion.CASCADE,
                related_name="layout_sections",
                to="home.homepage",
            ),
        ),
    ],
    options={
        "verbose_name": "sección de la portada",
        "verbose_name_plural": "secciones de la portada",
        "ordering": ["sort_order"],
        "abstract": False,
    },
)

NIVEL_FIELDS = dict(
    name="HomeNivel",
    fields=[
        ("id", models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name="ID")),
        ("sort_order", models.IntegerField(blank=True, editable=False, null=True)),
        ("titulo", models.CharField(default="Nivel Inicial", max_length=80, verbose_name="título")),
        ("bajada", models.TextField(blank=True, verbose_name="descripción")),
        (
            "theme",
            models.CharField(
                choices=[
                    ("bio", "Verde · Bioeconomía"),
                    ("data", "Azul · Datos e IA"),
                    ("game", "Rojo · Videojuegos"),
                    ("neutral", "Neutro"),
                ],
                default="bio",
                max_length=20,
                verbose_name="color",
            ),
        ),
        ("icon", models.CharField(default="ph-plant", max_length=60, verbose_name="ícono Phosphor")),
        (
            "pagina",
            models.ForeignKey(
                blank=True,
                help_text="Opcional. Si está cargada, el recuadro abre esa página.",
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                related_name="+",
                to="wagtailcore.page",
                verbose_name="página vinculada",
            ),
        ),
        (
            "page",
            modelcluster.fields.ParentalKey(
                on_delete=django.db.models.deletion.CASCADE,
                related_name="niveles_home",
                to="home.homepage",
            ),
        ),
    ],
    options={
        "verbose_name": "nivel educativo",
        "verbose_name_plural": "niveles educativos",
        "ordering": ["sort_order"],
        "abstract": False,
    },
)


def create_tables(apps, schema_editor):
    connection = schema_editor.connection
    if connection.vendor == "microsoft":
        with connection.cursor() as cursor:
            cursor.execute(
                """
                IF OBJECT_ID(N'dbo.home_homelayoutsection', N'U') IS NULL
                BEGIN
                    CREATE TABLE [home_homelayoutsection] (
                        [id] bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
                        [sort_order] int NULL,
                        [clave] nvarchar(30) NOT NULL,
                        [visible] bit NOT NULL,
                        [page_id] bigint NOT NULL
                    );
                    ALTER TABLE [home_homelayoutsection] WITH CHECK ADD CONSTRAINT [home_homelayoutsection_page_id_fk]
                        FOREIGN KEY ([page_id]) REFERENCES [home_homepage]([page_ptr_id]);
                    CREATE INDEX [home_homelayoutsection_page_id] ON [home_homelayoutsection]([page_id]);
                END
                """
            )
            cursor.execute(
                """
                IF OBJECT_ID(N'dbo.home_homenivel', N'U') IS NULL
                BEGIN
                    CREATE TABLE [home_homenivel] (
                        [id] bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
                        [sort_order] int NULL,
                        [titulo] nvarchar(80) NOT NULL,
                        [bajada] nvarchar(max) NOT NULL,
                        [theme] nvarchar(20) NOT NULL,
                        [icon] nvarchar(60) NOT NULL,
                        [pagina_id] bigint NULL,
                        [page_id] bigint NOT NULL
                    );
                    ALTER TABLE [home_homenivel] WITH CHECK ADD CONSTRAINT [home_homenivel_page_id_fk]
                        FOREIGN KEY ([page_id]) REFERENCES [home_homepage]([page_ptr_id]);
                    ALTER TABLE [home_homenivel] WITH CHECK ADD CONSTRAINT [home_homenivel_pagina_id_fk]
                        FOREIGN KEY ([pagina_id]) REFERENCES [wagtailcore_page]([id]);
                    CREATE INDEX [home_homenivel_page_id] ON [home_homenivel]([page_id]);
                    CREATE INDEX [home_homenivel_pagina_id] ON [home_homenivel]([pagina_id]);
                END
                """
            )
        return
    HomeLayoutSection = apps.get_model("home", "HomeLayoutSection")
    HomeNivel = apps.get_model("home", "HomeNivel")
    schema_editor.create_model(HomeLayoutSection)
    schema_editor.create_model(HomeNivel)


def drop_tables(apps, schema_editor):
    connection = schema_editor.connection
    if connection.vendor == "microsoft":
        with connection.cursor() as cursor:
            cursor.execute("IF OBJECT_ID(N'dbo.home_homenivel', N'U') IS NOT NULL DROP TABLE [home_homenivel];")
            cursor.execute(
                "IF OBJECT_ID(N'dbo.home_homelayoutsection', N'U') IS NOT NULL DROP TABLE [home_homelayoutsection];"
            )
        return
    HomeNivel = apps.get_model("home", "HomeNivel")
    HomeLayoutSection = apps.get_model("home", "HomeLayoutSection")
    schema_editor.delete_model(HomeNivel)
    schema_editor.delete_model(HomeLayoutSection)


def seed_layout(apps, schema_editor):
    HomePage = apps.get_model("home", "HomePage")
    Layout = apps.get_model("home", "HomeLayoutSection")
    Nivel = apps.get_model("home", "HomeNivel")
    for page in HomePage.objects.all():
        if not Layout.objects.filter(page_id=page.page_ptr_id).exists():
            for index, clave in enumerate(SECCIONES):
                Layout.objects.create(page_id=page.page_ptr_id, clave=clave, sort_order=index, visible=True)
        if not Nivel.objects.filter(page_id=page.page_ptr_id).exists():
            for index, (titulo, bajada, theme, icon) in enumerate(NIVELES):
                Nivel.objects.create(
                    page_id=page.page_ptr_id,
                    titulo=titulo,
                    bajada=bajada,
                    theme=theme,
                    icon=icon,
                    sort_order=index,
                )


def unseed_layout(apps, schema_editor):
    Layout = apps.get_model("home", "HomeLayoutSection")
    Nivel = apps.get_model("home", "HomeNivel")
    Layout.objects.all().delete()
    Nivel.objects.all().delete()


class Migration(migrations.Migration):

    dependencies = [
        ("home", "0006_ajustes_video_contenido"),
        ("wagtailcore", "0098_apitoken"),
    ]

    operations = [
        migrations.AddField(
            model_name="homepage",
            name="niveles_etiqueta",
            field=models.CharField(
                default="Alcance curricular",
                max_length=120,
                verbose_name="etiqueta de niveles",
            ),
        ),
        migrations.AddField(
            model_name="homepage",
            name="niveles_titulo",
            field=models.CharField(
                default="Nivel Inicial, Nivel Primario y Nivel Secundario",
                max_length=180,
                verbose_name="título de niveles",
            ),
        ),
        migrations.SeparateDatabaseAndState(
            state_operations=[
                migrations.CreateModel(**LAYOUT_FIELDS),
                migrations.CreateModel(**NIVEL_FIELDS),
            ],
            database_operations=[
                migrations.RunPython(create_tables, drop_tables),
            ],
        ),
        migrations.RunPython(seed_layout, unseed_layout),
    ]
