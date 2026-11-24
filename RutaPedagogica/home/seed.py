"""Carga inicial tomada de la página pública de Rutas Pedagógicas."""


def seed_homepage():
    from home.models import (
        CityStat,
        GalleryItem,
        HeroSlide,
        HomePage,
        Metric,
        Resource,
        Route,
        RouteLevel,
        School,
        SocialLink,
        Testimonial,
    )

    page = HomePage.objects.first()
    if page is None or page.metrics.exists():
        return page

    page.title = "Rutas Pedagógicas"
    page.draft_title = "Rutas Pedagógicas"
    page.seo_title = "Rutas Pedagógicas | Agencia de Innovación Fueguina"
    page.search_description = (
        "Programa educativo provincial de Tierra del Fuego. Rutas de videojuegos, "
        "ciencia de datos e IA, y biotecnología en Ushuaia, Tolhuin y Río Grande."
    )
    page.save()
    page.save_revision().publish()

    slides = [
        ("Presentación de Videojuegos · Escuelas de Tierra del Fuego", "game"),
        ("Estudiantes Programando en Rutas Pedagógicas", "data"),
        ("Exposición de Ciencia de Datos e IA · Agencia de Innovación", "bio"),
    ]
    for title, theme in slides:
        HeroSlide.objects.create(page=page, title=title, theme=theme)

    metrics = [
        (7, "Rutas registradas", "3 en Ushuaia · 1 en Tolhuin · 3 en Río Grande · En expansión", "game", "ph-map-pin-line"),
        (56, "Docentes en capacitación", "14 en Ushuaia · 6 en Tolhuin · 36 en Río Grande · Formación continua", "data", "ph-chalkboard-teacher"),
        (364, "Estudiantes protagonistas", "52 en Ushuaia · 51 en Tolhuin · 261 en Río Grande · Talleres activos", "game", "ph-student"),
        (420, "Total participantes", "Cifras en actualización permanente en toda la provincia", "bio", "ph-users-four"),
    ]
    for value, label, detail, theme, icon in metrics:
        Metric.objects.create(page=page, value=value, label=label, detail=detail, theme=theme, icon=icon)

    cities = [
        ("Ushuaia", 3, 14, 52, "game"),
        ("Tolhuin", 1, 6, 51, "bio"),
        ("Río Grande", 3, 36, 261, "data"),
    ]
    for city, routes, teachers, students, theme in cities:
        CityStat.objects.create(
            page=page, city=city, routes=routes, teachers=teachers, students=students, theme=theme
        )

    schools = [
        ("Colegio Provincial Kloketén", "Ushuaia", "Secundario", "Ciencia de Datos e IA", "Equipo Docente Ushuaia · Ruta 1"),
        ("Escuela Provincial N° 1 Domingo Faustino Sarmiento", "Ushuaia", "Primario", "Biotecnología y Bioeconomía", "Equipo Docente Ushuaia · Ruta 2"),
        ("Colegio Técnico Provincial Olga B. de Arko", "Ushuaia", "Secundario", "Industria del Videojuego", "Equipo Docente Ushuaia · Ruta 3"),
        ("Colegio Provincial Ramón Alberto Trejo Noel", "Tolhuin", "Secundario", "Biotecnología y Bioeconomía", "Equipo Docente Tolhuin · Ruta 1"),
        ("Colegio Provincial Dr. Ernesto Guevara", "Río Grande", "Secundario", "Industria del Videojuego", "Equipo Docente Río Grande · Ruta 1"),
        ("Escuela Provincial N° 2 Dr. Benjamín Zorrilla", "Río Grande", "Primario", "Ciencia de Datos e IA", "Equipo Docente Río Grande · Ruta 2"),
        ("Escuela Provincial N° 21 Provincias Unidas", "Río Grande", "Primario", "Biotecnología y Bioeconomía", "Equipo Docente Río Grande · Ruta 3"),
    ]
    for name, city, level, route, teachers in schools:
        School.objects.create(page=page, name=name, city=city, level=level, route=route, teachers=teachers)

    gallery = [
        ("Ilustración IA · Ruta Verde", "Laboratorio de Biotecnología Austral", "Representación conceptual sobre exploración científica de turberas y ecosistemas fueguinos.", "bio"),
        ("Ilustración IA · Ruta Azul", "Ciencia de Datos e IA en el Fin del Mundo", "Visualización sobre análisis de datos climáticos y aprendizaje automático en aulas de TDF.", "data"),
        ("Ilustración IA · Ruta Rojo", "Creación de Videojuegos Fueguinos", "Arte conceptual sobre diseño interactivo y narrativa digital con identidad provincial.", "game"),
        ("Espacio Foto · Ushuaia", "Jornada en Escuelas de Ushuaia", "Fotografía de los estudiantes o docentes trabajando en Ushuaia.", "game"),
        ("Espacio Foto · Tolhuin", "Encuentro en Escuelas de Tolhuin", "Fotografía de la ruta pedagógica en el corazón de la isla.", "bio"),
        ("Espacio Foto · Río Grande", "Presentación en Escuelas de Río Grande", "Fotografía de los talleres y exposiciones en Río Grande.", "data"),
    ]
    for badge, title, caption, theme in gallery:
        GalleryItem.objects.create(page=page, badge=badge, title=title, caption=caption, theme=theme)

    testimonials = [
        ("docente", "Directiva · Ushuaia", "Prof. Marta Villarroel", "Biotecnología y Bioeconomía", "bio", "Rutas Pedagógicas nos dio un marco ordenado y riguroso para que docentes con años de trayectoria nos animemos a experimentar con biotecnología aplicada al entorno fueguino."),
        ("docente", "Docente · Río Grande", "Prof. Carlos Oyarzún", "Ciencia de Datos e IA", "data", "Con 36 docentes y más de 260 estudiantes participando en Río Grande, logramos que los chicos analicen datos reales de nuestra ciudad y los defiendan con orgullo."),
        ("estudiante", "Estudiante · Tolhuin", "Valentina Ríos", "Industria del Videojuego", "game", "Trabajar en equipo desde nuestra escuela en Tolhuin y compartir proyectos con chicos de toda la provincia fue una experiencia única que nos motiva a seguir creando."),
    ]
    for category, role, author, route, theme, quote in testimonials:
        Testimonial.objects.create(
            page=page, category=category, role=role, author=author, route=route, theme=theme, quote=quote
        )

    routes = [
        {
            "code": "Ruta 01 · Rojo",
            "title": "Industria del Videojuego",
            "subtitle": "Diseño, narrativa interactiva, arte digital y lógica de programación lúdica.",
            "summary": "Transforma a los estudiantes en creadores de experiencias interactivas con identidad fueguina, abordando mecánicas y prototipado funcional.",
            "theme": "game",
            "icon": "ph-game-controller",
            "external_url": "https://script.google.com/macros/s/AKfycbyCctCBuH-sWa46nHw8gi1xqv3E-fBqFDpWrrd6nkgZbiCQ076z2pHL8-V1r3hLDPu9/exec",
            "levels": [
                ("Nivel Inicial", "Pensamiento computacional desenchufado, secuencias lógicas mediante juego corporal y creación de historias interactivas ilustradas."),
                ("Nivel Primario", "Programación por bloques (Scratch), diseño de personajes inspirados en la fauna fueguina y mecánicas básicas de puntaje y niveles."),
                ("Nivel Secundario", "Diseño de videojuegos 2D/3D, narrativa transmedia, arte pixel/vectorial, sonido y prototipado funcional con defensa en formato Pitch."),
            ],
        },
        {
            "code": "Ruta 02 · Azul",
            "title": "Ciencia de Datos e Inteligencia Artificial",
            "subtitle": "Análisis de información, visualización y uso ético de modelos de IA.",
            "summary": "Promueve la alfabetización en datos reales de la provincia, el entrenamiento de modelos y la reflexión crítica sobre ética en la IA.",
            "theme": "data",
            "icon": "ph-cpu",
            "external_url": "https://script.google.com/macros/s/AKfycbz1rRkRHKrijBjktU59ymNBxSE62NGRtHtmCr0icjDDl1ayFg8PnHcSIJw7oiqMTI2bIA/exec",
            "levels": [
                ("Nivel Inicial", "Clasificación de objetos, reconocimiento de patrones visuales y comprensión temprana de cómo aprenden las máquinas a través del juego."),
                ("Nivel Primario", "Recolección de datos del entorno escolar, gráficos visuales simples y entrenamiento de modelos de reconocimiento de imágenes y sonidos."),
                ("Nivel Secundario", "Análisis de datasets reales de Tierra del Fuego (clima, energía, turismo), programación inicial en Python, visualización y debate ético sobre IA."),
            ],
        },
        {
            "code": "Ruta 03 · Verde",
            "title": "Biotecnología y Bioeconomía",
            "subtitle": "Ciencias biológicas aplicadas a los recursos naturales y sostenibilidad fueguina.",
            "summary": "Conecta el laboratorio escolar con los ecosistemas subantárticos, la turba, los bosques y el mar austral para idear soluciones sostenibles.",
            "theme": "bio",
            "icon": "ph-flask",
            "external_url": "https://script.google.com/macros/s/AKfycbyhREv8iO6ZnjvhXLxaIbZN7mCkJhUANTOi3eFzzVOCb_OboppY-Wu8vP5g8T-ZR9Y/exec",
            "levels": [
                ("Nivel Inicial", "Exploración sensorial de la naturaleza fueguina, germinación, observación con lupas y cuidado de los ecosistemas locales."),
                ("Nivel Primario", "Experimentos de microbiología cotidiana (levaduras, compostaje), ciclos de la materia y aprovechamiento responsable de recursos naturales."),
                ("Nivel Secundario", "Biotecnología aplicada a turberas, algas y bosques subantárticos; desarrollo de bioinsumos y proyectos de economía circular provincial."),
            ],
        },
    ]
    for item in routes:
        levels = item.pop("levels")
        route = Route.objects.create(page=page, **item)
        for level, description in levels:
            RouteLevel.objects.create(route=route, level=level, description=description)

    resources = [
        ("Manual Docente: Introducción a la Biotecnología Fueguina", "Primario", "Biotecnología", "Manual PDF · 42 págs.", "Secuencias experimentales seguras para realizar en el aula con recursos locales.", "bio"),
        ("Cuadernillo de Ciencia de Datos e IA Ética en el Aula", "Secundario", "Ciencia de Datos", "Guía Metodológica · 56 págs.", "Actividades prácticas con datasets provinciales y talleres de pensamiento crítico.", "data"),
        ("Taller de Diseño Narrativo y Videojuegos Desenchufados", "Inicial", "Videojuegos", "Kit Didáctico · Imprimible", "Tarjetas de secuencias lógicas y dinámicas lúdicas sin necesidad de pantallas.", "game"),
        ("Plantilla de Planificación Interdisciplinaria por Rutas", "Secundario", "Transversal", "Plantilla Editable", "Matriz para articular espacios curriculares y evaluar competencias digitales.", "neutral"),
        ("Primeros Pasos en Programación Creativa con Bloques", "Primario", "Videojuegos", "Guía Paso a Paso", "Proyectos guiados para crear trivias y juegos sobre geografía de Tierra del Fuego.", "game"),
        ("Exploradores de la Naturaleza Austral: Bitácora Inicial", "Inicial", "Biotecnología", "Cuaderno de Campo", "Propuestas de indagación ambiental adaptadas a salas de 4 y 5 años.", "bio"),
    ]
    for title, level, route, kind, description, theme in resources:
        Resource.objects.create(
            page=page, title=title, level=level, route=route, kind=kind, description=description, theme=theme
        )

    links = [
        ("@aif.tdf", "https://www.facebook.com/aif.tdf", "ph-fill ph-facebook-logo"),
        ("@aif.tdf", "https://www.instagram.com/aif.tdf", "ph-bold ph-instagram-logo"),
        ("@conocimientotdf", "https://www.tiktok.com/@conocimientotdf", "ph-fill ph-tiktok-logo"),
        ("Polos Creativos", "https://polos.aif.gob.ar/", "ph ph-globe"),
        ("Sitio Web AIF", "https://www.aif.gob.ar/", "ph ph-globe"),
        ("Campus Virtual TDF", "https://educaciondigital.tierradelfuego.edu.ar/campusvirtual/login/index.php", "ph-bold ph-graduation-cap"),
    ]
    for label, url, icon in links:
        SocialLink.objects.create(page=page, label=label, url=url, icon=icon)

    return page


def _publish_child(parent, page):
    parent.add_child(instance=page)
    page.save_revision().publish()
    return page.specific


def seed_editorial_pages():
    """Crea las páginas editables de las 3 rutas y de Descubrí más."""
    from home.models import DescubriMasPage, ExplorarBloque, HomePage, RutaBloque, RutaNivel, RutaTematicaPage

    home = HomePage.objects.first()
    if home is None:
        return None

    rutas = [
        {
            "slug": "industria-del-videojuego",
            "title": "Industria del Videojuego",
            "code": "Ruta 01 · Rojo",
            "theme": "game",
            "icon": "ph-game-controller",
            "subtitle": "Diseño, narrativa interactiva, arte digital y lógica de programación lúdica.",
            "summary": "Transforma a los estudiantes en creadores de experiencias interactivas con identidad fueguina, abordando mecánicas y prototipado funcional.",
            "enlace_externo": "https://script.google.com/macros/s/AKfycbyCctCBuH-sWa46nHw8gi1xqv3E-fBqFDpWrrd6nkgZbiCQ076z2pHL8-V1r3hLDPu9/exec",
            "cuerpo": (
                "<h2>Qué propone esta ruta</h2>"
                "<p>La ruta de Industria del Videojuego invita a las escuelas a diseñar juegos, historias y prototipos con identidad de Tierra del Fuego. El trabajo articula arte digital, narrativa, sonido y pensamiento computacional.</p>"
                "<h2>Cómo se trabaja</h2>"
                "<p>Los equipos avanzan desde el juego desenchufado hasta el prototipo funcional. Cada nivel suma herramientas, pero el eje es el mismo: crear, probar y defender una idea propia.</p>"
            ),
            "niveles": [
                ("Nivel Inicial", "Pensamiento computacional desenchufado, secuencias lógicas mediante juego corporal y creación de historias interactivas ilustradas."),
                ("Nivel Primario", "Programación por bloques (Scratch), diseño de personajes inspirados en la fauna fueguina y mecánicas básicas de puntaje y niveles."),
                ("Nivel Secundario", "Diseño de videojuegos 2D/3D, narrativa transmedia, arte pixel/vectorial, sonido y prototipado funcional con defensa en formato Pitch."),
            ],
            "bloques": [
                (
                    "Objetivos de aprendizaje",
                    "<ul><li>Diseñar personajes, escenarios y reglas de juego.</li><li>Traducir una idea en una mecánica jugable.</li><li>Presentar el prototipo en formato pitch.</li></ul>",
                ),
                (
                    "Recursos y continuidad",
                    "<p>Los materiales de la biblioteca y el Campus Virtual complementan esta ruta. El contenido de esta página se puede actualizar desde el panel de administración.</p>",
                ),
            ],
        },
        {
            "slug": "ciencia-de-datos-e-inteligencia-artificial",
            "title": "Ciencia de Datos e Inteligencia Artificial",
            "code": "Ruta 02 · Azul",
            "theme": "data",
            "icon": "ph-cpu",
            "subtitle": "Análisis de información, visualización y uso ético de modelos de IA.",
            "summary": "Promueve la alfabetización en datos reales de la provincia, el entrenamiento de modelos y la reflexión crítica sobre ética en la IA.",
            "enlace_externo": "https://script.google.com/macros/s/AKfycbz1rRkRHKrijBjktU59ymNBxSE62NGRtHtmCr0icjDDl1ayFg8PnHcSIJw7oiqMTI2bIA/exec",
            "cuerpo": (
                "<h2>Qué propone esta ruta</h2>"
                "<p>La ruta de Ciencia de Datos e Inteligencia Artificial acerca a estudiantes y docentes al análisis de información real de Tierra del Fuego: clima, energía, turismo y datos escolares.</p>"
                "<h2>Enfoque ético</h2>"
                "<p>Además de visualizar y entrenar modelos, cada propuesta incluye un espacio para preguntarse qué datos se usan, para qué y con qué cuidado.</p>"
            ),
            "niveles": [
                ("Nivel Inicial", "Clasificación de objetos, reconocimiento de patrones visuales y comprensión temprana de cómo aprenden las máquinas a través del juego."),
                ("Nivel Primario", "Recolección de datos del entorno escolar, gráficos visuales simples y entrenamiento de modelos de reconocimiento de imágenes y sonidos."),
                ("Nivel Secundario", "Análisis de datasets reales de Tierra del Fuego (clima, energía, turismo), programación inicial en Python, visualización y debate ético sobre IA."),
            ],
            "bloques": [
                (
                    "Objetivos de aprendizaje",
                    "<ul><li>Recolectar, ordenar y leer datos del entorno.</li><li>Visualizar información con gráficos claros.</li><li>Reflexionar sobre el uso ético de la inteligencia artificial.</li></ul>",
                ),
            ],
        },
        {
            "slug": "biotecnologia-y-bioeconomia",
            "title": "Biotecnología y Bioeconomía",
            "code": "Ruta 03 · Verde",
            "theme": "bio",
            "icon": "ph-flask",
            "subtitle": "Ciencias biológicas aplicadas a los recursos naturales y sostenibilidad fueguina.",
            "summary": "Conecta el laboratorio escolar con los ecosistemas subantárticos, la turba, los bosques y el mar austral para idear soluciones sostenibles.",
            "enlace_externo": "https://script.google.com/macros/s/AKfycbyhREv8iO6ZnjvhXLxaIbZN7mCkJhUANTOi3eFzzVOCb_OboppY-Wu8vP5g8T-ZR9Y/exec",
            "cuerpo": (
                "<h2>Qué propone esta ruta</h2>"
                "<p>La ruta de Biotecnología y Bioeconomía vincula el aula con los ecosistemas de la provincia: turberas, bosques, algas y el mar austral. El objetivo es observar, experimentar y diseñar soluciones sostenibles.</p>"
                "<h2>Del laboratorio al territorio</h2>"
                "<p>Las propuestas van de la exploración sensorial a proyectos de bioinsumos y economía circular, siempre con cuidado del entorno fueguino.</p>"
            ),
            "niveles": [
                ("Nivel Inicial", "Exploración sensorial de la naturaleza fueguina, germinación, observación con lupas y cuidado de los ecosistemas locales."),
                ("Nivel Primario", "Experimentos de microbiología cotidiana (levaduras, compostaje), ciclos de la materia y aprovechamiento responsable de recursos naturales."),
                ("Nivel Secundario", "Biotecnología aplicada a turberas, algas y bosques subantárticos; desarrollo de bioinsumos y proyectos de economía circular provincial."),
            ],
            "bloques": [
                (
                    "Objetivos de aprendizaje",
                    "<ul><li>Observar y registrar el entorno natural local.</li><li>Experimentar con procesos biológicos seguros en el aula.</li><li>Diseñar ideas de aprovechamiento responsable de recursos.</li></ul>",
                ),
            ],
        },
    ]

    created = []
    for item in rutas:
        existing = RutaTematicaPage.objects.filter(slug=item["slug"]).first()
        if existing:
            created.append(existing)
            continue
        niveles = item.pop("niveles")
        bloques = item.pop("bloques")
        page = RutaTematicaPage(
            seo_title=f"{item['title']} | Rutas Pedagógicas",
            search_description=item["summary"],
            **item,
        )
        _publish_child(home, page)
        for level, description in niveles:
            RutaNivel.objects.create(page=page, level=level, description=description)
        for titulo, texto in bloques:
            RutaBloque.objects.create(page=page, titulo=titulo, texto=texto)
        created.append(page)

    for route in home.routes.all():
        match = next((item for item in created if item.title == route.title), None)
        if match and route.pagina_id != match.id:
            route.pagina = match
            route.save()

    descubri = DescubriMasPage.objects.filter(slug="descubri-mas").first()
    if descubri is None:
        descubri = DescubriMasPage(
            title="Descubrí más",
            slug="descubri-mas",
            seo_title="Descubrí más | Rutas Pedagógicas",
            search_description="Programa educativo provincial de Rutas Pedagógicas en Tierra del Fuego.",
            intro="Un espacio digital para integrar, organizar y compartir propuestas educativas innovadoras en Ushuaia, Tolhuin y Río Grande.",
            cuerpo=(
                "<h2>El programa</h2>"
                "<p>Rutas Pedagógicas articula ciencia, tecnología y creatividad en las aulas fueguinas. Acompañamos a docentes y estudiantes en tres ejes: Industria del Videojuego, Ciencia de Datos e Inteligencia Artificial, y Biotecnología y Bioeconomía.</p>"
                "<h2>Qué vas a encontrar</h2>"
                "<p>En cada ruta hay una progresión por nivel, materiales de apoyo y un recorrido para sumar a tu escuela. El contenido de esta sección se edita desde el panel de administración, sin cambiar el código del sitio.</p>"
                "<h2>Cómo participar</h2>"
                "<p>Completá el <a href=\"/#contacto\">formulario de Vinculación Educativa</a> o escribinos a rutaspedagogicas@aif.gob.ar. También podés seguir el trabajo territorial en Instagram.</p>"
            ),
        )
        _publish_child(home, descubri)
        ExplorarBloque.objects.create(
            page=descubri,
            titulo="Territorio",
            texto="<p>El programa se desarrolla en Ushuaia, Tolhuin y Río Grande, con sedes en Fábrica de Talentos e I.P.R.A.</p>",
            enlace="/#escuelas",
            enlace_texto="Ver escuelas participantes",
        )
        ExplorarBloque.objects.create(
            page=descubri,
            titulo="Biblioteca y campus",
            texto="<p>Manuales, guías y aulas virtuales complementan el trabajo en cada ruta.</p>",
            enlace="/#biblioteca",
            enlace_texto="Ir a la biblioteca",
        )

    if home.cta_pagina_id != descubri.id:
        home.cta_pagina = descubri
        home.save_revision().publish()

    return created
