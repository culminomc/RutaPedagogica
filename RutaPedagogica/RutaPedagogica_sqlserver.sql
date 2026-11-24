/* Rutas Pedagógicas — volcado SQLite -> SQL Server */
/* Generado desde db.sqlite3 del sistema actual */
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF DB_ID(N'RutaPedagogica') IS NULL CREATE DATABASE [RutaPedagogica] COLLATE Modern_Spanish_CI_AS;
GO
ALTER DATABASE [RutaPedagogica] SET RECOVERY SIMPLE;
GO
USE [RutaPedagogica];
GO

DECLARE @drop_fk NVARCHAR(MAX) = N'';
SELECT @drop_fk = @drop_fk + N'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id))
    + N'.' + QUOTENAME(OBJECT_NAME(parent_object_id)) + N' DROP CONSTRAINT ' + QUOTENAME(name) + N';'
FROM sys.foreign_keys;
IF @drop_fk <> N'' EXEC sp_executesql @drop_fk;
GO

IF OBJECT_ID(N'dbo.auth_group', N'U') IS NOT NULL DROP TABLE [auth_group];
IF OBJECT_ID(N'dbo.auth_group_permissions', N'U') IS NOT NULL DROP TABLE [auth_group_permissions];
IF OBJECT_ID(N'dbo.auth_permission', N'U') IS NOT NULL DROP TABLE [auth_permission];
IF OBJECT_ID(N'dbo.auth_user', N'U') IS NOT NULL DROP TABLE [auth_user];
IF OBJECT_ID(N'dbo.auth_user_groups', N'U') IS NOT NULL DROP TABLE [auth_user_groups];
IF OBJECT_ID(N'dbo.auth_user_user_permissions', N'U') IS NOT NULL DROP TABLE [auth_user_user_permissions];
IF OBJECT_ID(N'dbo.django_admin_log', N'U') IS NOT NULL DROP TABLE [django_admin_log];
IF OBJECT_ID(N'dbo.django_content_type', N'U') IS NOT NULL DROP TABLE [django_content_type];
IF OBJECT_ID(N'dbo.django_migrations', N'U') IS NOT NULL DROP TABLE [django_migrations];
IF OBJECT_ID(N'dbo.django_session', N'U') IS NOT NULL DROP TABLE [django_session];
IF OBJECT_ID(N'dbo.home_ajustessitio', N'U') IS NOT NULL DROP TABLE [home_ajustessitio];
IF OBJECT_ID(N'dbo.home_citystat', N'U') IS NOT NULL DROP TABLE [home_citystat];
IF OBJECT_ID(N'dbo.home_consulta', N'U') IS NOT NULL DROP TABLE [home_consulta];
IF OBJECT_ID(N'dbo.home_contenidopage', N'U') IS NOT NULL DROP TABLE [home_contenidopage];
IF OBJECT_ID(N'dbo.home_descubrimaspage', N'U') IS NOT NULL DROP TABLE [home_descubrimaspage];
IF OBJECT_ID(N'dbo.home_explorarbloque', N'U') IS NOT NULL DROP TABLE [home_explorarbloque];
IF OBJECT_ID(N'dbo.home_galleryitem', N'U') IS NOT NULL DROP TABLE [home_galleryitem];
IF OBJECT_ID(N'dbo.home_heroslide', N'U') IS NOT NULL DROP TABLE [home_heroslide];
IF OBJECT_ID(N'dbo.home_homepage', N'U') IS NOT NULL DROP TABLE [home_homepage];
IF OBJECT_ID(N'dbo.home_metric', N'U') IS NOT NULL DROP TABLE [home_metric];
IF OBJECT_ID(N'dbo.home_resource', N'U') IS NOT NULL DROP TABLE [home_resource];
IF OBJECT_ID(N'dbo.home_route', N'U') IS NOT NULL DROP TABLE [home_route];
IF OBJECT_ID(N'dbo.home_routelevel', N'U') IS NOT NULL DROP TABLE [home_routelevel];
IF OBJECT_ID(N'dbo.home_rutabloque', N'U') IS NOT NULL DROP TABLE [home_rutabloque];
IF OBJECT_ID(N'dbo.home_rutanivel', N'U') IS NOT NULL DROP TABLE [home_rutanivel];
IF OBJECT_ID(N'dbo.home_rutatematicapage', N'U') IS NOT NULL DROP TABLE [home_rutatematicapage];
IF OBJECT_ID(N'dbo.home_school', N'U') IS NOT NULL DROP TABLE [home_school];
IF OBJECT_ID(N'dbo.home_sociallink', N'U') IS NOT NULL DROP TABLE [home_sociallink];
IF OBJECT_ID(N'dbo.home_testimonial', N'U') IS NOT NULL DROP TABLE [home_testimonial];
IF OBJECT_ID(N'dbo.taggit_tag', N'U') IS NOT NULL DROP TABLE [taggit_tag];
IF OBJECT_ID(N'dbo.taggit_taggeditem', N'U') IS NOT NULL DROP TABLE [taggit_taggeditem];
IF OBJECT_ID(N'dbo.wagtailadmin_admin', N'U') IS NOT NULL DROP TABLE [wagtailadmin_admin];
IF OBJECT_ID(N'dbo.wagtailadmin_editingsession', N'U') IS NOT NULL DROP TABLE [wagtailadmin_editingsession];
IF OBJECT_ID(N'dbo.wagtailadmin_formstate', N'U') IS NOT NULL DROP TABLE [wagtailadmin_formstate];
IF OBJECT_ID(N'dbo.wagtailcore_apitoken', N'U') IS NOT NULL DROP TABLE [wagtailcore_apitoken];
IF OBJECT_ID(N'dbo.wagtailcore_collection', N'U') IS NOT NULL DROP TABLE [wagtailcore_collection];
IF OBJECT_ID(N'dbo.wagtailcore_collectionviewrestriction', N'U') IS NOT NULL DROP TABLE [wagtailcore_collectionviewrestriction];
IF OBJECT_ID(N'dbo.wagtailcore_collectionviewrestriction_groups', N'U') IS NOT NULL DROP TABLE [wagtailcore_collectionviewrestriction_groups];
IF OBJECT_ID(N'dbo.wagtailcore_comment', N'U') IS NOT NULL DROP TABLE [wagtailcore_comment];
IF OBJECT_ID(N'dbo.wagtailcore_commentreply', N'U') IS NOT NULL DROP TABLE [wagtailcore_commentreply];
IF OBJECT_ID(N'dbo.wagtailcore_groupapprovaltask', N'U') IS NOT NULL DROP TABLE [wagtailcore_groupapprovaltask];
IF OBJECT_ID(N'dbo.wagtailcore_groupapprovaltask_groups', N'U') IS NOT NULL DROP TABLE [wagtailcore_groupapprovaltask_groups];
IF OBJECT_ID(N'dbo.wagtailcore_groupcollectionpermission', N'U') IS NOT NULL DROP TABLE [wagtailcore_groupcollectionpermission];
IF OBJECT_ID(N'dbo.wagtailcore_grouppagepermission', N'U') IS NOT NULL DROP TABLE [wagtailcore_grouppagepermission];
IF OBJECT_ID(N'dbo.wagtailcore_groupsitepermission', N'U') IS NOT NULL DROP TABLE [wagtailcore_groupsitepermission];
IF OBJECT_ID(N'dbo.wagtailcore_locale', N'U') IS NOT NULL DROP TABLE [wagtailcore_locale];
IF OBJECT_ID(N'dbo.wagtailcore_modellogentry', N'U') IS NOT NULL DROP TABLE [wagtailcore_modellogentry];
IF OBJECT_ID(N'dbo.wagtailcore_page', N'U') IS NOT NULL DROP TABLE [wagtailcore_page];
IF OBJECT_ID(N'dbo.wagtailcore_pagelogentry', N'U') IS NOT NULL DROP TABLE [wagtailcore_pagelogentry];
IF OBJECT_ID(N'dbo.wagtailcore_pagesubscription', N'U') IS NOT NULL DROP TABLE [wagtailcore_pagesubscription];
IF OBJECT_ID(N'dbo.wagtailcore_pageviewrestriction', N'U') IS NOT NULL DROP TABLE [wagtailcore_pageviewrestriction];
IF OBJECT_ID(N'dbo.wagtailcore_pageviewrestriction_groups', N'U') IS NOT NULL DROP TABLE [wagtailcore_pageviewrestriction_groups];
IF OBJECT_ID(N'dbo.wagtailcore_referenceindex', N'U') IS NOT NULL DROP TABLE [wagtailcore_referenceindex];
IF OBJECT_ID(N'dbo.wagtailcore_revision', N'U') IS NOT NULL DROP TABLE [wagtailcore_revision];
IF OBJECT_ID(N'dbo.wagtailcore_site', N'U') IS NOT NULL DROP TABLE [wagtailcore_site];
IF OBJECT_ID(N'dbo.wagtailcore_task', N'U') IS NOT NULL DROP TABLE [wagtailcore_task];
IF OBJECT_ID(N'dbo.wagtailcore_taskstate', N'U') IS NOT NULL DROP TABLE [wagtailcore_taskstate];
IF OBJECT_ID(N'dbo.wagtailcore_uploadedfile', N'U') IS NOT NULL DROP TABLE [wagtailcore_uploadedfile];
IF OBJECT_ID(N'dbo.wagtailcore_workflow', N'U') IS NOT NULL DROP TABLE [wagtailcore_workflow];
IF OBJECT_ID(N'dbo.wagtailcore_workflowcontenttype', N'U') IS NOT NULL DROP TABLE [wagtailcore_workflowcontenttype];
IF OBJECT_ID(N'dbo.wagtailcore_workflowpage', N'U') IS NOT NULL DROP TABLE [wagtailcore_workflowpage];
IF OBJECT_ID(N'dbo.wagtailcore_workflowstate', N'U') IS NOT NULL DROP TABLE [wagtailcore_workflowstate];
IF OBJECT_ID(N'dbo.wagtailcore_workflowtask', N'U') IS NOT NULL DROP TABLE [wagtailcore_workflowtask];
IF OBJECT_ID(N'dbo.wagtaildocs_document', N'U') IS NOT NULL DROP TABLE [wagtaildocs_document];
IF OBJECT_ID(N'dbo.wagtailembeds_embed', N'U') IS NOT NULL DROP TABLE [wagtailembeds_embed];
IF OBJECT_ID(N'dbo.wagtailforms_formsubmission', N'U') IS NOT NULL DROP TABLE [wagtailforms_formsubmission];
IF OBJECT_ID(N'dbo.wagtailimages_image', N'U') IS NOT NULL DROP TABLE [wagtailimages_image];
IF OBJECT_ID(N'dbo.wagtailimages_rendition', N'U') IS NOT NULL DROP TABLE [wagtailimages_rendition];
IF OBJECT_ID(N'dbo.wagtailredirects_redirect', N'U') IS NOT NULL DROP TABLE [wagtailredirects_redirect];
IF OBJECT_ID(N'dbo.wagtailsearch_indexentry', N'U') IS NOT NULL DROP TABLE [wagtailsearch_indexentry];
IF OBJECT_ID(N'dbo.wagtailusers_userprofile', N'U') IS NOT NULL DROP TABLE [wagtailusers_userprofile];
GO

CREATE TABLE [auth_group] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [name] NVARCHAR(150) NOT NULL
    , CONSTRAINT [PK_auth_group] PRIMARY KEY ([id])
);
GO

CREATE TABLE [auth_group_permissions] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [group_id] BIGINT NOT NULL,
    [permission_id] BIGINT NOT NULL
    , CONSTRAINT [PK_auth_group_permissions] PRIMARY KEY ([id])
);
GO

CREATE TABLE [auth_permission] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [content_type_id] BIGINT NOT NULL,
    [codename] NVARCHAR(100) NOT NULL,
    [name] NVARCHAR(255) NOT NULL
    , CONSTRAINT [PK_auth_permission] PRIMARY KEY ([id])
);
GO

CREATE TABLE [auth_user] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [password] NVARCHAR(128) NOT NULL,
    [last_login] DATETIME2(6) NULL,
    [is_superuser] BIT NOT NULL,
    [username] NVARCHAR(150) NOT NULL,
    [last_name] NVARCHAR(150) NOT NULL,
    [email] NVARCHAR(254) NOT NULL,
    [is_staff] BIT NOT NULL,
    [is_active] BIT NOT NULL,
    [date_joined] DATETIME2(6) NOT NULL,
    [first_name] NVARCHAR(150) NOT NULL
    , CONSTRAINT [PK_auth_user] PRIMARY KEY ([id])
);
GO

CREATE TABLE [auth_user_groups] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [user_id] BIGINT NOT NULL,
    [group_id] BIGINT NOT NULL
    , CONSTRAINT [PK_auth_user_groups] PRIMARY KEY ([id])
);
GO

CREATE TABLE [auth_user_user_permissions] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [user_id] BIGINT NOT NULL,
    [permission_id] BIGINT NOT NULL
    , CONSTRAINT [PK_auth_user_user_permissions] PRIMARY KEY ([id])
);
GO

CREATE TABLE [django_admin_log] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [object_id] NVARCHAR(MAX) NULL,
    [object_repr] NVARCHAR(200) NOT NULL,
    [action_flag] SMALLINT NOT NULL,
    [change_message] NVARCHAR(MAX) NOT NULL,
    [content_type_id] BIGINT NULL,
    [user_id] BIGINT NOT NULL,
    [action_time] DATETIME2(6) NOT NULL
    , CONSTRAINT [PK_django_admin_log] PRIMARY KEY ([id])
);
GO

CREATE TABLE [django_content_type] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [app_label] NVARCHAR(100) NOT NULL,
    [model] NVARCHAR(100) NOT NULL
    , CONSTRAINT [PK_django_content_type] PRIMARY KEY ([id])
);
GO

CREATE TABLE [django_migrations] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [app] NVARCHAR(255) NOT NULL,
    [name] NVARCHAR(255) NOT NULL,
    [applied] DATETIME2(6) NOT NULL
    , CONSTRAINT [PK_django_migrations] PRIMARY KEY ([id])
);
GO

CREATE TABLE [django_session] (
    [session_key] NVARCHAR(40) NOT NULL,
    [session_data] NVARCHAR(MAX) NOT NULL,
    [expire_date] DATETIME2(6) NOT NULL
    , CONSTRAINT [PK_django_session] PRIMARY KEY ([session_key])
);
GO

CREATE TABLE [home_ajustessitio] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [video_max_valor] BIGINT NOT NULL,
    [video_max_unidad] NVARCHAR(2) NOT NULL,
    [techo_servidor_mb] BIGINT NOT NULL
    , CONSTRAINT [PK_home_ajustessitio] PRIMARY KEY ([id])
);
GO

CREATE TABLE [home_citystat] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [sort_order] BIGINT NULL,
    [city] NVARCHAR(40) NOT NULL,
    [routes] BIGINT NOT NULL,
    [teachers] BIGINT NOT NULL,
    [students] BIGINT NOT NULL,
    [theme] NVARCHAR(20) NOT NULL,
    [page_id] BIGINT NOT NULL
    , CONSTRAINT [PK_home_citystat] PRIMARY KEY ([id])
);
GO

CREATE TABLE [home_consulta] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [nombre] NVARCHAR(160) NOT NULL,
    [ciudad] NVARCHAR(40) NOT NULL,
    [email] NVARCHAR(254) NOT NULL,
    [institucion] NVARCHAR(180) NOT NULL,
    [mensaje] NVARCHAR(MAX) NOT NULL,
    [creada] DATETIME2(6) NOT NULL,
    [leida] BIT NOT NULL
    , CONSTRAINT [PK_home_consulta] PRIMARY KEY ([id])
);
GO

CREATE TABLE [home_contenidopage] (
    [page_ptr_id] BIGINT IDENTITY(1,1) NOT NULL,
    [intro] NVARCHAR(MAX) NOT NULL,
    [cuerpo] NVARCHAR(MAX) NOT NULL,
    [imagen_id] BIGINT NULL,
    [video_archivo_id] BIGINT NULL,
    [video_url] NVARCHAR(200) NOT NULL
    , CONSTRAINT [PK_home_contenidopage] PRIMARY KEY ([page_ptr_id])
);
GO

CREATE TABLE [home_descubrimaspage] (
    [page_ptr_id] BIGINT IDENTITY(1,1) NOT NULL,
    [intro] NVARCHAR(MAX) NOT NULL,
    [cuerpo] NVARCHAR(MAX) NOT NULL,
    [imagen_id] BIGINT NULL
    , CONSTRAINT [PK_home_descubrimaspage] PRIMARY KEY ([page_ptr_id])
);
GO

CREATE TABLE [home_explorarbloque] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [sort_order] BIGINT NULL,
    [titulo] NVARCHAR(180) NOT NULL,
    [texto] NVARCHAR(MAX) NOT NULL,
    [enlace] NVARCHAR(200) NOT NULL,
    [enlace_texto] NVARCHAR(120) NOT NULL,
    [imagen_id] BIGINT NULL,
    [page_id] BIGINT NOT NULL
    , CONSTRAINT [PK_home_explorarbloque] PRIMARY KEY ([id])
);
GO

CREATE TABLE [home_galleryitem] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [sort_order] BIGINT NULL,
    [badge] NVARCHAR(120) NOT NULL,
    [title] NVARCHAR(180) NOT NULL,
    [caption] NVARCHAR(MAX) NOT NULL,
    [theme] NVARCHAR(20) NOT NULL,
    [image_id] BIGINT NULL,
    [page_id] BIGINT NOT NULL
    , CONSTRAINT [PK_home_galleryitem] PRIMARY KEY ([id])
);
GO

CREATE TABLE [home_heroslide] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [sort_order] BIGINT NULL,
    [title] NVARCHAR(180) NOT NULL,
    [theme] NVARCHAR(20) NOT NULL,
    [image_id] BIGINT NULL,
    [page_id] BIGINT NOT NULL
    , CONSTRAINT [PK_home_heroslide] PRIMARY KEY ([id])
);
GO

CREATE TABLE [home_homepage] (
    [page_ptr_id] BIGINT IDENTITY(1,1) NOT NULL,
    [aif_url] NVARCHAR(200) NOT NULL,
    [alcance] NVARCHAR(180) NOT NULL,
    [biblioteca_etiqueta] NVARCHAR(120) NOT NULL,
    [biblioteca_texto] NVARCHAR(MAX) NOT NULL,
    [biblioteca_titulo] NVARCHAR(180) NOT NULL,
    [campus_texto] NVARCHAR(MAX) NOT NULL,
    [campus_titulo] NVARCHAR(180) NOT NULL,
    [campus_url] NVARCHAR(200) NOT NULL,
    [carrusel_titulo] NVARCHAR(180) NOT NULL,
    [contacto_texto] NVARCHAR(MAX) NOT NULL,
    [contacto_titulo] NVARCHAR(180) NOT NULL,
    [cta_texto] NVARCHAR(80) NOT NULL,
    [cta_url] NVARCHAR(200) NOT NULL,
    [email] NVARCHAR(254) NOT NULL,
    [escuelas_etiqueta] NVARCHAR(120) NOT NULL,
    [escuelas_texto] NVARCHAR(MAX) NOT NULL,
    [escuelas_titulo] NVARCHAR(180) NOT NULL,
    [eyebrow] NVARCHAR(160) NOT NULL,
    [formulario_texto] NVARCHAR(255) NOT NULL,
    [formulario_titulo] NVARCHAR(180) NOT NULL,
    [galeria_etiqueta] NVARCHAR(120) NOT NULL,
    [galeria_texto] NVARCHAR(MAX) NOT NULL,
    [galeria_titulo] NVARCHAR(180) NOT NULL,
    [headline] NVARCHAR(180) NOT NULL,
    [headline_highlight] NVARCHAR(180) NOT NULL,
    [headline_rest] NVARCHAR(255) NOT NULL,
    [impacto_aviso] NVARCHAR(180) NOT NULL,
    [impacto_etiqueta] NVARCHAR(160) NOT NULL,
    [impacto_texto] NVARCHAR(MAX) NOT NULL,
    [impacto_titulo] NVARCHAR(180) NOT NULL,
    [informe_id] BIGINT NULL,
    [instagram_titulo] NVARCHAR(180) NOT NULL,
    [instagram_url] NVARCHAR(200) NOT NULL,
    [intro] NVARCHAR(MAX) NOT NULL,
    [mapa_ciudades] NVARCHAR(180) NOT NULL,
    [mapa_titulo] NVARCHAR(120) NOT NULL,
    [pitch_cuerpo] NVARCHAR(MAX) NOT NULL,
    [pitch_texto] NVARCHAR(MAX) NOT NULL,
    [pitch_titulo] NVARCHAR(180) NOT NULL,
    [polos_url] NVARCHAR(200) NOT NULL,
    [redes_titulo] NVARCHAR(180) NOT NULL,
    [rutas_etiqueta] NVARCHAR(120) NOT NULL,
    [rutas_texto] NVARCHAR(MAX) NOT NULL,
    [rutas_titulo] NVARCHAR(180) NOT NULL,
    [sede_rio_grande] NVARCHAR(180) NOT NULL,
    [sede_ushuaia] NVARCHAR(180) NOT NULL,
    [voces_etiqueta] NVARCHAR(120) NOT NULL,
    [voces_titulo] NVARCHAR(180) NOT NULL,
    [cta_pagina_id] BIGINT NULL
    , CONSTRAINT [PK_home_homepage] PRIMARY KEY ([page_ptr_id])
);
GO

CREATE TABLE [home_metric] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [sort_order] BIGINT NULL,
    [value] BIGINT NOT NULL,
    [label] NVARCHAR(120) NOT NULL,
    [detail] NVARCHAR(220) NOT NULL,
    [theme] NVARCHAR(20) NOT NULL,
    [icon] NVARCHAR(60) NOT NULL,
    [page_id] BIGINT NOT NULL
    , CONSTRAINT [PK_home_metric] PRIMARY KEY ([id])
);
GO

CREATE TABLE [home_resource] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [sort_order] BIGINT NULL,
    [title] NVARCHAR(180) NOT NULL,
    [level] NVARCHAR(20) NOT NULL,
    [route] NVARCHAR(80) NOT NULL,
    [kind] NVARCHAR(80) NOT NULL,
    [description] NVARCHAR(MAX) NOT NULL,
    [theme] NVARCHAR(20) NOT NULL,
    [document_id] BIGINT NULL,
    [page_id] BIGINT NOT NULL
    , CONSTRAINT [PK_home_resource] PRIMARY KEY ([id])
);
GO

CREATE TABLE [home_route] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [sort_order] BIGINT NULL,
    [code] NVARCHAR(40) NOT NULL,
    [title] NVARCHAR(180) NOT NULL,
    [subtitle] NVARCHAR(220) NOT NULL,
    [summary] NVARCHAR(MAX) NOT NULL,
    [theme] NVARCHAR(20) NOT NULL,
    [icon] NVARCHAR(60) NOT NULL,
    [external_url] NVARCHAR(200) NOT NULL,
    [page_id] BIGINT NOT NULL,
    [pagina_id] BIGINT NULL
    , CONSTRAINT [PK_home_route] PRIMARY KEY ([id])
);
GO

CREATE TABLE [home_routelevel] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [sort_order] BIGINT NULL,
    [level] NVARCHAR(40) NOT NULL,
    [description] NVARCHAR(MAX) NOT NULL,
    [route_id] BIGINT NOT NULL
    , CONSTRAINT [PK_home_routelevel] PRIMARY KEY ([id])
);
GO

CREATE TABLE [home_rutabloque] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [sort_order] BIGINT NULL,
    [titulo] NVARCHAR(180) NOT NULL,
    [texto] NVARCHAR(MAX) NOT NULL,
    [enlace] NVARCHAR(200) NOT NULL,
    [enlace_texto] NVARCHAR(120) NOT NULL,
    [imagen_id] BIGINT NULL,
    [page_id] BIGINT NOT NULL
    , CONSTRAINT [PK_home_rutabloque] PRIMARY KEY ([id])
);
GO

CREATE TABLE [home_rutanivel] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [sort_order] BIGINT NULL,
    [level] NVARCHAR(40) NOT NULL,
    [description] NVARCHAR(MAX) NOT NULL,
    [page_id] BIGINT NOT NULL
    , CONSTRAINT [PK_home_rutanivel] PRIMARY KEY ([id])
);
GO

CREATE TABLE [home_rutatematicapage] (
    [page_ptr_id] BIGINT IDENTITY(1,1) NOT NULL,
    [code] NVARCHAR(40) NOT NULL,
    [subtitle] NVARCHAR(220) NOT NULL,
    [summary] NVARCHAR(MAX) NOT NULL,
    [theme] NVARCHAR(20) NOT NULL,
    [icon] NVARCHAR(60) NOT NULL,
    [cuerpo] NVARCHAR(MAX) NOT NULL,
    [enlace_externo] NVARCHAR(200) NOT NULL,
    [enlace_externo_texto] NVARCHAR(120) NOT NULL
    , CONSTRAINT [PK_home_rutatematicapage] PRIMARY KEY ([page_ptr_id])
);
GO

CREATE TABLE [home_school] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [sort_order] BIGINT NULL,
    [name] NVARCHAR(180) NOT NULL,
    [city] NVARCHAR(40) NOT NULL,
    [level] NVARCHAR(20) NOT NULL,
    [route] NVARCHAR(120) NOT NULL,
    [teachers] NVARCHAR(220) NOT NULL,
    [page_id] BIGINT NOT NULL
    , CONSTRAINT [PK_home_school] PRIMARY KEY ([id])
);
GO

CREATE TABLE [home_sociallink] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [sort_order] BIGINT NULL,
    [label] NVARCHAR(80) NOT NULL,
    [url] NVARCHAR(200) NOT NULL,
    [icon] NVARCHAR(60) NOT NULL,
    [page_id] BIGINT NOT NULL
    , CONSTRAINT [PK_home_sociallink] PRIMARY KEY ([id])
);
GO

CREATE TABLE [home_testimonial] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [sort_order] BIGINT NULL,
    [category] NVARCHAR(20) NOT NULL,
    [role] NVARCHAR(120) NOT NULL,
    [author] NVARCHAR(120) NOT NULL,
    [route] NVARCHAR(120) NOT NULL,
    [theme] NVARCHAR(20) NOT NULL,
    [quote] NVARCHAR(MAX) NOT NULL,
    [page_id] BIGINT NOT NULL
    , CONSTRAINT [PK_home_testimonial] PRIMARY KEY ([id])
);
GO

CREATE TABLE [taggit_tag] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [name] NVARCHAR(100) NOT NULL,
    [slug] NVARCHAR(100) NOT NULL
    , CONSTRAINT [PK_taggit_tag] PRIMARY KEY ([id])
);
GO

CREATE TABLE [taggit_taggeditem] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [object_id] BIGINT NOT NULL,
    [content_type_id] BIGINT NOT NULL,
    [tag_id] BIGINT NOT NULL
    , CONSTRAINT [PK_taggit_taggeditem] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailadmin_admin] (
    [id] BIGINT IDENTITY(1,1) NOT NULL
    , CONSTRAINT [PK_wagtailadmin_admin] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailadmin_editingsession] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [object_id] NVARCHAR(255) NOT NULL,
    [last_seen_at] DATETIME2(6) NOT NULL,
    [content_type_id] BIGINT NOT NULL,
    [user_id] BIGINT NOT NULL,
    [is_editing] BIT NOT NULL
    , CONSTRAINT [PK_wagtailadmin_editingsession] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailadmin_formstate] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [data] NVARCHAR(MAX) NOT NULL,
    [object_id] NVARCHAR(255) NOT NULL,
    [parent_object_id] NVARCHAR(255) NOT NULL,
    [last_updated_at] DATETIME2(6) NOT NULL,
    [content_type_id] BIGINT NOT NULL,
    [user_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailadmin_formstate] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_apitoken] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [name] NVARCHAR(255) NOT NULL,
    [key_hash] NVARCHAR(64) NOT NULL,
    [prefix] NVARCHAR(16) NOT NULL,
    [created] DATETIME2(6) NOT NULL,
    [revoked_at] DATETIME2(6) NULL,
    [last_used_at] DATETIME2(6) NULL,
    [user_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_apitoken] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_collection] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [path] NVARCHAR(255) NOT NULL,
    [depth] BIGINT NOT NULL,
    [numchild] BIGINT NOT NULL,
    [name] NVARCHAR(255) NOT NULL
    , CONSTRAINT [PK_wagtailcore_collection] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_collectionviewrestriction] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [restriction_type] NVARCHAR(20) NOT NULL,
    [password] NVARCHAR(255) NOT NULL,
    [collection_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_collectionviewrestriction] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_collectionviewrestriction_groups] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [collectionviewrestriction_id] BIGINT NOT NULL,
    [group_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_collectionviewrestriction_groups] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_comment] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [text] NVARCHAR(MAX) NOT NULL,
    [contentpath] NVARCHAR(MAX) NOT NULL,
    [position] NVARCHAR(MAX) NOT NULL,
    [created_at] DATETIME2(6) NOT NULL,
    [updated_at] DATETIME2(6) NOT NULL,
    [resolved_at] DATETIME2(6) NULL,
    [page_id] BIGINT NOT NULL,
    [resolved_by_id] BIGINT NULL,
    [revision_created_id] BIGINT NULL,
    [user_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_comment] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_commentreply] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [text] NVARCHAR(MAX) NOT NULL,
    [created_at] DATETIME2(6) NOT NULL,
    [updated_at] DATETIME2(6) NOT NULL,
    [comment_id] BIGINT NOT NULL,
    [user_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_commentreply] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_groupapprovaltask] (
    [task_ptr_id] BIGINT IDENTITY(1,1) NOT NULL
    , CONSTRAINT [PK_wagtailcore_groupapprovaltask] PRIMARY KEY ([task_ptr_id])
);
GO

CREATE TABLE [wagtailcore_groupapprovaltask_groups] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [groupapprovaltask_id] BIGINT NOT NULL,
    [group_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_groupapprovaltask_groups] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_groupcollectionpermission] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [collection_id] BIGINT NOT NULL,
    [group_id] BIGINT NOT NULL,
    [permission_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_groupcollectionpermission] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_grouppagepermission] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [group_id] BIGINT NOT NULL,
    [page_id] BIGINT NOT NULL,
    [permission_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_grouppagepermission] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_groupsitepermission] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [group_id] BIGINT NOT NULL,
    [permission_id] BIGINT NOT NULL,
    [site_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_groupsitepermission] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_locale] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [language_code] NVARCHAR(100) NOT NULL
    , CONSTRAINT [PK_wagtailcore_locale] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_modellogentry] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [label] NVARCHAR(MAX) NOT NULL,
    [action] NVARCHAR(255) NOT NULL,
    [timestamp] DATETIME2(6) NOT NULL,
    [content_changed] BIT NOT NULL,
    [deleted] BIT NOT NULL,
    [object_id] NVARCHAR(255) NOT NULL,
    [content_type_id] BIGINT NULL,
    [user_id] BIGINT NULL,
    [uuid] NVARCHAR(32) NULL,
    [revision_id] BIGINT NULL,
    [data] NVARCHAR(MAX) NOT NULL
    , CONSTRAINT [PK_wagtailcore_modellogentry] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_page] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [path] NVARCHAR(255) NOT NULL,
    [depth] BIGINT NOT NULL,
    [numchild] BIGINT NOT NULL,
    [title] NVARCHAR(255) NOT NULL,
    [slug] NVARCHAR(255) NOT NULL,
    [live] BIT NOT NULL,
    [has_unpublished_changes] BIT NOT NULL,
    [url_path] NVARCHAR(MAX) NOT NULL,
    [seo_title] NVARCHAR(255) NOT NULL,
    [show_in_menus] BIT NOT NULL,
    [search_description] NVARCHAR(MAX) NOT NULL,
    [go_live_at] DATETIME2(6) NULL,
    [expire_at] DATETIME2(6) NULL,
    [expired] BIT NOT NULL,
    [content_type_id] BIGINT NOT NULL,
    [owner_id] BIGINT NULL,
    [locked] BIT NOT NULL,
    [latest_revision_created_at] DATETIME2(6) NULL,
    [first_published_at] DATETIME2(6) NULL,
    [live_revision_id] BIGINT NULL,
    [last_published_at] DATETIME2(6) NULL,
    [draft_title] NVARCHAR(255) NOT NULL,
    [locked_at] DATETIME2(6) NULL,
    [locked_by_id] BIGINT NULL,
    [locale_id] BIGINT NOT NULL,
    [translation_key] NVARCHAR(32) NOT NULL,
    [alias_of_id] BIGINT NULL,
    [latest_revision_id] BIGINT NULL
    , CONSTRAINT [PK_wagtailcore_page] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_pagelogentry] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [label] NVARCHAR(MAX) NOT NULL,
    [action] NVARCHAR(255) NOT NULL,
    [timestamp] DATETIME2(6) NOT NULL,
    [content_changed] BIT NOT NULL,
    [deleted] BIT NOT NULL,
    [content_type_id] BIGINT NULL,
    [page_id] BIGINT NOT NULL,
    [revision_id] BIGINT NULL,
    [user_id] BIGINT NULL,
    [uuid] NVARCHAR(32) NULL,
    [data] NVARCHAR(MAX) NOT NULL
    , CONSTRAINT [PK_wagtailcore_pagelogentry] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_pagesubscription] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [comment_notifications] BIT NOT NULL,
    [page_id] BIGINT NOT NULL,
    [user_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_pagesubscription] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_pageviewrestriction] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [password] NVARCHAR(255) NOT NULL,
    [page_id] BIGINT NOT NULL,
    [restriction_type] NVARCHAR(20) NOT NULL
    , CONSTRAINT [PK_wagtailcore_pageviewrestriction] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_pageviewrestriction_groups] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [pageviewrestriction_id] BIGINT NOT NULL,
    [group_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_pageviewrestriction_groups] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_referenceindex] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [object_id] NVARCHAR(255) NOT NULL,
    [to_object_id] NVARCHAR(255) NOT NULL,
    [model_path] NVARCHAR(MAX) NOT NULL,
    [content_path] NVARCHAR(MAX) NOT NULL,
    [content_path_hash] NVARCHAR(32) NOT NULL,
    [base_content_type_id] BIGINT NOT NULL,
    [content_type_id] BIGINT NOT NULL,
    [to_content_type_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_referenceindex] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_revision] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [created_at] DATETIME2(6) NOT NULL,
    [approved_go_live_at] DATETIME2(6) NULL,
    [user_id] BIGINT NULL,
    [content] NVARCHAR(MAX) NOT NULL,
    [object_id] NVARCHAR(255) NOT NULL,
    [content_type_id] BIGINT NOT NULL,
    [base_content_type_id] BIGINT NOT NULL,
    [object_str] NVARCHAR(MAX) NOT NULL
    , CONSTRAINT [PK_wagtailcore_revision] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_site] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [hostname] NVARCHAR(255) NOT NULL,
    [port] BIGINT NOT NULL,
    [is_default_site] BIT NOT NULL,
    [root_page_id] BIGINT NOT NULL,
    [site_name] NVARCHAR(255) NOT NULL
    , CONSTRAINT [PK_wagtailcore_site] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_task] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [name] NVARCHAR(255) NOT NULL,
    [active] BIT NOT NULL,
    [content_type_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_task] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_taskstate] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [status] NVARCHAR(50) NOT NULL,
    [started_at] DATETIME2(6) NOT NULL,
    [finished_at] DATETIME2(6) NULL,
    [content_type_id] BIGINT NOT NULL,
    [task_id] BIGINT NOT NULL,
    [workflow_state_id] BIGINT NOT NULL,
    [finished_by_id] BIGINT NULL,
    [comment] NVARCHAR(MAX) NOT NULL,
    [revision_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_taskstate] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_uploadedfile] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [file] NVARCHAR(200) NOT NULL,
    [for_content_type_id] BIGINT NULL,
    [uploaded_by_user_id] BIGINT NULL
    , CONSTRAINT [PK_wagtailcore_uploadedfile] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_workflow] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [name] NVARCHAR(255) NOT NULL,
    [active] BIT NOT NULL
    , CONSTRAINT [PK_wagtailcore_workflow] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_workflowcontenttype] (
    [content_type_id] BIGINT IDENTITY(1,1) NOT NULL,
    [workflow_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_workflowcontenttype] PRIMARY KEY ([content_type_id])
);
GO

CREATE TABLE [wagtailcore_workflowpage] (
    [page_id] BIGINT IDENTITY(1,1) NOT NULL,
    [workflow_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_workflowpage] PRIMARY KEY ([page_id])
);
GO

CREATE TABLE [wagtailcore_workflowstate] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [status] NVARCHAR(50) NOT NULL,
    [created_at] DATETIME2(6) NOT NULL,
    [current_task_state_id] BIGINT NULL,
    [requested_by_id] BIGINT NULL,
    [workflow_id] BIGINT NOT NULL,
    [object_id] NVARCHAR(255) NOT NULL,
    [base_content_type_id] BIGINT NOT NULL,
    [content_type_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_workflowstate] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailcore_workflowtask] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [sort_order] BIGINT NULL,
    [task_id] BIGINT NOT NULL,
    [workflow_id] BIGINT NOT NULL
    , CONSTRAINT [PK_wagtailcore_workflowtask] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtaildocs_document] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [title] NVARCHAR(255) NOT NULL,
    [file] NVARCHAR(100) NOT NULL,
    [created_at] DATETIME2(6) NOT NULL,
    [uploaded_by_user_id] BIGINT NULL,
    [collection_id] BIGINT NOT NULL,
    [file_hash] NVARCHAR(40) NOT NULL,
    [file_size] BIGINT NULL
    , CONSTRAINT [PK_wagtaildocs_document] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailembeds_embed] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [url] NVARCHAR(MAX) NOT NULL,
    [max_width] SMALLINT NULL,
    [type] NVARCHAR(10) NOT NULL,
    [html] NVARCHAR(MAX) NOT NULL,
    [title] NVARCHAR(MAX) NOT NULL,
    [author_name] NVARCHAR(MAX) NOT NULL,
    [provider_name] NVARCHAR(MAX) NOT NULL,
    [width] BIGINT NULL,
    [height] BIGINT NULL,
    [last_updated] DATETIME2(6) NOT NULL,
    [hash] NVARCHAR(32) NOT NULL,
    [thumbnail_url] NVARCHAR(MAX) NOT NULL,
    [cache_until] DATETIME2(6) NULL
    , CONSTRAINT [PK_wagtailembeds_embed] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailforms_formsubmission] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [submit_time] DATETIME2(6) NOT NULL,
    [page_id] BIGINT NOT NULL,
    [form_data] NVARCHAR(MAX) NOT NULL
    , CONSTRAINT [PK_wagtailforms_formsubmission] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailimages_image] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [title] NVARCHAR(255) NOT NULL,
    [file] NVARCHAR(100) NOT NULL,
    [width] BIGINT NOT NULL,
    [height] BIGINT NOT NULL,
    [created_at] DATETIME2(6) NOT NULL,
    [focal_point_x] BIGINT NULL,
    [focal_point_y] BIGINT NULL,
    [focal_point_width] BIGINT NULL,
    [focal_point_height] BIGINT NULL,
    [uploaded_by_user_id] BIGINT NULL,
    [file_size] BIGINT NULL,
    [collection_id] BIGINT NOT NULL,
    [file_hash] NVARCHAR(40) NOT NULL,
    [description] NVARCHAR(255) NOT NULL
    , CONSTRAINT [PK_wagtailimages_image] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailimages_rendition] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [width] BIGINT NOT NULL,
    [height] BIGINT NOT NULL,
    [focal_point_key] NVARCHAR(16) NOT NULL,
    [filter_spec] NVARCHAR(255) NOT NULL,
    [image_id] BIGINT NOT NULL,
    [file] NVARCHAR(100) NOT NULL
    , CONSTRAINT [PK_wagtailimages_rendition] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailredirects_redirect] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [old_path] NVARCHAR(255) NOT NULL,
    [is_permanent] BIT NOT NULL,
    [redirect_link] NVARCHAR(255) NOT NULL,
    [redirect_page_id] BIGINT NULL,
    [site_id] BIGINT NULL,
    [automatically_created] BIT NOT NULL,
    [created_at] DATETIME2(6) NULL,
    [redirect_page_route_path] NVARCHAR(255) NOT NULL
    , CONSTRAINT [PK_wagtailredirects_redirect] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailsearch_indexentry] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [object_id] NVARCHAR(50) NOT NULL,
    [title_norm] FLOAT NOT NULL,
    [content_type_id] BIGINT NOT NULL,
    [autocomplete] NVARCHAR(MAX) NULL,
    [body] NVARCHAR(MAX) NULL,
    [title] NVARCHAR(MAX) NOT NULL
    , CONSTRAINT [PK_wagtailsearch_indexentry] PRIMARY KEY ([id])
);
GO

CREATE TABLE [wagtailusers_userprofile] (
    [id] BIGINT IDENTITY(1,1) NOT NULL,
    [submitted_notifications] BIT NOT NULL,
    [approved_notifications] BIT NOT NULL,
    [rejected_notifications] BIT NOT NULL,
    [user_id] BIGINT NOT NULL,
    [preferred_language] NVARCHAR(10) NOT NULL,
    [current_time_zone] NVARCHAR(40) NOT NULL,
    [avatar] NVARCHAR(100) NOT NULL,
    [updated_comments_notifications] BIT NOT NULL,
    [dismissibles] NVARCHAR(MAX) NOT NULL,
    [theme] NVARCHAR(40) NOT NULL,
    [density] NVARCHAR(40) NOT NULL,
    [contrast] NVARCHAR(40) NOT NULL,
    [keyboard_shortcuts] BIT NOT NULL
    , CONSTRAINT [PK_wagtailusers_userprofile] PRIMARY KEY ([id])
);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'auth_group_permissions_group_id_permission_id_0cd325b0_uniq' AND object_id = OBJECT_ID(N'dbo.auth_group_permissions'))
    CREATE UNIQUE INDEX [auth_group_permissions_group_id_permission_id_0cd325b0_uniq] ON [auth_group_permissions] ([group_id], [permission_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'auth_group_permissions_group_id_b120cbf9' AND object_id = OBJECT_ID(N'dbo.auth_group_permissions'))
    CREATE INDEX [auth_group_permissions_group_id_b120cbf9] ON [auth_group_permissions] ([group_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'auth_group_permissions_permission_id_84c5c92e' AND object_id = OBJECT_ID(N'dbo.auth_group_permissions'))
    CREATE INDEX [auth_group_permissions_permission_id_84c5c92e] ON [auth_group_permissions] ([permission_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'auth_user_groups_user_id_group_id_94350c0c_uniq' AND object_id = OBJECT_ID(N'dbo.auth_user_groups'))
    CREATE UNIQUE INDEX [auth_user_groups_user_id_group_id_94350c0c_uniq] ON [auth_user_groups] ([user_id], [group_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'auth_user_groups_user_id_6a12ed8b' AND object_id = OBJECT_ID(N'dbo.auth_user_groups'))
    CREATE INDEX [auth_user_groups_user_id_6a12ed8b] ON [auth_user_groups] ([user_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'auth_user_groups_group_id_97559544' AND object_id = OBJECT_ID(N'dbo.auth_user_groups'))
    CREATE INDEX [auth_user_groups_group_id_97559544] ON [auth_user_groups] ([group_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'auth_user_user_permissions_user_id_permission_id_14a6b632_uniq' AND object_id = OBJECT_ID(N'dbo.auth_user_user_permissions'))
    CREATE UNIQUE INDEX [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq] ON [auth_user_user_permissions] ([user_id], [permission_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'auth_user_user_permissions_user_id_a95ead1b' AND object_id = OBJECT_ID(N'dbo.auth_user_user_permissions'))
    CREATE INDEX [auth_user_user_permissions_user_id_a95ead1b] ON [auth_user_user_permissions] ([user_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'auth_user_user_permissions_permission_id_1fbb5f2c' AND object_id = OBJECT_ID(N'dbo.auth_user_user_permissions'))
    CREATE INDEX [auth_user_user_permissions_permission_id_1fbb5f2c] ON [auth_user_user_permissions] ([permission_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'django_admin_log_content_type_id_c4bce8eb' AND object_id = OBJECT_ID(N'dbo.django_admin_log'))
    CREATE INDEX [django_admin_log_content_type_id_c4bce8eb] ON [django_admin_log] ([content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'django_admin_log_user_id_c564eba6' AND object_id = OBJECT_ID(N'dbo.django_admin_log'))
    CREATE INDEX [django_admin_log_user_id_c564eba6] ON [django_admin_log] ([user_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'django_content_type_app_label_model_76bd3d3b_uniq' AND object_id = OBJECT_ID(N'dbo.django_content_type'))
    CREATE UNIQUE INDEX [django_content_type_app_label_model_76bd3d3b_uniq] ON [django_content_type] ([app_label], [model]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'auth_permission_content_type_id_codename_01ab375a_uniq' AND object_id = OBJECT_ID(N'dbo.auth_permission'))
    CREATE UNIQUE INDEX [auth_permission_content_type_id_codename_01ab375a_uniq] ON [auth_permission] ([content_type_id], [codename]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'auth_permission_content_type_id_2f476e4b' AND object_id = OBJECT_ID(N'dbo.auth_permission'))
    CREATE INDEX [auth_permission_content_type_id_2f476e4b] ON [auth_permission] ([content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_groupcollectionpermission_group_id_collection_id_permission_id_a21cefe9_uniq' AND object_id = OBJECT_ID(N'dbo.wagtailcore_groupcollectionpermission'))
    CREATE UNIQUE INDEX [wagtailcore_groupcollectionpermission_group_id_collection_id_permission_id_a21cefe9_uniq] ON [wagtailcore_groupcollectionpermission] ([group_id], [collection_id], [permission_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_groupcollectionpermission_collection_id_5423575a' AND object_id = OBJECT_ID(N'dbo.wagtailcore_groupcollectionpermission'))
    CREATE INDEX [wagtailcore_groupcollectionpermission_collection_id_5423575a] ON [wagtailcore_groupcollectionpermission] ([collection_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_groupcollectionpermission_group_id_05d61460' AND object_id = OBJECT_ID(N'dbo.wagtailcore_groupcollectionpermission'))
    CREATE INDEX [wagtailcore_groupcollectionpermission_group_id_05d61460] ON [wagtailcore_groupcollectionpermission] ([group_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_groupcollectionpermission_permission_id_1b626275' AND object_id = OBJECT_ID(N'dbo.wagtailcore_groupcollectionpermission'))
    CREATE INDEX [wagtailcore_groupcollectionpermission_permission_id_1b626275] ON [wagtailcore_groupcollectionpermission] ([permission_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_pageviewrestriction_groups_pageviewrestriction_id_group_id_d23f80bb_uniq' AND object_id = OBJECT_ID(N'dbo.wagtailcore_pageviewrestriction_groups'))
    CREATE UNIQUE INDEX [wagtailcore_pageviewrestriction_groups_pageviewrestriction_id_group_id_d23f80bb_uniq] ON [wagtailcore_pageviewrestriction_groups] ([pageviewrestriction_id], [group_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_pageviewrestriction_groups_pageviewrestriction_id_f147a99a' AND object_id = OBJECT_ID(N'dbo.wagtailcore_pageviewrestriction_groups'))
    CREATE INDEX [wagtailcore_pageviewrestriction_groups_pageviewrestriction_id_f147a99a] ON [wagtailcore_pageviewrestriction_groups] ([pageviewrestriction_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_pageviewrestriction_groups_group_id_6460f223' AND object_id = OBJECT_ID(N'dbo.wagtailcore_pageviewrestriction_groups'))
    CREATE INDEX [wagtailcore_pageviewrestriction_groups_group_id_6460f223] ON [wagtailcore_pageviewrestriction_groups] ([group_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_pageviewrestriction_page_id_15a8bea6' AND object_id = OBJECT_ID(N'dbo.wagtailcore_pageviewrestriction'))
    CREATE INDEX [wagtailcore_pageviewrestriction_page_id_15a8bea6] ON [wagtailcore_pageviewrestriction] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_collectionviewrestriction_collection_id_761908ec' AND object_id = OBJECT_ID(N'dbo.wagtailcore_collectionviewrestriction'))
    CREATE INDEX [wagtailcore_collectionviewrestriction_collection_id_761908ec] ON [wagtailcore_collectionviewrestriction] ([collection_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_collectionviewrestriction_groups_collectionviewrestriction_id_group_id_988995ae_uniq' AND object_id = OBJECT_ID(N'dbo.wagtailcore_collectionviewrestriction_groups'))
    CREATE UNIQUE INDEX [wagtailcore_collectionviewrestriction_groups_collectionviewrestriction_id_group_id_988995ae_uniq] ON [wagtailcore_collectionviewrestriction_groups] ([collectionviewrestriction_id], [group_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_collectionviewrestriction_groups_collectionviewrestriction_id_47320efd' AND object_id = OBJECT_ID(N'dbo.wagtailcore_collectionviewrestriction_groups'))
    CREATE INDEX [wagtailcore_collectionviewrestriction_groups_collectionviewrestriction_id_47320efd] ON [wagtailcore_collectionviewrestriction_groups] ([collectionviewrestriction_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_collectionviewrestriction_groups_group_id_1823f2a3' AND object_id = OBJECT_ID(N'dbo.wagtailcore_collectionviewrestriction_groups'))
    CREATE INDEX [wagtailcore_collectionviewrestriction_groups_group_id_1823f2a3] ON [wagtailcore_collectionviewrestriction_groups] ([group_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'django_session_expire_date_a5c62663' AND object_id = OBJECT_ID(N'dbo.django_session'))
    CREATE INDEX [django_session_expire_date_a5c62663] ON [django_session] ([expire_date]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'taggit_taggeditem_object_id_e2d7d1df' AND object_id = OBJECT_ID(N'dbo.taggit_taggeditem'))
    CREATE INDEX [taggit_taggeditem_object_id_e2d7d1df] ON [taggit_taggeditem] ([object_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'taggit_taggeditem_content_type_id_9957a03c' AND object_id = OBJECT_ID(N'dbo.taggit_taggeditem'))
    CREATE INDEX [taggit_taggeditem_content_type_id_9957a03c] ON [taggit_taggeditem] ([content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'taggit_taggeditem_tag_id_f4f5b767' AND object_id = OBJECT_ID(N'dbo.taggit_taggeditem'))
    CREATE INDEX [taggit_taggeditem_tag_id_f4f5b767] ON [taggit_taggeditem] ([tag_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'taggit_tagg_content_8fc721_idx' AND object_id = OBJECT_ID(N'dbo.taggit_taggeditem'))
    CREATE INDEX [taggit_tagg_content_8fc721_idx] ON [taggit_taggeditem] ([content_type_id], [object_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailadmin_editingsession_content_type_id_4df7730e' AND object_id = OBJECT_ID(N'dbo.wagtailadmin_editingsession'))
    CREATE INDEX [wagtailadmin_editingsession_content_type_id_4df7730e] ON [wagtailadmin_editingsession] ([content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailadmin_editingsession_user_id_6e1a9b70' AND object_id = OBJECT_ID(N'dbo.wagtailadmin_editingsession'))
    CREATE INDEX [wagtailadmin_editingsession_user_id_6e1a9b70] ON [wagtailadmin_editingsession] ([user_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailadmi_content_717955_idx' AND object_id = OBJECT_ID(N'dbo.wagtailadmin_editingsession'))
    CREATE INDEX [wagtailadmi_content_717955_idx] ON [wagtailadmin_editingsession] ([content_type_id], [object_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailadmin_formstate_content_type_id_e32438b3' AND object_id = OBJECT_ID(N'dbo.wagtailadmin_formstate'))
    CREATE INDEX [wagtailadmin_formstate_content_type_id_e32438b3] ON [wagtailadmin_formstate] ([content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailadmin_formstate_user_id_b910adc2' AND object_id = OBJECT_ID(N'dbo.wagtailadmin_formstate'))
    CREATE INDEX [wagtailadmin_formstate_user_id_b910adc2] ON [wagtailadmin_formstate] ([user_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'formstate_user_object' AND object_id = OBJECT_ID(N'dbo.wagtailadmin_formstate'))
    CREATE INDEX [formstate_user_object] ON [wagtailadmin_formstate] ([user_id], [content_type_id], [object_id], [parent_object_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_site_hostname_port_2c626d70_uniq' AND object_id = OBJECT_ID(N'dbo.wagtailcore_site'))
    CREATE UNIQUE INDEX [wagtailcore_site_hostname_port_2c626d70_uniq] ON [wagtailcore_site] ([hostname], [port]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_site_hostname_96b20b46' AND object_id = OBJECT_ID(N'dbo.wagtailcore_site'))
    CREATE INDEX [wagtailcore_site_hostname_96b20b46] ON [wagtailcore_site] ([hostname]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_site_root_page_id_e02fb95c' AND object_id = OBJECT_ID(N'dbo.wagtailcore_site'))
    CREATE INDEX [wagtailcore_site_root_page_id_e02fb95c] ON [wagtailcore_site] ([root_page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_task_content_type_id_249ab8ba' AND object_id = OBJECT_ID(N'dbo.wagtailcore_task'))
    CREATE INDEX [wagtailcore_task_content_type_id_249ab8ba] ON [wagtailcore_task] ([content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_workflowpage_workflow_id_56f56ff6' AND object_id = OBJECT_ID(N'dbo.wagtailcore_workflowpage'))
    CREATE INDEX [wagtailcore_workflowpage_workflow_id_56f56ff6] ON [wagtailcore_workflowpage] ([workflow_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_workflowtask_workflow_id_task_id_4ec7a62b_uniq' AND object_id = OBJECT_ID(N'dbo.wagtailcore_workflowtask'))
    CREATE UNIQUE INDEX [wagtailcore_workflowtask_workflow_id_task_id_4ec7a62b_uniq] ON [wagtailcore_workflowtask] ([workflow_id], [task_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_workflowtask_task_id_ce7716fe' AND object_id = OBJECT_ID(N'dbo.wagtailcore_workflowtask'))
    CREATE INDEX [wagtailcore_workflowtask_task_id_ce7716fe] ON [wagtailcore_workflowtask] ([task_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_workflowtask_workflow_id_b9717175' AND object_id = OBJECT_ID(N'dbo.wagtailcore_workflowtask'))
    CREATE INDEX [wagtailcore_workflowtask_workflow_id_b9717175] ON [wagtailcore_workflowtask] ([workflow_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_groupapprovaltask_groups_groupapprovaltask_id_group_id_bb5ee7eb_uniq' AND object_id = OBJECT_ID(N'dbo.wagtailcore_groupapprovaltask_groups'))
    CREATE UNIQUE INDEX [wagtailcore_groupapprovaltask_groups_groupapprovaltask_id_group_id_bb5ee7eb_uniq] ON [wagtailcore_groupapprovaltask_groups] ([groupapprovaltask_id], [group_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_groupapprovaltask_groups_groupapprovaltask_id_9a9255ea' AND object_id = OBJECT_ID(N'dbo.wagtailcore_groupapprovaltask_groups'))
    CREATE INDEX [wagtailcore_groupapprovaltask_groups_groupapprovaltask_id_9a9255ea] ON [wagtailcore_groupapprovaltask_groups] ([groupapprovaltask_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_groupapprovaltask_groups_group_id_2e64b61f' AND object_id = OBJECT_ID(N'dbo.wagtailcore_groupapprovaltask_groups'))
    CREATE INDEX [wagtailcore_groupapprovaltask_groups_group_id_2e64b61f] ON [wagtailcore_groupapprovaltask_groups] ([group_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_page_translation_key_locale_id_9b041bad_uniq' AND object_id = OBJECT_ID(N'dbo.wagtailcore_page'))
    CREATE UNIQUE INDEX [wagtailcore_page_translation_key_locale_id_9b041bad_uniq] ON [wagtailcore_page] ([translation_key], [locale_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_page_slug_e7c11b8f' AND object_id = OBJECT_ID(N'dbo.wagtailcore_page'))
    CREATE INDEX [wagtailcore_page_slug_e7c11b8f] ON [wagtailcore_page] ([slug]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_page_content_type_id_c28424df' AND object_id = OBJECT_ID(N'dbo.wagtailcore_page'))
    CREATE INDEX [wagtailcore_page_content_type_id_c28424df] ON [wagtailcore_page] ([content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_page_owner_id_fbf7c332' AND object_id = OBJECT_ID(N'dbo.wagtailcore_page'))
    CREATE INDEX [wagtailcore_page_owner_id_fbf7c332] ON [wagtailcore_page] ([owner_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_page_first_published_at_2b5dd637' AND object_id = OBJECT_ID(N'dbo.wagtailcore_page'))
    CREATE INDEX [wagtailcore_page_first_published_at_2b5dd637] ON [wagtailcore_page] ([first_published_at]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_page_live_revision_id_930bd822' AND object_id = OBJECT_ID(N'dbo.wagtailcore_page'))
    CREATE INDEX [wagtailcore_page_live_revision_id_930bd822] ON [wagtailcore_page] ([live_revision_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_page_locked_by_id_bcb86245' AND object_id = OBJECT_ID(N'dbo.wagtailcore_page'))
    CREATE INDEX [wagtailcore_page_locked_by_id_bcb86245] ON [wagtailcore_page] ([locked_by_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_page_locale_id_3c7e30a6' AND object_id = OBJECT_ID(N'dbo.wagtailcore_page'))
    CREATE INDEX [wagtailcore_page_locale_id_3c7e30a6] ON [wagtailcore_page] ([locale_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_page_alias_of_id_12945502' AND object_id = OBJECT_ID(N'dbo.wagtailcore_page'))
    CREATE INDEX [wagtailcore_page_alias_of_id_12945502] ON [wagtailcore_page] ([alias_of_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_commentreply_comment_id_afc7e027' AND object_id = OBJECT_ID(N'dbo.wagtailcore_commentreply'))
    CREATE INDEX [wagtailcore_commentreply_comment_id_afc7e027] ON [wagtailcore_commentreply] ([comment_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_commentreply_user_id_d0b3b9c3' AND object_id = OBJECT_ID(N'dbo.wagtailcore_commentreply'))
    CREATE INDEX [wagtailcore_commentreply_user_id_d0b3b9c3] ON [wagtailcore_commentreply] ([user_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_pagesubscription_page_id_user_id_0cef73ed_uniq' AND object_id = OBJECT_ID(N'dbo.wagtailcore_pagesubscription'))
    CREATE UNIQUE INDEX [wagtailcore_pagesubscription_page_id_user_id_0cef73ed_uniq] ON [wagtailcore_pagesubscription] ([page_id], [user_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_pagesubscription_page_id_a085e7a6' AND object_id = OBJECT_ID(N'dbo.wagtailcore_pagesubscription'))
    CREATE INDEX [wagtailcore_pagesubscription_page_id_a085e7a6] ON [wagtailcore_pagesubscription] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_pagesubscription_user_id_89d7def9' AND object_id = OBJECT_ID(N'dbo.wagtailcore_pagesubscription'))
    CREATE INDEX [wagtailcore_pagesubscription_user_id_89d7def9] ON [wagtailcore_pagesubscription] ([user_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_comment_page_id_108444b5' AND object_id = OBJECT_ID(N'dbo.wagtailcore_comment'))
    CREATE INDEX [wagtailcore_comment_page_id_108444b5] ON [wagtailcore_comment] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_comment_resolved_by_id_a282aa0e' AND object_id = OBJECT_ID(N'dbo.wagtailcore_comment'))
    CREATE INDEX [wagtailcore_comment_resolved_by_id_a282aa0e] ON [wagtailcore_comment] ([resolved_by_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_comment_revision_created_id_1d058279' AND object_id = OBJECT_ID(N'dbo.wagtailcore_comment'))
    CREATE INDEX [wagtailcore_comment_revision_created_id_1d058279] ON [wagtailcore_comment] ([revision_created_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_comment_user_id_0c577ca6' AND object_id = OBJECT_ID(N'dbo.wagtailcore_comment'))
    CREATE INDEX [wagtailcore_comment_user_id_0c577ca6] ON [wagtailcore_comment] ([user_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_page_latest_revision_id_e60fef51' AND object_id = OBJECT_ID(N'dbo.wagtailcore_page'))
    CREATE INDEX [wagtailcore_page_latest_revision_id_e60fef51] ON [wagtailcore_page] ([latest_revision_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_referenceindex_base_content_type_id_object_id_to_content_type_id_to_object_id_content_path_hash_9e6ccd6a_uni' AND object_id = OBJECT_ID(N'dbo.wagtailcore_referenceindex'))
    CREATE UNIQUE INDEX [wagtailcore_referenceindex_base_content_type_id_object_id_to_content_type_id_to_object_id_content_path_hash_9e6ccd6a_uni] ON [wagtailcore_referenceindex] ([base_content_type_id], [object_id], [to_content_type_id], [to_object_id], [content_path_hash]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_referenceindex_base_content_type_id_313cf40f' AND object_id = OBJECT_ID(N'dbo.wagtailcore_referenceindex'))
    CREATE INDEX [wagtailcore_referenceindex_base_content_type_id_313cf40f] ON [wagtailcore_referenceindex] ([base_content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_referenceindex_content_type_id_766e0336' AND object_id = OBJECT_ID(N'dbo.wagtailcore_referenceindex'))
    CREATE INDEX [wagtailcore_referenceindex_content_type_id_766e0336] ON [wagtailcore_referenceindex] ([content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_referenceindex_to_content_type_id_93690bbd' AND object_id = OBJECT_ID(N'dbo.wagtailcore_referenceindex'))
    CREATE INDEX [wagtailcore_referenceindex_to_content_type_id_93690bbd] ON [wagtailcore_referenceindex] ([to_content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_taskstate_content_type_id_0a758fdc' AND object_id = OBJECT_ID(N'dbo.wagtailcore_taskstate'))
    CREATE INDEX [wagtailcore_taskstate_content_type_id_0a758fdc] ON [wagtailcore_taskstate] ([content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_taskstate_task_id_c3677c34' AND object_id = OBJECT_ID(N'dbo.wagtailcore_taskstate'))
    CREATE INDEX [wagtailcore_taskstate_task_id_c3677c34] ON [wagtailcore_taskstate] ([task_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_taskstate_workflow_state_id_9239a775' AND object_id = OBJECT_ID(N'dbo.wagtailcore_taskstate'))
    CREATE INDEX [wagtailcore_taskstate_workflow_state_id_9239a775] ON [wagtailcore_taskstate] ([workflow_state_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_taskstate_finished_by_id_13f98229' AND object_id = OBJECT_ID(N'dbo.wagtailcore_taskstate'))
    CREATE INDEX [wagtailcore_taskstate_finished_by_id_13f98229] ON [wagtailcore_taskstate] ([finished_by_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_taskstate_revision_id_df25a499' AND object_id = OBJECT_ID(N'dbo.wagtailcore_taskstate'))
    CREATE INDEX [wagtailcore_taskstate_revision_id_df25a499] ON [wagtailcore_taskstate] ([revision_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'unique_in_progress_workflow' AND object_id = OBJECT_ID(N'dbo.wagtailcore_workflowstate'))
    CREATE UNIQUE INDEX [unique_in_progress_workflow] ON [wagtailcore_workflowstate] ([base_content_type_id], [object_id]) WHERE [status] IN (N'in_progress', N'needs_changes');
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_workflowstate_requested_by_id_4090bca3' AND object_id = OBJECT_ID(N'dbo.wagtailcore_workflowstate'))
    CREATE INDEX [wagtailcore_workflowstate_requested_by_id_4090bca3] ON [wagtailcore_workflowstate] ([requested_by_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_workflowstate_workflow_id_1f18378f' AND object_id = OBJECT_ID(N'dbo.wagtailcore_workflowstate'))
    CREATE INDEX [wagtailcore_workflowstate_workflow_id_1f18378f] ON [wagtailcore_workflowstate] ([workflow_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_workflowstate_base_content_type_id_a30dc576' AND object_id = OBJECT_ID(N'dbo.wagtailcore_workflowstate'))
    CREATE INDEX [wagtailcore_workflowstate_base_content_type_id_a30dc576] ON [wagtailcore_workflowstate] ([base_content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_workflowstate_content_type_id_2bb78ce1' AND object_id = OBJECT_ID(N'dbo.wagtailcore_workflowstate'))
    CREATE INDEX [wagtailcore_workflowstate_content_type_id_2bb78ce1] ON [wagtailcore_workflowstate] ([content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'workflowstate_ct_id_idx' AND object_id = OBJECT_ID(N'dbo.wagtailcore_workflowstate'))
    CREATE INDEX [workflowstate_ct_id_idx] ON [wagtailcore_workflowstate] ([content_type_id], [object_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'workflowstate_base_ct_id_idx' AND object_id = OBJECT_ID(N'dbo.wagtailcore_workflowstate'))
    CREATE INDEX [workflowstate_base_ct_id_idx] ON [wagtailcore_workflowstate] ([base_content_type_id], [object_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_workflowcontenttype_workflow_id_9aad7cd2' AND object_id = OBJECT_ID(N'dbo.wagtailcore_workflowcontenttype'))
    CREATE INDEX [wagtailcore_workflowcontenttype_workflow_id_9aad7cd2] ON [wagtailcore_workflowcontenttype] ([workflow_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_modellogentry_action_d2d856ee' AND object_id = OBJECT_ID(N'dbo.wagtailcore_modellogentry'))
    CREATE INDEX [wagtailcore_modellogentry_action_d2d856ee] ON [wagtailcore_modellogentry] ([action]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_modellogentry_timestamp_9694521b' AND object_id = OBJECT_ID(N'dbo.wagtailcore_modellogentry'))
    CREATE INDEX [wagtailcore_modellogentry_timestamp_9694521b] ON [wagtailcore_modellogentry] ([timestamp]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_modellogentry_content_changed_8bc39742' AND object_id = OBJECT_ID(N'dbo.wagtailcore_modellogentry'))
    CREATE INDEX [wagtailcore_modellogentry_content_changed_8bc39742] ON [wagtailcore_modellogentry] ([content_changed]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_modellogentry_object_id_e0e7d4ef' AND object_id = OBJECT_ID(N'dbo.wagtailcore_modellogentry'))
    CREATE INDEX [wagtailcore_modellogentry_object_id_e0e7d4ef] ON [wagtailcore_modellogentry] ([object_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_modellogentry_content_type_id_68849e77' AND object_id = OBJECT_ID(N'dbo.wagtailcore_modellogentry'))
    CREATE INDEX [wagtailcore_modellogentry_content_type_id_68849e77] ON [wagtailcore_modellogentry] ([content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_modellogentry_user_id_0278d1bf' AND object_id = OBJECT_ID(N'dbo.wagtailcore_modellogentry'))
    CREATE INDEX [wagtailcore_modellogentry_user_id_0278d1bf] ON [wagtailcore_modellogentry] ([user_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_modellogentry_revision_id_df6ca33a' AND object_id = OBJECT_ID(N'dbo.wagtailcore_modellogentry'))
    CREATE INDEX [wagtailcore_modellogentry_revision_id_df6ca33a] ON [wagtailcore_modellogentry] ([revision_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_pagelogentry_action_c2408198' AND object_id = OBJECT_ID(N'dbo.wagtailcore_pagelogentry'))
    CREATE INDEX [wagtailcore_pagelogentry_action_c2408198] ON [wagtailcore_pagelogentry] ([action]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_pagelogentry_timestamp_deb774c4' AND object_id = OBJECT_ID(N'dbo.wagtailcore_pagelogentry'))
    CREATE INDEX [wagtailcore_pagelogentry_timestamp_deb774c4] ON [wagtailcore_pagelogentry] ([timestamp]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_pagelogentry_content_changed_99f27ade' AND object_id = OBJECT_ID(N'dbo.wagtailcore_pagelogentry'))
    CREATE INDEX [wagtailcore_pagelogentry_content_changed_99f27ade] ON [wagtailcore_pagelogentry] ([content_changed]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_pagelogentry_content_type_id_74e7708a' AND object_id = OBJECT_ID(N'dbo.wagtailcore_pagelogentry'))
    CREATE INDEX [wagtailcore_pagelogentry_content_type_id_74e7708a] ON [wagtailcore_pagelogentry] ([content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_pagelogentry_page_id_8464e327' AND object_id = OBJECT_ID(N'dbo.wagtailcore_pagelogentry'))
    CREATE INDEX [wagtailcore_pagelogentry_page_id_8464e327] ON [wagtailcore_pagelogentry] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_pagelogentry_revision_id_8043d103' AND object_id = OBJECT_ID(N'dbo.wagtailcore_pagelogentry'))
    CREATE INDEX [wagtailcore_pagelogentry_revision_id_8043d103] ON [wagtailcore_pagelogentry] ([revision_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_pagelogentry_user_id_604ccfd8' AND object_id = OBJECT_ID(N'dbo.wagtailcore_pagelogentry'))
    CREATE INDEX [wagtailcore_pagelogentry_user_id_604ccfd8] ON [wagtailcore_pagelogentry] ([user_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_grouppagepermission_group_id_fc07e671' AND object_id = OBJECT_ID(N'dbo.wagtailcore_grouppagepermission'))
    CREATE INDEX [wagtailcore_grouppagepermission_group_id_fc07e671] ON [wagtailcore_grouppagepermission] ([group_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_grouppagepermission_page_id_710b114a' AND object_id = OBJECT_ID(N'dbo.wagtailcore_grouppagepermission'))
    CREATE INDEX [wagtailcore_grouppagepermission_page_id_710b114a] ON [wagtailcore_grouppagepermission] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_grouppagepermission_permission_id_05acb22e' AND object_id = OBJECT_ID(N'dbo.wagtailcore_grouppagepermission'))
    CREATE INDEX [wagtailcore_grouppagepermission_permission_id_05acb22e] ON [wagtailcore_grouppagepermission] ([permission_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_revision_created_at_81450aa6' AND object_id = OBJECT_ID(N'dbo.wagtailcore_revision'))
    CREATE INDEX [wagtailcore_revision_created_at_81450aa6] ON [wagtailcore_revision] ([created_at]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_revision_approved_go_live_at_88d3dee5' AND object_id = OBJECT_ID(N'dbo.wagtailcore_revision'))
    CREATE INDEX [wagtailcore_revision_approved_go_live_at_88d3dee5] ON [wagtailcore_revision] ([approved_go_live_at]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_revision_user_id_03df83b0' AND object_id = OBJECT_ID(N'dbo.wagtailcore_revision'))
    CREATE INDEX [wagtailcore_revision_user_id_03df83b0] ON [wagtailcore_revision] ([user_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_revision_content_type_id_c8cb69c0' AND object_id = OBJECT_ID(N'dbo.wagtailcore_revision'))
    CREATE INDEX [wagtailcore_revision_content_type_id_c8cb69c0] ON [wagtailcore_revision] ([content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_revision_base_content_type_id_5b4ef7bd' AND object_id = OBJECT_ID(N'dbo.wagtailcore_revision'))
    CREATE INDEX [wagtailcore_revision_base_content_type_id_5b4ef7bd] ON [wagtailcore_revision] ([base_content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'content_object_idx' AND object_id = OBJECT_ID(N'dbo.wagtailcore_revision'))
    CREATE INDEX [content_object_idx] ON [wagtailcore_revision] ([content_type_id], [object_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'base_content_object_idx' AND object_id = OBJECT_ID(N'dbo.wagtailcore_revision'))
    CREATE INDEX [base_content_object_idx] ON [wagtailcore_revision] ([base_content_type_id], [object_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_uploadedfile_for_content_type_id_b0fc87b2' AND object_id = OBJECT_ID(N'dbo.wagtailcore_uploadedfile'))
    CREATE INDEX [wagtailcore_uploadedfile_for_content_type_id_b0fc87b2] ON [wagtailcore_uploadedfile] ([for_content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_uploadedfile_uploaded_by_user_id_c7580fe8' AND object_id = OBJECT_ID(N'dbo.wagtailcore_uploadedfile'))
    CREATE INDEX [wagtailcore_uploadedfile_uploaded_by_user_id_c7580fe8] ON [wagtailcore_uploadedfile] ([uploaded_by_user_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_groupsitepermission_group_id_site_id_permission_id_a58ee30d_uniq' AND object_id = OBJECT_ID(N'dbo.wagtailcore_groupsitepermission'))
    CREATE UNIQUE INDEX [wagtailcore_groupsitepermission_group_id_site_id_permission_id_a58ee30d_uniq] ON [wagtailcore_groupsitepermission] ([group_id], [site_id], [permission_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_groupsitepermission_group_id_e5cdbee4' AND object_id = OBJECT_ID(N'dbo.wagtailcore_groupsitepermission'))
    CREATE INDEX [wagtailcore_groupsitepermission_group_id_e5cdbee4] ON [wagtailcore_groupsitepermission] ([group_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_groupsitepermission_permission_id_459b1f38' AND object_id = OBJECT_ID(N'dbo.wagtailcore_groupsitepermission'))
    CREATE INDEX [wagtailcore_groupsitepermission_permission_id_459b1f38] ON [wagtailcore_groupsitepermission] ([permission_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_groupsitepermission_site_id_245de488' AND object_id = OBJECT_ID(N'dbo.wagtailcore_groupsitepermission'))
    CREATE INDEX [wagtailcore_groupsitepermission_site_id_245de488] ON [wagtailcore_groupsitepermission] ([site_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'referenceindex_source_object' AND object_id = OBJECT_ID(N'dbo.wagtailcore_referenceindex'))
    CREATE INDEX [referenceindex_source_object] ON [wagtailcore_referenceindex] ([base_content_type_id], [object_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'referenceindex_target_object' AND object_id = OBJECT_ID(N'dbo.wagtailcore_referenceindex'))
    CREATE INDEX [referenceindex_target_object] ON [wagtailcore_referenceindex] ([to_content_type_id], [to_object_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_uuid_d6363b_idx' AND object_id = OBJECT_ID(N'dbo.wagtailcore_modellogentry'))
    CREATE INDEX [wagtailcore_uuid_d6363b_idx] ON [wagtailcore_modellogentry] ([uuid], [action], [timestamp"]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_uuid_06a44d_idx' AND object_id = OBJECT_ID(N'dbo.wagtailcore_pagelogentry'))
    CREATE INDEX [wagtailcore_uuid_06a44d_idx] ON [wagtailcore_pagelogentry] ([uuid], [action], [timestamp"]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailcore_apitoken_user_id_49b1141b' AND object_id = OBJECT_ID(N'dbo.wagtailcore_apitoken'))
    CREATE INDEX [wagtailcore_apitoken_user_id_49b1141b] ON [wagtailcore_apitoken] ([user_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtaildocs_document_uploaded_by_user_id_17258b41' AND object_id = OBJECT_ID(N'dbo.wagtaildocs_document'))
    CREATE INDEX [wagtaildocs_document_uploaded_by_user_id_17258b41] ON [wagtaildocs_document] ([uploaded_by_user_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtaildocs_document_collection_id_23881625' AND object_id = OBJECT_ID(N'dbo.wagtaildocs_document'))
    CREATE INDEX [wagtaildocs_document_collection_id_23881625] ON [wagtaildocs_document] ([collection_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailembeds_embed_cache_until_26c94bb0' AND object_id = OBJECT_ID(N'dbo.wagtailembeds_embed'))
    CREATE INDEX [wagtailembeds_embed_cache_until_26c94bb0] ON [wagtailembeds_embed] ([cache_until]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailforms_formsubmission_page_id_e48e93e7' AND object_id = OBJECT_ID(N'dbo.wagtailforms_formsubmission'))
    CREATE INDEX [wagtailforms_formsubmission_page_id_e48e93e7] ON [wagtailforms_formsubmission] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailimages_rendition_image_id_filter_spec_focal_point_key_323c8fe0_uniq' AND object_id = OBJECT_ID(N'dbo.wagtailimages_rendition'))
    CREATE UNIQUE INDEX [wagtailimages_rendition_image_id_filter_spec_focal_point_key_323c8fe0_uniq] ON [wagtailimages_rendition] ([image_id], [filter_spec], [focal_point_key]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailimages_rendition_filter_spec_1cba3201' AND object_id = OBJECT_ID(N'dbo.wagtailimages_rendition'))
    CREATE INDEX [wagtailimages_rendition_filter_spec_1cba3201] ON [wagtailimages_rendition] ([filter_spec]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailimages_rendition_image_id_3e1fd774' AND object_id = OBJECT_ID(N'dbo.wagtailimages_rendition'))
    CREATE INDEX [wagtailimages_rendition_image_id_3e1fd774] ON [wagtailimages_rendition] ([image_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailimages_image_created_at_86fa6cd4' AND object_id = OBJECT_ID(N'dbo.wagtailimages_image'))
    CREATE INDEX [wagtailimages_image_created_at_86fa6cd4] ON [wagtailimages_image] ([created_at]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailimages_image_uploaded_by_user_id_5d73dc75' AND object_id = OBJECT_ID(N'dbo.wagtailimages_image'))
    CREATE INDEX [wagtailimages_image_uploaded_by_user_id_5d73dc75] ON [wagtailimages_image] ([uploaded_by_user_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailimages_image_collection_id_c2f8af7e' AND object_id = OBJECT_ID(N'dbo.wagtailimages_image'))
    CREATE INDEX [wagtailimages_image_collection_id_c2f8af7e] ON [wagtailimages_image] ([collection_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailimages_image_file_hash_fb5bbb23' AND object_id = OBJECT_ID(N'dbo.wagtailimages_image'))
    CREATE INDEX [wagtailimages_image_file_hash_fb5bbb23] ON [wagtailimages_image] ([file_hash]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailredirects_redirect_old_path_site_id_783622d7_uniq' AND object_id = OBJECT_ID(N'dbo.wagtailredirects_redirect'))
    CREATE UNIQUE INDEX [wagtailredirects_redirect_old_path_site_id_783622d7_uniq] ON [wagtailredirects_redirect] ([old_path], [site_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailredirects_redirect_old_path_bb35247b' AND object_id = OBJECT_ID(N'dbo.wagtailredirects_redirect'))
    CREATE INDEX [wagtailredirects_redirect_old_path_bb35247b] ON [wagtailredirects_redirect] ([old_path]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailredirects_redirect_redirect_page_id_b5728a8f' AND object_id = OBJECT_ID(N'dbo.wagtailredirects_redirect'))
    CREATE INDEX [wagtailredirects_redirect_redirect_page_id_b5728a8f] ON [wagtailredirects_redirect] ([redirect_page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailredirects_redirect_site_id_780a0e1e' AND object_id = OBJECT_ID(N'dbo.wagtailredirects_redirect'))
    CREATE INDEX [wagtailredirects_redirect_site_id_780a0e1e] ON [wagtailredirects_redirect] ([site_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailsearch_indexentry_content_type_id_object_id_bcd7ba73_uniq' AND object_id = OBJECT_ID(N'dbo.wagtailsearch_indexentry'))
    CREATE UNIQUE INDEX [wagtailsearch_indexentry_content_type_id_object_id_bcd7ba73_uniq] ON [wagtailsearch_indexentry] ([content_type_id], [object_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'wagtailsearch_indexentry_content_type_id_62ed694f' AND object_id = OBJECT_ID(N'dbo.wagtailsearch_indexentry'))
    CREATE INDEX [wagtailsearch_indexentry_content_type_id_62ed694f] ON [wagtailsearch_indexentry] ([content_type_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_homepage_informe_id_85ceca6a' AND object_id = OBJECT_ID(N'dbo.home_homepage'))
    CREATE INDEX [home_homepage_informe_id_85ceca6a] ON [home_homepage] ([informe_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_citystat_page_id_d8ae5994' AND object_id = OBJECT_ID(N'dbo.home_citystat'))
    CREATE INDEX [home_citystat_page_id_d8ae5994] ON [home_citystat] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_galleryitem_image_id_4d04971e' AND object_id = OBJECT_ID(N'dbo.home_galleryitem'))
    CREATE INDEX [home_galleryitem_image_id_4d04971e] ON [home_galleryitem] ([image_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_galleryitem_page_id_accca13e' AND object_id = OBJECT_ID(N'dbo.home_galleryitem'))
    CREATE INDEX [home_galleryitem_page_id_accca13e] ON [home_galleryitem] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_heroslide_image_id_c475b2ee' AND object_id = OBJECT_ID(N'dbo.home_heroslide'))
    CREATE INDEX [home_heroslide_image_id_c475b2ee] ON [home_heroslide] ([image_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_heroslide_page_id_c687e699' AND object_id = OBJECT_ID(N'dbo.home_heroslide'))
    CREATE INDEX [home_heroslide_page_id_c687e699] ON [home_heroslide] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_metric_page_id_9d3f2bc0' AND object_id = OBJECT_ID(N'dbo.home_metric'))
    CREATE INDEX [home_metric_page_id_9d3f2bc0] ON [home_metric] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_resource_document_id_4b146350' AND object_id = OBJECT_ID(N'dbo.home_resource'))
    CREATE INDEX [home_resource_document_id_4b146350] ON [home_resource] ([document_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_resource_page_id_98851bcb' AND object_id = OBJECT_ID(N'dbo.home_resource'))
    CREATE INDEX [home_resource_page_id_98851bcb] ON [home_resource] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_route_page_id_0e5ef15d' AND object_id = OBJECT_ID(N'dbo.home_route'))
    CREATE INDEX [home_route_page_id_0e5ef15d] ON [home_route] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_routelevel_route_id_80ae58b1' AND object_id = OBJECT_ID(N'dbo.home_routelevel'))
    CREATE INDEX [home_routelevel_route_id_80ae58b1] ON [home_routelevel] ([route_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_school_page_id_6a89becc' AND object_id = OBJECT_ID(N'dbo.home_school'))
    CREATE INDEX [home_school_page_id_6a89becc] ON [home_school] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_sociallink_page_id_cda0ca8e' AND object_id = OBJECT_ID(N'dbo.home_sociallink'))
    CREATE INDEX [home_sociallink_page_id_cda0ca8e] ON [home_sociallink] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_testimonial_page_id_6161143c' AND object_id = OBJECT_ID(N'dbo.home_testimonial'))
    CREATE INDEX [home_testimonial_page_id_6161143c] ON [home_testimonial] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_homepage_cta_pagina_id_5cc26349' AND object_id = OBJECT_ID(N'dbo.home_homepage'))
    CREATE INDEX [home_homepage_cta_pagina_id_5cc26349] ON [home_homepage] ([cta_pagina_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_route_pagina_id_47121b03' AND object_id = OBJECT_ID(N'dbo.home_route'))
    CREATE INDEX [home_route_pagina_id_47121b03] ON [home_route] ([pagina_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_descubrimaspage_imagen_id_435d8ac6' AND object_id = OBJECT_ID(N'dbo.home_descubrimaspage'))
    CREATE INDEX [home_descubrimaspage_imagen_id_435d8ac6] ON [home_descubrimaspage] ([imagen_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_explorarbloque_imagen_id_8f1a5c9a' AND object_id = OBJECT_ID(N'dbo.home_explorarbloque'))
    CREATE INDEX [home_explorarbloque_imagen_id_8f1a5c9a] ON [home_explorarbloque] ([imagen_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_explorarbloque_page_id_f5b08b9a' AND object_id = OBJECT_ID(N'dbo.home_explorarbloque'))
    CREATE INDEX [home_explorarbloque_page_id_f5b08b9a] ON [home_explorarbloque] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_rutanivel_page_id_f7c5e2bc' AND object_id = OBJECT_ID(N'dbo.home_rutanivel'))
    CREATE INDEX [home_rutanivel_page_id_f7c5e2bc] ON [home_rutanivel] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_rutabloque_imagen_id_12fe5c0b' AND object_id = OBJECT_ID(N'dbo.home_rutabloque'))
    CREATE INDEX [home_rutabloque_imagen_id_12fe5c0b] ON [home_rutabloque] ([imagen_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_rutabloque_page_id_9e397ab9' AND object_id = OBJECT_ID(N'dbo.home_rutabloque'))
    CREATE INDEX [home_rutabloque_page_id_9e397ab9] ON [home_rutabloque] ([page_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_contenidopage_imagen_id_d3d378e4' AND object_id = OBJECT_ID(N'dbo.home_contenidopage'))
    CREATE INDEX [home_contenidopage_imagen_id_d3d378e4] ON [home_contenidopage] ([imagen_id]);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'home_contenidopage_video_archivo_id_2ddb6163' AND object_id = OBJECT_ID(N'dbo.home_contenidopage'))
    CREATE INDEX [home_contenidopage_video_archivo_id_2ddb6163] ON [home_contenidopage] ([video_archivo_id]);
GO

-- auth_group: 5 filas
SET IDENTITY_INSERT [auth_group] ON;
INSERT INTO [auth_group] ([id], [name]) VALUES (1, N'Moderators');
INSERT INTO [auth_group] ([id], [name]) VALUES (2, N'Editors');
INSERT INTO [auth_group] ([id], [name]) VALUES (3, N'Administradores');
INSERT INTO [auth_group] ([id], [name]) VALUES (4, N'Editores');
INSERT INTO [auth_group] ([id], [name]) VALUES (5, N'Autores');
SET IDENTITY_INSERT [auth_group] OFF;
DECLARE @max_auth_group BIGINT; SELECT @max_auth_group = ISNULL(MAX([id]), 0) FROM [auth_group];
IF @max_auth_group > 0 DBCC CHECKIDENT (N'dbo.auth_group', RESEED, @max_auth_group);
GO

-- auth_group_permissions: 18 filas
SET IDENTITY_INSERT [auth_group_permissions] ON;
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (1, 2, 1);
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (2, 1, 1);
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (3, 2, 112);
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (4, 2, 110);
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (5, 2, 111);
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (6, 1, 112);
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (7, 1, 110);
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (8, 1, 111);
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (9, 2, 113);
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (10, 1, 113);
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (11, 2, 114);
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (12, 2, 115);
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (13, 2, 116);
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (14, 1, 114);
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (15, 1, 115);
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (16, 1, 116);
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (17, 2, 117);
INSERT INTO [auth_group_permissions] ([id], [group_id], [permission_id]) VALUES (18, 1, 117);
SET IDENTITY_INSERT [auth_group_permissions] OFF;
DECLARE @max_auth_group_permissions BIGINT; SELECT @max_auth_group_permissions = ISNULL(MAX([id]), 0) FROM [auth_group_permissions];
IF @max_auth_group_permissions > 0 DBCC CHECKIDENT (N'dbo.auth_group_permissions', RESEED, @max_auth_group_permissions);
GO

-- auth_permission: 263 filas
SET IDENTITY_INSERT [auth_permission] ON;
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (1, 3, N'access_admin', N'Can access Wagtail admin');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (2, 5, N'add_locale', N'Can add locale');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (3, 5, N'change_locale', N'Can change locale');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (4, 5, N'delete_locale', N'Can delete locale');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (5, 5, N'view_locale', N'Can view locale');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (6, 6, N'add_site', N'Can add site');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (7, 6, N'change_site', N'Can change site');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (8, 6, N'delete_site', N'Can delete site');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (9, 6, N'view_site', N'Can view site');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (10, 7, N'add_groupsitepermission', N'Can add group site permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (11, 7, N'change_groupsitepermission', N'Can change group site permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (12, 7, N'delete_groupsitepermission', N'Can delete group site permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (13, 7, N'view_groupsitepermission', N'Can view group site permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (14, 8, N'add_apitoken', N'Can add API token');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (15, 8, N'change_apitoken', N'Can change API token');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (16, 8, N'delete_apitoken', N'Can delete API token');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (17, 8, N'view_apitoken', N'Can view API token');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (18, 9, N'add_modellogentry', N'Can add model log entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (19, 9, N'change_modellogentry', N'Can change model log entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (20, 9, N'delete_modellogentry', N'Can delete model log entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (21, 9, N'view_modellogentry', N'Can view model log entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (22, 10, N'add_revision', N'Can add revision');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (23, 10, N'change_revision', N'Can change revision');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (24, 10, N'delete_revision', N'Can delete revision');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (25, 10, N'view_revision', N'Can view revision');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (26, 11, N'add_collectionviewrestriction', N'Can add collection view restriction');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (27, 11, N'change_collectionviewrestriction', N'Can change collection view restriction');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (28, 11, N'delete_collectionviewrestriction', N'Can delete collection view restriction');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (29, 11, N'view_collectionviewrestriction', N'Can view collection view restriction');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (30, 12, N'add_collection', N'Can add collection');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (31, 12, N'change_collection', N'Can change collection');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (32, 12, N'delete_collection', N'Can delete collection');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (33, 12, N'view_collection', N'Can view collection');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (34, 13, N'add_groupcollectionpermission', N'Can add group collection permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (35, 13, N'change_groupcollectionpermission', N'Can change group collection permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (36, 13, N'delete_groupcollectionpermission', N'Can delete group collection permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (37, 13, N'view_groupcollectionpermission', N'Can view group collection permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (38, 14, N'add_uploadedfile', N'Can add uploaded file');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (39, 14, N'change_uploadedfile', N'Can change uploaded file');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (40, 14, N'delete_uploadedfile', N'Can delete uploaded file');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (41, 14, N'view_uploadedfile', N'Can view uploaded file');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (42, 15, N'add_workflowcontenttype', N'Can add workflow content type');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (43, 15, N'change_workflowcontenttype', N'Can change workflow content type');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (44, 15, N'delete_workflowcontenttype', N'Can delete workflow content type');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (45, 15, N'view_workflowcontenttype', N'Can view workflow content type');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (46, 16, N'add_workflowstate', N'Can add Workflow state');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (47, 16, N'change_workflowstate', N'Can change Workflow state');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (48, 16, N'delete_workflowstate', N'Can delete Workflow state');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (49, 16, N'view_workflowstate', N'Can view Workflow state');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (50, 17, N'add_workflow', N'Can add workflow');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (51, 17, N'change_workflow', N'Can change workflow');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (52, 17, N'delete_workflow', N'Can delete workflow');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (53, 17, N'view_workflow', N'Can view workflow');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (54, 18, N'add_workflowtask', N'Can add workflow task order');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (55, 18, N'change_workflowtask', N'Can change workflow task order');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (56, 18, N'delete_workflowtask', N'Can delete workflow task order');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (57, 18, N'view_workflowtask', N'Can view workflow task order');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (58, 19, N'add_task', N'Can add task');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (59, 19, N'change_task', N'Can change task');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (60, 19, N'delete_task', N'Can delete task');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (61, 19, N'view_task', N'Can view task');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (62, 4, N'add_groupapprovaltask', N'Can add Group approval task');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (63, 4, N'change_groupapprovaltask', N'Can change Group approval task');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (64, 4, N'delete_groupapprovaltask', N'Can delete Group approval task');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (65, 4, N'view_groupapprovaltask', N'Can view Group approval task');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (66, 20, N'add_taskstate', N'Can add Task state');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (67, 20, N'change_taskstate', N'Can change Task state');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (68, 20, N'delete_taskstate', N'Can delete Task state');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (69, 20, N'view_taskstate', N'Can view Task state');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (70, 1, N'add_page', N'Can add page');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (71, 1, N'change_page', N'Can change page');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (72, 1, N'delete_page', N'Can delete page');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (73, 1, N'view_page', N'Can view page');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (74, 1, N'bulk_delete_page', N'Delete pages with children');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (75, 1, N'lock_page', N'Lock/unlock pages you''ve locked');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (76, 1, N'publish_page', N'Publish any page');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (77, 1, N'unlock_page', N'Unlock any page');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (78, 21, N'add_grouppagepermission', N'Can add group page permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (79, 21, N'change_grouppagepermission', N'Can change group page permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (80, 21, N'delete_grouppagepermission', N'Can delete group page permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (81, 21, N'view_grouppagepermission', N'Can view group page permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (82, 22, N'add_pageviewrestriction', N'Can add page view restriction');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (83, 22, N'change_pageviewrestriction', N'Can change page view restriction');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (84, 22, N'delete_pageviewrestriction', N'Can delete page view restriction');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (85, 22, N'view_pageviewrestriction', N'Can view page view restriction');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (86, 23, N'add_workflowpage', N'Can add workflow page');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (87, 23, N'change_workflowpage', N'Can change workflow page');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (88, 23, N'delete_workflowpage', N'Can delete workflow page');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (89, 23, N'view_workflowpage', N'Can view workflow page');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (90, 24, N'add_pagelogentry', N'Can add page log entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (91, 24, N'change_pagelogentry', N'Can change page log entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (92, 24, N'delete_pagelogentry', N'Can delete page log entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (93, 24, N'view_pagelogentry', N'Can view page log entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (94, 25, N'add_comment', N'Can add comment');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (95, 25, N'change_comment', N'Can change comment');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (96, 25, N'delete_comment', N'Can delete comment');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (97, 25, N'view_comment', N'Can view comment');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (98, 26, N'add_commentreply', N'Can add comment reply');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (99, 26, N'change_commentreply', N'Can change comment reply');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (100, 26, N'delete_commentreply', N'Can delete comment reply');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (101, 26, N'view_commentreply', N'Can view comment reply');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (102, 27, N'add_pagesubscription', N'Can add page subscription');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (103, 27, N'change_pagesubscription', N'Can change page subscription');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (104, 27, N'delete_pagesubscription', N'Can delete page subscription');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (105, 27, N'view_pagesubscription', N'Can view page subscription');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (106, 28, N'add_referenceindex', N'Can add reference index');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (107, 28, N'change_referenceindex', N'Can change reference index');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (108, 28, N'delete_referenceindex', N'Can delete reference index');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (109, 28, N'view_referenceindex', N'Can view reference index');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (110, 29, N'add_document', N'Can add document');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (111, 29, N'change_document', N'Can change document');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (112, 29, N'delete_document', N'Can delete document');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (113, 29, N'choose_document', N'Can choose document');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (114, 30, N'add_image', N'Can add image');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (115, 30, N'change_image', N'Can change image');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (116, 30, N'delete_image', N'Can delete image');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (117, 30, N'choose_image', N'Can choose image');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (118, 2, N'add_homepage', N'Can add home page');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (119, 2, N'change_homepage', N'Can change home page');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (120, 2, N'delete_homepage', N'Can delete home page');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (121, 2, N'view_homepage', N'Can view home page');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (122, 31, N'add_formsubmission', N'Can add form submission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (123, 31, N'change_formsubmission', N'Can change form submission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (124, 31, N'delete_formsubmission', N'Can delete form submission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (125, 31, N'view_formsubmission', N'Can view form submission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (126, 32, N'add_redirect', N'Can add redirect');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (127, 32, N'change_redirect', N'Can change redirect');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (128, 32, N'delete_redirect', N'Can delete redirect');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (129, 32, N'view_redirect', N'Can view redirect');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (130, 33, N'add_embed', N'Can add embed');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (131, 33, N'change_embed', N'Can change embed');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (132, 33, N'delete_embed', N'Can delete embed');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (133, 33, N'view_embed', N'Can view embed');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (134, 34, N'add_userprofile', N'Can add user profile');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (135, 34, N'change_userprofile', N'Can change user profile');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (136, 34, N'delete_userprofile', N'Can delete user profile');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (137, 34, N'view_userprofile', N'Can view user profile');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (138, 29, N'view_document', N'Can view document');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (139, 30, N'view_image', N'Can view image');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (140, 35, N'add_rendition', N'Can add rendition');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (141, 35, N'change_rendition', N'Can change rendition');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (142, 35, N'delete_rendition', N'Can delete rendition');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (143, 35, N'view_rendition', N'Can view rendition');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (144, 36, N'add_indexentry', N'Can add index entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (145, 36, N'change_indexentry', N'Can change index entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (146, 36, N'delete_indexentry', N'Can delete index entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (147, 36, N'view_indexentry', N'Can view index entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (148, 37, N'add_sqliteftsindexentry', N'Can add sqliteftsindexentry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (149, 37, N'change_sqliteftsindexentry', N'Can change sqliteftsindexentry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (150, 37, N'delete_sqliteftsindexentry', N'Can delete sqliteftsindexentry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (151, 37, N'view_sqliteftsindexentry', N'Can view sqliteftsindexentry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (152, 38, N'add_editingsession', N'Can add editing session');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (153, 38, N'change_editingsession', N'Can change editing session');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (154, 38, N'delete_editingsession', N'Can delete editing session');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (155, 38, N'view_editingsession', N'Can view editing session');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (156, 39, N'add_formstate', N'Can add form state');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (157, 39, N'change_formstate', N'Can change form state');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (158, 39, N'delete_formstate', N'Can delete form state');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (159, 39, N'view_formstate', N'Can view form state');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (160, 40, N'add_tag', N'Can add tag');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (161, 40, N'change_tag', N'Can change tag');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (162, 40, N'delete_tag', N'Can delete tag');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (163, 40, N'view_tag', N'Can view tag');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (164, 41, N'add_taggeditem', N'Can add tagged item');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (165, 41, N'change_taggeditem', N'Can change tagged item');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (166, 41, N'delete_taggeditem', N'Can delete tagged item');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (167, 41, N'view_taggeditem', N'Can view tagged item');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (168, 42, N'add_logentry', N'Can add log entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (169, 42, N'change_logentry', N'Can change log entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (170, 42, N'delete_logentry', N'Can delete log entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (171, 42, N'view_logentry', N'Can view log entry');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (172, 43, N'add_permission', N'Can add permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (173, 43, N'change_permission', N'Can change permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (174, 43, N'delete_permission', N'Can delete permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (175, 43, N'view_permission', N'Can view permission');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (176, 44, N'add_group', N'Can add group');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (177, 44, N'change_group', N'Can change group');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (178, 44, N'delete_group', N'Can delete group');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (179, 44, N'view_group', N'Can view group');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (180, 45, N'add_user', N'Can add user');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (181, 45, N'change_user', N'Can change user');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (182, 45, N'delete_user', N'Can delete user');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (183, 45, N'view_user', N'Can view user');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (184, 46, N'add_contenttype', N'Can add content type');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (185, 46, N'change_contenttype', N'Can change content type');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (186, 46, N'delete_contenttype', N'Can delete content type');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (187, 46, N'view_contenttype', N'Can view content type');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (188, 47, N'add_session', N'Can add session');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (189, 47, N'change_session', N'Can change session');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (190, 47, N'delete_session', N'Can delete session');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (191, 47, N'view_session', N'Can view session');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (192, 48, N'add_consulta', N'Can add Consulta');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (193, 48, N'change_consulta', N'Can change Consulta');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (194, 48, N'delete_consulta', N'Can delete Consulta');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (195, 48, N'view_consulta', N'Can view Consulta');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (196, 49, N'add_citystat', N'Can add city stat');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (197, 49, N'change_citystat', N'Can change city stat');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (198, 49, N'delete_citystat', N'Can delete city stat');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (199, 49, N'view_citystat', N'Can view city stat');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (200, 50, N'add_galleryitem', N'Can add gallery item');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (201, 50, N'change_galleryitem', N'Can change gallery item');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (202, 50, N'delete_galleryitem', N'Can delete gallery item');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (203, 50, N'view_galleryitem', N'Can view gallery item');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (204, 51, N'add_heroslide', N'Can add hero slide');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (205, 51, N'change_heroslide', N'Can change hero slide');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (206, 51, N'delete_heroslide', N'Can delete hero slide');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (207, 51, N'view_heroslide', N'Can view hero slide');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (208, 52, N'add_metric', N'Can add metric');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (209, 52, N'change_metric', N'Can change metric');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (210, 52, N'delete_metric', N'Can delete metric');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (211, 52, N'view_metric', N'Can view metric');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (212, 53, N'add_resource', N'Can add resource');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (213, 53, N'change_resource', N'Can change resource');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (214, 53, N'delete_resource', N'Can delete resource');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (215, 53, N'view_resource', N'Can view resource');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (216, 54, N'add_route', N'Can add route');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (217, 54, N'change_route', N'Can change route');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (218, 54, N'delete_route', N'Can delete route');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (219, 54, N'view_route', N'Can view route');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (220, 55, N'add_routelevel', N'Can add route level');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (221, 55, N'change_routelevel', N'Can change route level');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (222, 55, N'delete_routelevel', N'Can delete route level');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (223, 55, N'view_routelevel', N'Can view route level');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (224, 56, N'add_school', N'Can add school');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (225, 56, N'change_school', N'Can change school');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (226, 56, N'delete_school', N'Can delete school');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (227, 56, N'view_school', N'Can view school');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (228, 57, N'add_sociallink', N'Can add social link');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (229, 57, N'change_sociallink', N'Can change social link');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (230, 57, N'delete_sociallink', N'Can delete social link');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (231, 57, N'view_sociallink', N'Can view social link');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (232, 58, N'add_testimonial', N'Can add testimonial');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (233, 58, N'change_testimonial', N'Can change testimonial');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (234, 58, N'delete_testimonial', N'Can delete testimonial');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (235, 58, N'view_testimonial', N'Can view testimonial');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (236, 59, N'add_contenidopage', N'Can add Página de contenido');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (237, 59, N'change_contenidopage', N'Can change Página de contenido');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (238, 59, N'delete_contenidopage', N'Can delete Página de contenido');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (239, 59, N'view_contenidopage', N'Can view Página de contenido');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (240, 60, N'add_rutatematicapage', N'Can add Ruta temática');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (241, 60, N'change_rutatematicapage', N'Can change Ruta temática');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (242, 60, N'delete_rutatematicapage', N'Can delete Ruta temática');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (243, 60, N'view_rutatematicapage', N'Can view Ruta temática');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (244, 61, N'add_descubrimaspage', N'Can add Página Descubrí más');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (245, 61, N'change_descubrimaspage', N'Can change Página Descubrí más');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (246, 61, N'delete_descubrimaspage', N'Can delete Página Descubrí más');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (247, 61, N'view_descubrimaspage', N'Can view Página Descubrí más');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (248, 62, N'add_explorarbloque', N'Can add explorar bloque');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (249, 62, N'change_explorarbloque', N'Can change explorar bloque');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (250, 62, N'delete_explorarbloque', N'Can delete explorar bloque');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (251, 62, N'view_explorarbloque', N'Can view explorar bloque');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (252, 63, N'add_rutanivel', N'Can add ruta nivel');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (253, 63, N'change_rutanivel', N'Can change ruta nivel');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (254, 63, N'delete_rutanivel', N'Can delete ruta nivel');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (255, 63, N'view_rutanivel', N'Can view ruta nivel');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (256, 64, N'add_rutabloque', N'Can add ruta bloque');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (257, 64, N'change_rutabloque', N'Can change ruta bloque');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (258, 64, N'delete_rutabloque', N'Can delete ruta bloque');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (259, 64, N'view_rutabloque', N'Can view ruta bloque');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (260, 65, N'add_ajustessitio', N'Can add Ajustes de carga y videos');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (261, 65, N'change_ajustessitio', N'Can change Ajustes de carga y videos');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (262, 65, N'delete_ajustessitio', N'Can delete Ajustes de carga y videos');
INSERT INTO [auth_permission] ([id], [content_type_id], [codename], [name]) VALUES (263, 65, N'view_ajustessitio', N'Can view Ajustes de carga y videos');
SET IDENTITY_INSERT [auth_permission] OFF;
DECLARE @max_auth_permission BIGINT; SELECT @max_auth_permission = ISNULL(MAX([id]), 0) FROM [auth_permission];
IF @max_auth_permission > 0 DBCC CHECKIDENT (N'dbo.auth_permission', RESEED, @max_auth_permission);
GO

-- auth_user: 1 filas
SET IDENTITY_INSERT [auth_user] ON;
INSERT INTO [auth_user] ([id], [password], [last_login], [is_superuser], [username], [last_name], [email], [is_staff], [is_active], [date_joined], [first_name]) VALUES (1, N'pbkdf2_sha256$1000000$4nofvFQRvpgoDTAQUe9sL4$i3HcWS+POReYa1VxOr3YpJdaZiriOM4R3BjvwwymFPk=', N'2026-11-24 12:28:18.906619', 1, N'admin', N'', N'admin@gamil.com', 1, 1, N'2026-11-03 13:51:58.728804', N'');
SET IDENTITY_INSERT [auth_user] OFF;
DECLARE @max_auth_user BIGINT; SELECT @max_auth_user = ISNULL(MAX([id]), 0) FROM [auth_user];
IF @max_auth_user > 0 DBCC CHECKIDENT (N'dbo.auth_user', RESEED, @max_auth_user);
GO

-- auth_user_groups: 0 filas

-- auth_user_user_permissions: 0 filas

-- django_admin_log: 0 filas

-- django_content_type: 65 filas
SET IDENTITY_INSERT [django_content_type] ON;
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (1, N'wagtailcore', N'page');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (2, N'home', N'homepage');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (3, N'wagtailadmin', N'admin');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (4, N'wagtailcore', N'groupapprovaltask');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (5, N'wagtailcore', N'locale');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (6, N'wagtailcore', N'site');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (7, N'wagtailcore', N'groupsitepermission');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (8, N'wagtailcore', N'apitoken');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (9, N'wagtailcore', N'modellogentry');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (10, N'wagtailcore', N'revision');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (11, N'wagtailcore', N'collectionviewrestriction');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (12, N'wagtailcore', N'collection');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (13, N'wagtailcore', N'groupcollectionpermission');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (14, N'wagtailcore', N'uploadedfile');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (15, N'wagtailcore', N'workflowcontenttype');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (16, N'wagtailcore', N'workflowstate');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (17, N'wagtailcore', N'workflow');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (18, N'wagtailcore', N'workflowtask');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (19, N'wagtailcore', N'task');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (20, N'wagtailcore', N'taskstate');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (21, N'wagtailcore', N'grouppagepermission');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (22, N'wagtailcore', N'pageviewrestriction');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (23, N'wagtailcore', N'workflowpage');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (24, N'wagtailcore', N'pagelogentry');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (25, N'wagtailcore', N'comment');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (26, N'wagtailcore', N'commentreply');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (27, N'wagtailcore', N'pagesubscription');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (28, N'wagtailcore', N'referenceindex');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (29, N'wagtaildocs', N'document');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (30, N'wagtailimages', N'image');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (31, N'wagtailforms', N'formsubmission');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (32, N'wagtailredirects', N'redirect');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (33, N'wagtailembeds', N'embed');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (34, N'wagtailusers', N'userprofile');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (35, N'wagtailimages', N'rendition');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (36, N'wagtailsearch', N'indexentry');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (37, N'wagtailsearch', N'sqliteftsindexentry');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (38, N'wagtailadmin', N'editingsession');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (39, N'wagtailadmin', N'formstate');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (40, N'taggit', N'tag');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (41, N'taggit', N'taggeditem');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (42, N'admin', N'logentry');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (43, N'auth', N'permission');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (44, N'auth', N'group');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (45, N'auth', N'user');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (46, N'contenttypes', N'contenttype');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (47, N'sessions', N'session');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (48, N'home', N'consulta');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (49, N'home', N'citystat');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (50, N'home', N'galleryitem');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (51, N'home', N'heroslide');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (52, N'home', N'metric');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (53, N'home', N'resource');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (54, N'home', N'route');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (55, N'home', N'routelevel');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (56, N'home', N'school');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (57, N'home', N'sociallink');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (58, N'home', N'testimonial');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (59, N'home', N'contenidopage');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (60, N'home', N'rutatematicapage');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (61, N'home', N'descubrimaspage');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (62, N'home', N'explorarbloque');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (63, N'home', N'rutanivel');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (64, N'home', N'rutabloque');
INSERT INTO [django_content_type] ([id], [app_label], [model]) VALUES (65, N'home', N'ajustessitio');
SET IDENTITY_INSERT [django_content_type] OFF;
DECLARE @max_django_content_type BIGINT; SELECT @max_django_content_type = ISNULL(MAX([id]), 0) FROM [django_content_type];
IF @max_django_content_type > 0 DBCC CHECKIDENT (N'dbo.django_content_type', RESEED, @max_django_content_type);
GO

-- django_migrations: 226 filas
SET IDENTITY_INSERT [django_migrations] ON;
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (1, N'contenttypes', N'0001_initial', N'2026-11-03 13:50:37.709525');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (2, N'auth', N'0001_initial', N'2026-11-03 13:50:37.779722');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (3, N'admin', N'0001_initial', N'2026-11-03 13:50:37.810244');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (4, N'admin', N'0002_logentry_remove_auto_add', N'2026-11-03 13:50:37.871243');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (5, N'admin', N'0003_logentry_add_action_flag_choices', N'2026-11-03 13:50:37.887243');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (6, N'contenttypes', N'0002_remove_content_type_name', N'2026-11-03 13:50:37.921242');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (7, N'auth', N'0002_alter_permission_name_max_length', N'2026-11-03 13:50:37.948241');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (8, N'auth', N'0003_alter_user_email_max_length', N'2026-11-03 13:50:37.974241');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (9, N'auth', N'0004_alter_user_username_opts', N'2026-11-03 13:50:37.989240');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (10, N'auth', N'0005_alter_user_last_login_null', N'2026-11-03 13:50:38.015240');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (11, N'auth', N'0006_require_contenttypes_0002', N'2026-11-03 13:50:38.022239');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (12, N'auth', N'0007_alter_validators_add_error_messages', N'2026-11-03 13:50:38.050241');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (13, N'auth', N'0008_alter_user_username_max_length', N'2026-11-03 13:50:38.100241');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (14, N'auth', N'0009_alter_user_last_name_max_length', N'2026-11-03 13:50:38.148239');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (15, N'auth', N'0010_alter_group_name_max_length', N'2026-11-03 13:50:38.177240');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (16, N'auth', N'0011_update_proxy_permissions', N'2026-11-03 13:50:38.198241');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (17, N'auth', N'0012_alter_user_first_name_max_length', N'2026-11-03 13:50:38.229240');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (18, N'wagtailcore', N'0001_initial', N'2026-11-03 13:50:38.510241');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (19, N'wagtailcore', N'0002_initial_data', N'2026-11-03 13:50:38.515240');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (20, N'wagtailcore', N'0003_add_uniqueness_constraint_on_group_page_permission', N'2026-11-03 13:50:38.521239');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (21, N'wagtailcore', N'0004_page_locked', N'2026-11-03 13:50:38.527239');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (22, N'wagtailcore', N'0005_add_page_lock_permission_to_moderators', N'2026-11-03 13:50:38.533239');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (23, N'wagtailcore', N'0006_add_lock_page_permission', N'2026-11-03 13:50:38.540241');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (24, N'wagtailcore', N'0007_page_latest_revision_created_at', N'2026-11-03 13:50:38.545239');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (25, N'wagtailcore', N'0008_populate_latest_revision_created_at', N'2026-11-03 13:50:38.551242');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (26, N'wagtailcore', N'0009_remove_auto_now_add_from_pagerevision_created_at', N'2026-11-03 13:50:38.556240');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (27, N'wagtailcore', N'0010_change_page_owner_to_null_on_delete', N'2026-11-03 13:50:38.561239');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (28, N'wagtailcore', N'0011_page_first_published_at', N'2026-11-03 13:50:38.566240');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (29, N'wagtailcore', N'0012_extend_page_slug_field', N'2026-11-03 13:50:38.571808');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (30, N'wagtailcore', N'0013_update_golive_expire_help_text', N'2026-11-03 13:50:38.576806');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (31, N'wagtailcore', N'0014_add_verbose_name', N'2026-11-03 13:50:38.603805');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (32, N'wagtailcore', N'0015_add_more_verbose_names', N'2026-11-03 13:50:38.609807');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (33, N'wagtailcore', N'0016_change_page_url_path_to_text_field', N'2026-11-03 13:50:38.636807');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (34, N'wagtailcore', N'0017_change_edit_page_permission_description', N'2026-11-03 13:50:38.683805');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (35, N'wagtailcore', N'0018_pagerevision_submitted_for_moderation_index', N'2026-11-03 13:50:38.729806');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (36, N'wagtailcore', N'0019_verbose_names_cleanup', N'2026-11-03 13:50:38.827334');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (37, N'wagtailcore', N'0020_add_index_on_page_first_published_at', N'2026-11-03 13:50:38.984336');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (38, N'wagtailcore', N'0021_capitalizeverbose', N'2026-11-03 13:50:39.563336');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (39, N'wagtailcore', N'0022_add_site_name', N'2026-11-03 13:50:39.616002');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (40, N'wagtailcore', N'0023_alter_page_revision_on_delete_behaviour', N'2026-11-03 13:50:39.638990');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (41, N'wagtailcore', N'0024_collection', N'2026-11-03 13:50:39.647994');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (42, N'wagtailcore', N'0025_collection_initial_data', N'2026-11-03 13:50:39.673992');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (43, N'wagtailcore', N'0026_group_collection_permission', N'2026-11-03 13:50:39.729991');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (44, N'wagtailcore', N'0027_fix_collection_path_collation', N'2026-11-03 13:50:39.750994');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (45, N'wagtailcore', N'0024_alter_page_content_type_on_delete_behaviour', N'2026-11-03 13:50:39.781416');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (46, N'wagtailcore', N'0028_merge', N'2026-11-03 13:50:39.805415');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (47, N'wagtailcore', N'0029_unicode_slugfield_dj19', N'2026-11-03 13:50:39.914430');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (48, N'wagtailcore', N'0030_index_on_pagerevision_created_at', N'2026-11-03 13:50:39.955412');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (49, N'wagtailcore', N'0031_add_page_view_restriction_types', N'2026-11-03 13:50:40.039415');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (50, N'wagtailcore', N'0032_add_bulk_delete_page_permission', N'2026-11-03 13:50:40.076413');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (51, N'wagtailcore', N'0033_remove_golive_expiry_help_text', N'2026-11-03 13:50:40.118413');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (52, N'wagtailcore', N'0034_page_live_revision', N'2026-11-03 13:50:40.153420');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (53, N'wagtailcore', N'0035_page_last_published_at', N'2026-11-03 13:50:40.175414');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (54, N'wagtailcore', N'0036_populate_page_last_published_at', N'2026-11-03 13:50:40.245414');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (55, N'wagtailcore', N'0037_set_page_owner_editable', N'2026-11-03 13:50:40.272414');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (56, N'wagtailcore', N'0038_make_first_published_at_editable', N'2026-11-03 13:50:40.298412');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (57, N'wagtailcore', N'0039_collectionviewrestriction', N'2026-11-03 13:50:40.359413');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (58, N'wagtailcore', N'0040_page_draft_title', N'2026-11-03 13:50:40.411413');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (59, N'home', N'0001_initial', N'2026-11-03 13:50:40.439411');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (60, N'home', N'0002_create_homepage', N'2026-11-03 13:50:40.477416');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (61, N'sessions', N'0001_initial', N'2026-11-03 13:50:40.529413');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (62, N'taggit', N'0001_initial', N'2026-11-03 13:50:40.564414');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (63, N'taggit', N'0002_auto_20150616_2121', N'2026-11-03 13:50:40.581392');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (64, N'taggit', N'0003_taggeditem_add_unique_index', N'2026-11-03 13:50:40.605392');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (65, N'taggit', N'0004_alter_taggeditem_content_type_alter_taggeditem_tag', N'2026-11-03 13:50:40.676391');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (66, N'taggit', N'0005_auto_20220424_2025', N'2026-11-03 13:50:40.695393');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (67, N'taggit', N'0006_rename_taggeditem_content_type_object_id_taggit_tagg_content_8fc721_idx', N'2026-11-03 13:50:40.751392');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (68, N'wagtailadmin', N'0001_create_admin_access_permissions', N'2026-11-03 13:50:40.789643');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (69, N'wagtailadmin', N'0002_admin', N'2026-11-03 13:50:40.799641');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (70, N'wagtailadmin', N'0003_admin_managed', N'2026-11-03 13:50:40.812640');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (71, N'wagtailadmin', N'0004_editingsession', N'2026-11-03 13:50:40.965641');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (72, N'wagtailadmin', N'0005_editingsession_is_editing', N'2026-11-03 13:50:41.007643');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (73, N'wagtailadmin', N'0006_formstate', N'2026-11-03 13:50:41.065642');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (74, N'wagtailcore', N'0041_group_collection_permissions_verbose_name_plural', N'2026-11-03 13:50:41.082643');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (75, N'wagtailcore', N'0042_index_on_pagerevision_approved_go_live_at', N'2026-11-03 13:50:41.127644');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (76, N'wagtailcore', N'0043_lock_fields', N'2026-11-03 13:50:41.190641');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (77, N'wagtailcore', N'0044_add_unlock_grouppagepermission', N'2026-11-03 13:50:41.242162');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (78, N'wagtailcore', N'0045_assign_unlock_grouppagepermission', N'2026-11-03 13:50:41.300163');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (79, N'wagtailcore', N'0046_site_name_remove_null', N'2026-11-03 13:50:41.332165');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (80, N'wagtailcore', N'0047_add_workflow_models', N'2026-11-03 13:50:41.698089');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (81, N'wagtailcore', N'0048_add_default_workflows', N'2026-11-03 13:50:41.796842');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (82, N'wagtailcore', N'0049_taskstate_finished_by', N'2026-11-03 13:50:41.898844');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (83, N'wagtailcore', N'0050_workflow_rejected_to_needs_changes', N'2026-11-03 13:50:42.022839');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (84, N'wagtailcore', N'0051_taskstate_comment', N'2026-11-03 13:50:42.059861');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (85, N'wagtailcore', N'0052_pagelogentry', N'2026-11-03 13:50:42.119838');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (86, N'wagtailcore', N'0053_locale_model', N'2026-11-03 13:50:42.129837');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (87, N'wagtailcore', N'0054_initial_locale', N'2026-11-03 13:50:42.184838');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (88, N'wagtailcore', N'0055_page_locale_fields', N'2026-11-03 13:50:42.327839');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (89, N'wagtailcore', N'0056_page_locale_fields_populate', N'2026-11-03 13:50:42.519840');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (90, N'wagtailcore', N'0057_page_locale_fields_notnull', N'2026-11-03 13:50:42.597856');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (91, N'wagtailcore', N'0058_page_alias_of', N'2026-11-03 13:50:42.655856');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (92, N'wagtailcore', N'0059_apply_collection_ordering', N'2026-11-03 13:50:42.697879');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (93, N'wagtailcore', N'0060_fix_workflow_unique_constraint', N'2026-11-03 13:50:42.780886');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (94, N'wagtailcore', N'0061_change_promote_tab_helpt_text_and_verbose_names', N'2026-11-03 13:50:42.833886');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (95, N'wagtailcore', N'0062_comment_models_and_pagesubscription', N'2026-11-03 13:50:42.967885');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (96, N'wagtailcore', N'0063_modellogentry', N'2026-11-03 13:50:43.023885');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (97, N'wagtailcore', N'0064_log_timestamp_indexes', N'2026-11-03 13:50:43.105886');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (98, N'wagtailcore', N'0065_log_entry_uuid', N'2026-11-03 13:50:43.192888');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (99, N'wagtailcore', N'0066_collection_management_permissions', N'2026-11-03 13:50:43.267886');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (100, N'wagtailcore', N'0067_alter_pagerevision_content_json', N'2026-11-03 13:50:43.384885');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (101, N'wagtailcore', N'0068_log_entry_empty_object', N'2026-11-03 13:50:43.437886');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (102, N'wagtailcore', N'0069_log_entry_jsonfield', N'2026-11-03 13:50:43.602965');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (103, N'wagtailcore', N'0070_rename_pagerevision_revision', N'2026-11-03 13:50:44.410712');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (104, N'wagtailcore', N'0071_populate_revision_content_type', N'2026-11-03 13:50:44.481712');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (105, N'wagtailcore', N'0072_alter_revision_content_type_notnull', N'2026-11-03 13:50:44.615855');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (106, N'wagtailcore', N'0073_page_latest_revision', N'2026-11-03 13:50:44.688856');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (107, N'wagtailcore', N'0074_revision_object_str', N'2026-11-03 13:50:44.746855');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (108, N'wagtailcore', N'0075_populate_latest_revision_and_revision_object_str', N'2026-11-03 13:50:44.848672');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (109, N'wagtailcore', N'0076_modellogentry_revision', N'2026-11-03 13:50:44.938671');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (110, N'wagtailcore', N'0077_alter_revision_user', N'2026-11-03 13:50:45.001669');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (111, N'wagtailcore', N'0078_referenceindex', N'2026-11-03 13:50:45.097674');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (112, N'wagtailcore', N'0079_rename_taskstate_page_revision', N'2026-11-03 13:50:45.151671');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (113, N'wagtailcore', N'0080_generic_workflowstate', N'2026-11-03 13:50:45.590744');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (114, N'wagtailcore', N'0081_populate_workflowstate_content_type', N'2026-11-03 13:50:45.713745');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (115, N'wagtailcore', N'0082_alter_workflowstate_content_type_notnull', N'2026-11-03 13:50:45.929561');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (116, N'wagtailcore', N'0083_workflowcontenttype', N'2026-11-03 13:50:45.987561');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (117, N'wagtailcore', N'0084_add_default_page_permissions', N'2026-11-03 13:50:46.017561');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (118, N'wagtailcore', N'0085_add_grouppagepermission_permission', N'2026-11-03 13:50:46.124561');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (119, N'wagtailcore', N'0086_populate_grouppagepermission_permission', N'2026-11-03 13:50:46.233561');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (120, N'wagtailcore', N'0087_alter_grouppagepermission_unique_together_and_more', N'2026-11-03 13:50:46.381561');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (121, N'wagtailcore', N'0088_fix_log_entry_json_timestamps', N'2026-11-03 13:50:46.613308');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (122, N'wagtailcore', N'0089_log_entry_data_json_null_to_object', N'2026-11-03 13:50:46.662307');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (123, N'wagtailcore', N'0090_remove_grouppagepermission_permission_type', N'2026-11-03 13:50:46.820958');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (124, N'wagtailcore', N'0091_remove_revision_submitted_for_moderation', N'2026-11-03 13:50:46.868960');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (125, N'wagtailcore', N'0092_alter_collectionviewrestriction_password_and_more', N'2026-11-03 13:50:46.975958');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (126, N'wagtailcore', N'0093_uploadedfile', N'2026-11-03 13:50:47.036970');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (127, N'wagtailcore', N'0094_alter_page_locale', N'2026-11-03 13:50:47.095960');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (128, N'wagtailcore', N'0095_groupsitepermission', N'2026-11-03 13:50:47.349959');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (129, N'wagtailcore', N'0096_referenceindex_referenceindex_source_object_and_more', N'2026-11-03 13:50:47.422958');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (130, N'wagtailcore', N'0097_baselogentry_uuid_action_timestamp_indexes', N'2026-11-03 13:50:47.553959');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (131, N'wagtailcore', N'0098_apitoken', N'2026-11-03 13:50:47.622958');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (132, N'wagtaildocs', N'0001_initial', N'2026-11-03 13:50:47.699957');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (133, N'wagtaildocs', N'0002_initial_data', N'2026-11-03 13:50:47.764960');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (134, N'wagtaildocs', N'0003_add_verbose_names', N'2026-11-03 13:50:47.887734');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (135, N'wagtaildocs', N'0004_capitalizeverbose', N'2026-11-03 13:50:48.525733');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (136, N'wagtaildocs', N'0005_document_collection', N'2026-11-03 13:50:48.702057');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (137, N'wagtaildocs', N'0006_copy_document_permissions_to_collections', N'2026-11-03 13:50:48.962186');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (138, N'wagtaildocs', N'0005_alter_uploaded_by_user_on_delete_action', N'2026-11-03 13:50:49.036185');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (139, N'wagtaildocs', N'0007_merge', N'2026-11-03 13:50:49.048184');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (140, N'wagtaildocs', N'0008_document_file_size', N'2026-11-03 13:50:49.107182');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (141, N'wagtaildocs', N'0009_document_verbose_name_plural', N'2026-11-03 13:50:49.157188');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (142, N'wagtaildocs', N'0010_document_file_hash', N'2026-11-03 13:50:49.220185');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (143, N'wagtaildocs', N'0011_add_choose_permissions', N'2026-11-03 13:50:49.396182');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (144, N'wagtaildocs', N'0012_uploadeddocument', N'2026-11-03 13:50:49.466183');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (145, N'wagtaildocs', N'0013_delete_uploadeddocument', N'2026-11-03 13:50:49.474182');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (146, N'wagtaildocs', N'0014_alter_document_file_size', N'2026-11-03 13:50:49.540185');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (147, N'wagtailembeds', N'0001_initial', N'2026-11-03 13:50:49.559185');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (148, N'wagtailembeds', N'0002_add_verbose_names', N'2026-11-03 13:50:49.573852');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (149, N'wagtailembeds', N'0003_capitalizeverbose', N'2026-11-03 13:50:49.627860');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (150, N'wagtailembeds', N'0004_embed_verbose_name_plural', N'2026-11-03 13:50:49.638847');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (151, N'wagtailembeds', N'0005_specify_thumbnail_url_max_length', N'2026-11-03 13:50:49.659847');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (152, N'wagtailembeds', N'0006_add_embed_hash', N'2026-11-03 13:50:49.685848');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (153, N'wagtailembeds', N'0007_populate_hash', N'2026-11-03 13:50:49.795643');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (154, N'wagtailembeds', N'0008_allow_long_urls', N'2026-11-03 13:50:49.901644');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (155, N'wagtailembeds', N'0009_embed_cache_until', N'2026-11-03 13:50:49.922645');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (156, N'wagtailforms', N'0001_initial', N'2026-11-03 13:50:50.006645');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (157, N'wagtailforms', N'0002_add_verbose_names', N'2026-11-03 13:50:50.186644');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (158, N'wagtailforms', N'0003_capitalizeverbose', N'2026-11-03 13:50:50.241646');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (159, N'wagtailforms', N'0004_add_verbose_name_plural', N'2026-11-03 13:50:50.264644');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (160, N'wagtailforms', N'0005_alter_formsubmission_form_data', N'2026-11-03 13:50:50.301644');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (161, N'wagtailimages', N'0001_initial', N'2026-11-03 13:50:50.591411');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (162, N'wagtailimages', N'0002_initial_data', N'2026-11-03 13:50:50.596411');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (163, N'wagtailimages', N'0003_fix_focal_point_fields', N'2026-11-03 13:50:50.601413');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (164, N'wagtailimages', N'0004_make_focal_point_key_not_nullable', N'2026-11-03 13:50:50.606411');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (165, N'wagtailimages', N'0005_make_filter_spec_unique', N'2026-11-03 13:50:50.610411');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (166, N'wagtailimages', N'0006_add_verbose_names', N'2026-11-03 13:50:50.615412');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (167, N'wagtailimages', N'0007_image_file_size', N'2026-11-03 13:50:50.619411');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (168, N'wagtailimages', N'0008_image_created_at_index', N'2026-11-03 13:50:50.624410');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (169, N'wagtailimages', N'0009_capitalizeverbose', N'2026-11-03 13:50:50.629413');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (170, N'wagtailimages', N'0010_change_on_delete_behaviour', N'2026-11-03 13:50:50.634410');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (171, N'wagtailimages', N'0011_image_collection', N'2026-11-03 13:50:50.639411');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (172, N'wagtailimages', N'0012_copy_image_permissions_to_collections', N'2026-11-03 13:50:50.644410');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (173, N'wagtailimages', N'0013_make_rendition_upload_callable', N'2026-11-03 13:50:50.649410');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (174, N'wagtailimages', N'0014_add_filter_spec_field', N'2026-11-03 13:50:50.654412');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (175, N'wagtailimages', N'0015_fill_filter_spec_field', N'2026-11-03 13:50:50.659412');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (176, N'wagtailimages', N'0016_deprecate_rendition_filter_relation', N'2026-11-03 13:50:50.664411');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (177, N'wagtailimages', N'0017_reduce_focal_point_key_max_length', N'2026-11-03 13:50:50.678412');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (178, N'wagtailimages', N'0018_remove_rendition_filter', N'2026-11-03 13:50:50.684413');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (179, N'wagtailimages', N'0019_delete_filter', N'2026-11-03 13:50:50.692411');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (180, N'wagtailimages', N'0020_add-verbose-name', N'2026-11-03 13:50:50.701413');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (181, N'wagtailimages', N'0021_image_file_hash', N'2026-11-03 13:50:50.706411');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (182, N'wagtailimages', N'0022_uploadedimage', N'2026-11-03 13:50:50.807170');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (183, N'wagtailimages', N'0023_add_choose_permissions', N'2026-11-03 13:50:51.144174');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (184, N'wagtailimages', N'0024_index_image_file_hash', N'2026-11-03 13:50:51.281172');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (185, N'wagtailimages', N'0025_alter_image_file_alter_rendition_file', N'2026-11-03 13:50:51.356174');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (186, N'wagtailimages', N'0026_delete_uploadedimage', N'2026-11-03 13:50:51.421173');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (187, N'wagtailimages', N'0027_image_description', N'2026-11-03 13:50:51.667141');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (188, N'wagtailredirects', N'0001_initial', N'2026-11-03 13:50:51.771141');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (189, N'wagtailredirects', N'0002_add_verbose_names', N'2026-11-03 13:50:51.849892');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (190, N'wagtailredirects', N'0003_make_site_field_editable', N'2026-11-03 13:50:52.066889');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (191, N'wagtailredirects', N'0004_set_unique_on_path_and_site', N'2026-11-03 13:50:52.137413');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (192, N'wagtailredirects', N'0005_capitalizeverbose', N'2026-11-03 13:50:52.376409');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (193, N'wagtailredirects', N'0006_redirect_increase_max_length', N'2026-11-03 13:50:52.507410');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (194, N'wagtailredirects', N'0007_add_autocreate_fields', N'2026-11-03 13:50:52.667309');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (195, N'wagtailredirects', N'0008_add_verbose_name_plural', N'2026-11-03 13:50:52.700308');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (196, N'wagtailsearch', N'0001_initial', N'2026-11-03 13:50:52.867786');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (197, N'wagtailsearch', N'0002_add_verbose_names', N'2026-11-03 13:50:52.982789');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (198, N'wagtailsearch', N'0003_remove_editors_pick', N'2026-11-03 13:50:52.988788');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (199, N'wagtailsearch', N'0004_querydailyhits_verbose_name_plural', N'2026-11-03 13:50:52.998788');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (200, N'wagtailsearch', N'0005_create_indexentry', N'2026-11-03 13:50:53.111788');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (201, N'wagtailsearch', N'0006_customise_indexentry', N'2026-11-03 13:50:53.334791');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (202, N'wagtailsearch', N'0007_delete_editorspick', N'2026-11-03 13:50:53.451787');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (203, N'wagtailsearch', N'0008_remove_query_and_querydailyhits_models', N'2026-11-03 13:50:53.489786');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (204, N'wagtailsearch', N'0009_remove_ngram_autocomplete', N'2026-11-03 13:50:53.495787');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (205, N'wagtailsearch', N'0010_add_text_fields', N'2026-11-03 13:50:53.501786');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (206, N'wagtailusers', N'0001_initial', N'2026-11-03 13:50:53.704633');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (207, N'wagtailusers', N'0002_add_verbose_name_on_userprofile', N'2026-11-03 13:50:53.820759');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (208, N'wagtailusers', N'0003_add_verbose_names', N'2026-11-03 13:50:53.860759');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (209, N'wagtailusers', N'0004_capitalizeverbose', N'2026-11-03 13:50:53.990760');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (210, N'wagtailusers', N'0005_make_related_name_wagtail_specific', N'2026-11-03 13:50:54.051762');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (211, N'wagtailusers', N'0006_userprofile_prefered_language', N'2026-11-03 13:50:54.098761');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (212, N'wagtailusers', N'0007_userprofile_current_time_zone', N'2026-11-03 13:50:54.320762');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (213, N'wagtailusers', N'0008_userprofile_avatar', N'2026-11-03 13:50:54.450759');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (214, N'wagtailusers', N'0009_userprofile_verbose_name_plural', N'2026-11-03 13:50:54.489762');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (215, N'wagtailusers', N'0010_userprofile_updated_comments_notifications', N'2026-11-03 13:50:54.558760');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (216, N'wagtailusers', N'0011_userprofile_dismissibles', N'2026-11-03 13:50:54.614327');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (217, N'wagtailusers', N'0012_userprofile_theme', N'2026-11-03 13:50:54.658335');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (218, N'wagtailusers', N'0013_userprofile_density', N'2026-11-03 13:50:54.704325');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (219, N'wagtailusers', N'0014_userprofile_contrast', N'2026-11-03 13:50:54.754346');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (220, N'wagtailusers', N'0015_userprofile_keyboard_shortcuts', N'2026-11-03 13:50:54.802582');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (221, N'wagtailimages', N'0001_squashed_0021', N'2026-11-03 13:50:54.815579');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (222, N'wagtailcore', N'0001_squashed_0016_change_page_url_path_to_text_field', N'2026-11-03 13:50:54.822580');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (223, N'home', N'0003_consulta_homepage_aif_url_homepage_alcance_and_more', N'2026-11-19 18:10:36.879506');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (224, N'home', N'0004_contenido_page', N'2026-11-19 18:22:18.041974');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (225, N'home', N'0005_rutas_descubri_pages', N'2026-11-19 19:02:34.227098');
INSERT INTO [django_migrations] ([id], [app], [name], [applied]) VALUES (226, N'home', N'0006_ajustes_video_contenido', N'2026-11-24 12:27:41.552384');
SET IDENTITY_INSERT [django_migrations] OFF;
DECLARE @max_django_migrations BIGINT; SELECT @max_django_migrations = ISNULL(MAX([id]), 0) FROM [django_migrations];
IF @max_django_migrations > 0 DBCC CHECKIDENT (N'dbo.django_migrations', RESEED, @max_django_migrations);
GO

-- django_session: 16 filas
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES (N'kty46q5r13o5ayaf134bh0ww4wdkotnq', N'.eJxVjMEOwiAQBf-FsyEslNL26N1vIAsLFjXQlDbRGP9da3rQ65t582QW12W0aw2zTcQGBuzwuzn015A3QBfM58J9ycucHN8UvtPKT4XC7bi7f4ER6_h5K0nCoY5KKADsOhJgqIkSRKuNbEzftDGCi6ANeq1UDK3vIyqUQD3iN1pDralkG-5Tmh9sEK83aos--A:1xOExX:y8pXhaMzCNiMd5h0lllJ7_2AazV3Q2D5xdghTovTG1A', N'2026-11-17 13:53:55.755646');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES (N'x7gsvpvtlyc5j38n6l9s8bj1xzbjnjjg', N'.eJxVjMEOwiAQBf-FsyFQWGh79O43kAW2ghowpU00xn_XJj3o9c28eTGH65Lc2mh2ObKRSXb43TyGK5UNxAuWc-WhlmXOnm8K32njpxrpdtzdv0DClr7voY8KJMVJCt0pYxAUKhA0oQ9WGxN96L2dAg0doJagiSSQAGON8Fp1W7RRa7kWR497np9sFO8Pgs4-1g:1xQmvJ:Pc_nqdtQeM2e9uvDTqNOvVXkf7LuRuXVwsaStKP5bhA', N'2026-11-24 14:34:09.768985');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES (N'8iz3gbqvbl6d3g0q2r2dvzbw1y816kok', N'.eJxVjMEOwiAQBf-FsyFQWGh79O43kAW2ghowpU00xn_XJj3o9c28eTGH65Lc2mh2ObKRSXb43TyGK5UNxAuWc-WhlmXOnm8K32njpxrpdtzdv0DClr7voY8KJMVJCt0pYxAUKhA0oQ9WGxN96L2dAg0doJagiSSQAGON8Fp1W7RRa7kWR497np9sFO8Pgs4-1g:1xQnEK:q0BE9b24xAKLthDncmBK1jgGP2v8Bh6AI5gRJ8w_iRA', N'2026-11-24 14:53:48.307936');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES (N'n6harse88cnosfi6nv6oqivfti3tk63k', N'.eJxVjMEOwiAQBf-FsyFQWGh79O43kAW2ghowpU00xn_XJj3o9c28eTGH65Lc2mh2ObKRSXb43TyGK5UNxAuWc-WhlmXOnm8K32njpxrpdtzdv0DClr7voY8KJMVJCt0pYxAUKhA0oQ9WGxN96L2dAg0doJagiSSQAGON8Fp1W7RRa7kWR497np9sFO8Pgs4-1g:1xQnG2:TtaCJbV_9taBnUQMUZ4kC73g875WDVaT5ckkP9LJ59o', N'2026-11-24 14:55:34.341516');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES (N'fal6k7wm3g9md4pcce3z28pe65hx2aey', N'.eJxVjMEOwiAQBf-FsyFQWGh79O43kAW2ghowpU00xn_XJj3o9c28eTGH65Lc2mh2ObKRSXb43TyGK5UNxAuWc-WhlmXOnm8K32njpxrpdtzdv0DClr7voY8KJMVJCt0pYxAUKhA0oQ9WGxN96L2dAg0doJagiSSQAGON8Fp1W7RRa7kWR497np9sFO8Pgs4-1g:1xQnH0:TywZmpinz6DsHhil8xzHzF9m_KUjXRwuGZ9b7H5X0y4', N'2026-11-24 14:56:34.664992');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES (N'33b8plhrswtjd9ueo12lm6an55fqf2r8', N'.eJxVjEEOwiAQRe_C2hCBtkNduvcMZJiZWtSAKW2iMd5dm3Sh2__efy8VcJnHsFSZQmJ1UEbtfreIdJW8Ar5gPhdNJc9TinpV9EarPhWW23Fz_wIj1vH7jmK7hsBacN60An1L7IQAiAaD3hs2SNg7T5GjGxw3llzL0JGF3sqwRqvUmkoO8rin6akO-_cHn7M_qQ:1xTJGB:pQtec2uPTUc8yuVxMSqzXAxxOaKRw1IEaT3hv_UOuCg', N'2026-12-01 13:30:07.339365');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES (N'pmwk5vgyv8gn2hly40pxmhy49hxnd0w9', N'.eJxVjEEOwiAQRe_C2hCBtkNduvcMZJiZWtSAKW2iMd5dm3Sh2__efy8VcJnHsFSZQmJ1UEbtfreIdJW8Ar5gPhdNJc9TinpV9EarPhWW23Fz_wIj1vH7jmK7hsBacN60An1L7IQAiAaD3hs2SNg7T5GjGxw3llzL0JGF3sqwRqvUmkoO8rin6akO-_cHn7M_qQ:1xTJLq:mPLs-AHhMRXwyRTT7s58M8PFU6go-UC-aP0EyaYzrkU', N'2026-12-01 13:35:58.416877');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES (N'5vf3bifv770j7ehre7p3r85tw4tpxyuy', N'.eJxVjEEOwiAQRe_C2hCBtkNduvcMZJiZWtSAKW2iMd5dm3Sh2__efy8VcJnHsFSZQmJ1UEbtfreIdJW8Ar5gPhdNJc9TinpV9EarPhWW23Fz_wIj1vH7jmK7hsBacN60An1L7IQAiAaD3hs2SNg7T5GjGxw3llzL0JGF3sqwRqvUmkoO8rin6akO-_cHn7M_qQ:1xU6hW:wcOiLUACyQOd7mrgm5CRs0OUUzBTlBK6GPpWS-ncc4k', N'2026-12-03 18:17:38.530894');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES (N'q14rrbj7zyg73f4hqmsz0tcq6o0xvsyd', N'.eJxVjEEOwiAQRe_C2pAApQMu3XsGMswMUjU0Ke3KeHdt0oVu_3vvv1TCba1p67KkidVZGXX63TLSQ9oO-I7tNmua27pMWe-KPmjX15nleTncv4OKvX7rLHYcCKwFF4wXiJ7YCQEQFYMhGDZIGF2gzNkVx4Ml5xlGshCtFPX-AOztOGw:1xU6nH:FmDP6jrO0prHhk4YYbZgO8tgfKllNoATnqod-_TQN2M', N'2026-12-03 18:23:35.369858');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES (N'yiqgqnjao1mwq449i6g23dwwawowzb17', N'.eJxVjEEOwiAQRe_C2pAApQMu3XsGMswMUjU0Ke3KeHdt0oVu_3vvv1TCba1p67KkidVZGXX63TLSQ9oO-I7tNmua27pMWe-KPmjX15nleTncv4OKvX7rLHYcCKwFF4wXiJ7YCQEQFYMhGDZIGF2gzNkVx4Ml5xlGshCtFPX-AOztOGw:1xU6ne:x6zphIQKngr2Ew8c0Ex3eHwR5hAevYrzwdyJWx_iXAI', N'2026-12-03 18:23:58.818568');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES (N'novc96bu7pte90d9fx8xz2zic4596i1z', N'.eJxVjEEOwiAQRe_C2pAApQMu3XsGMswMUjU0Ke3KeHdt0oVu_3vvv1TCba1p67KkidVZGXX63TLSQ9oO-I7tNmua27pMWe-KPmjX15nleTncv4OKvX7rLHYcCKwFF4wXiJ7YCQEQFYMhGDZIGF2gzNkVx4Ml5xlGshCtFPX-AOztOGw:1xU6no:S5qJOcx5RG5UMx0g5bJlUCzhVD3Eqm1a25o46G-y0qo', N'2026-12-03 18:24:08.843120');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES (N'xbnkqbus303ww91ne8cmaycmwy26zafe', N'.eJxVjEEOwiAQRe_C2pAApQMu3XsGMswMUjU0Ke3KeHdt0oVu_3vvv1TCba1p67KkidVZGXX63TLSQ9oO-I7tNmua27pMWe-KPmjX15nleTncv4OKvX7rLHYcCKwFF4wXiJ7YCQEQFYMhGDZIGF2gzNkVx4Ml5xlGshCtFPX-AOztOGw:1xU6nw:sTzOZ2Qn_FA3qtjSgtMuZ8Lg8cvEsH7wrcLznnWCU_Y', N'2026-12-03 18:24:16.150401');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES (N'pkrkz28jjn7av1zbuey7xvtqeet1o9qz', N'.eJxVjEEOwiAQRe_C2hCBtkNduvcMZJiZWtSAKW2iMd5dm3Sh2__efy8VcJnHsFSZQmJ1UEbtfreIdJW8Ar5gPhdNJc9TinpV9EarPhWW23Fz_wIj1vH7jmK7hsBacN60An1L7IQAiAaD3hs2SNg7T5GjGxw3llzL0JGF3sqwRqvUmkoO8rin6akO-_cHn7M_qQ:1xU6t9:pHGEmvR_vCHrM281Hc47sYG9POEacI2iiqnWoMNUEsY', N'2026-12-03 18:29:39.763125');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES (N'lgl6hpmt3umkqhpfc1r40g8v1r1kilse', N'.eJxVjMFugzAQRP9lzwjFdoiBY-_5Bmu9XoLTyEZeI7WK-PeAxKG9jd68mTc4XOvsVuHiYoARFDR_mUf65nQU4YnpkVvKqZbo20Npz1baew78-jrdfwczyryvPevblazW1vSqYzt0FAyTtUSTwr5XQSHhYHrywZvJhKsm0wV7I20HzdNxKiwSc3L8s8TyC-OlAZQolVNlN73WZ4bxDWcAKozFLfiICff1grJT1UDAmmUXt237AA3iVaM:1xVpdr:SD8kjbTfDxLSzlQY9W1PsmJXW3P28Oib8Qt5eU3DURU', N'2026-12-08 12:28:59.409826');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES (N't43aagwdnjm9j2o1v7bjflvx5r40gemu', N'.eJxVjDsOgzAQRO_iGiHZBgyU6XMGa727_IJshE2FuHuMRJF0o5k37xQWjjTZI_JuZxK9kKL47Rzgh_090AJ-DCUGn_bZlTdSPmss34F4fT3sn2CCOOW3Y9VUaJQyupU1m65G0ozGIA4S2laSBIROt-jI6UFTpVDXZBpUplM8ZCnEOSb2ie2wHksQ_SmeIHBn2O0G4-whkxvE3MpCEKQQM3hd1xeS-05m:1xVpd0:ljT8t92Bi33_8-Xr_YwSEhFEBsrVp3Dswvs_k_jcKDA', N'2026-12-08 12:28:06.982024');
INSERT INTO [django_session] ([session_key], [session_data], [expire_date]) VALUES (N'2p8rbnl8pgvojfb8kwsvbkala2yho069', N'.eJxVjEEOgyAQRe_CuiEBVNBl9z0DGWaGqjWQCK6Md68mLtrtf--_XXjY6ui3wqufSAxCicfvFgA_nC5AM6R3lphTXacgL0XetMhXJl6et_sXGKGM5zuw7hq0WlvjVMu2b5EMo7WIUYFzihQg9MZhoGCioUajacl2qG2vOZ5RKFOpnCr7uGxzFsN-HF_gWEBd:1xVpdE:msRO7SIKkkPvA_JEXKxgCBdp9UX1k31I4iruxPqD2RI', N'2026-12-08 12:28:20.010375');
GO

-- home_ajustessitio: 1 filas
SET IDENTITY_INSERT [home_ajustessitio] ON;
INSERT INTO [home_ajustessitio] ([id], [video_max_valor], [video_max_unidad], [techo_servidor_mb]) VALUES (1, 200, N'MB', 2048);
SET IDENTITY_INSERT [home_ajustessitio] OFF;
DECLARE @max_home_ajustessitio BIGINT; SELECT @max_home_ajustessitio = ISNULL(MAX([id]), 0) FROM [home_ajustessitio];
IF @max_home_ajustessitio > 0 DBCC CHECKIDENT (N'dbo.home_ajustessitio', RESEED, @max_home_ajustessitio);
GO

-- home_citystat: 3 filas
SET IDENTITY_INSERT [home_citystat] ON;
INSERT INTO [home_citystat] ([id], [sort_order], [city], [routes], [teachers], [students], [theme], [page_id]) VALUES (1, NULL, N'Ushuaia', 3, 14, 52, N'game', 3);
INSERT INTO [home_citystat] ([id], [sort_order], [city], [routes], [teachers], [students], [theme], [page_id]) VALUES (2, NULL, N'Tolhuin', 1, 6, 51, N'bio', 3);
INSERT INTO [home_citystat] ([id], [sort_order], [city], [routes], [teachers], [students], [theme], [page_id]) VALUES (3, NULL, N'Río Grande', 3, 36, 261, N'data', 3);
SET IDENTITY_INSERT [home_citystat] OFF;
DECLARE @max_home_citystat BIGINT; SELECT @max_home_citystat = ISNULL(MAX([id]), 0) FROM [home_citystat];
IF @max_home_citystat > 0 DBCC CHECKIDENT (N'dbo.home_citystat', RESEED, @max_home_citystat);
GO

-- home_consulta: 3 filas
SET IDENTITY_INSERT [home_consulta] ON;
INSERT INTO [home_consulta] ([id], [nombre], [ciudad], [email], [institucion], [mensaje], [creada], [leida]) VALUES (1, N'Docente de prueba', N'Ushuaia', N'consulta@aif.gob.ar', N'Colegio Provincial Kloketen', N'Solicito informacion sobre el formulario de Vinculacion Educativa.', N'2026-11-19 18:53:23.205813', 0);
INSERT INTO [home_consulta] ([id], [nombre], [ciudad], [email], [institucion], [mensaje], [creada], [leida]) VALUES (2, N'Administrador', N'Tolhuin', N'bogarin1983@gmail.com', N'asds', N'asdasd', N'2026-11-19 18:53:31.996053', 0);
INSERT INTO [home_consulta] ([id], [nombre], [ciudad], [email], [institucion], [mensaje], [creada], [leida]) VALUES (3, N'php basico', N'Río Grande', N'bogarin1983@gmail.com', N'asds', N'demoooooooo', N'2026-11-19 18:53:58.488200', 0);
SET IDENTITY_INSERT [home_consulta] OFF;
DECLARE @max_home_consulta BIGINT; SELECT @max_home_consulta = ISNULL(MAX([id]), 0) FROM [home_consulta];
IF @max_home_consulta > 0 DBCC CHECKIDENT (N'dbo.home_consulta', RESEED, @max_home_consulta);
GO

-- home_contenidopage: 0 filas

-- home_descubrimaspage: 1 filas
SET IDENTITY_INSERT [home_descubrimaspage] ON;
INSERT INTO [home_descubrimaspage] ([page_ptr_id], [intro], [cuerpo], [imagen_id]) VALUES (7, N'Un espacio digital para integrar, organizar y compartir propuestas educativas innovadoras en Ushuaia, Tolhuin y Río Grande.', N'<h2>El programa</h2><p>Rutas Pedagógicas articula ciencia, tecnología y creatividad en las aulas fueguinas. Acompañamos a docentes y estudiantes en tres ejes: Industria del Videojuego, Ciencia de Datos e Inteligencia Artificial, y Biotecnología y Bioeconomía.</p><h2>Qué vas a encontrar</h2><p>En cada ruta hay una progresión por nivel, materiales de apoyo y un recorrido para sumar a tu escuela. El contenido de esta sección se edita desde el panel de administración, sin cambiar el código del sitio.</p><h2>Cómo participar</h2><p>Completá el <a href="/#contacto">formulario de Vinculación Educativa</a> o escribinos a rutaspedagogicas@aif.gob.ar. También podés seguir el trabajo territorial en Instagram.</p>', NULL);
SET IDENTITY_INSERT [home_descubrimaspage] OFF;
DECLARE @max_home_descubrimaspage BIGINT; SELECT @max_home_descubrimaspage = ISNULL(MAX([page_ptr_id]), 0) FROM [home_descubrimaspage];
IF @max_home_descubrimaspage > 0 DBCC CHECKIDENT (N'dbo.home_descubrimaspage', RESEED, @max_home_descubrimaspage);
GO

-- home_explorarbloque: 2 filas
SET IDENTITY_INSERT [home_explorarbloque] ON;
INSERT INTO [home_explorarbloque] ([id], [sort_order], [titulo], [texto], [enlace], [enlace_texto], [imagen_id], [page_id]) VALUES (1, NULL, N'Territorio', N'<p>El programa se desarrolla en Ushuaia, Tolhuin y Río Grande, con sedes en Fábrica de Talentos e I.P.R.A.</p>', N'/#escuelas', N'Ver escuelas participantes', NULL, 7);
INSERT INTO [home_explorarbloque] ([id], [sort_order], [titulo], [texto], [enlace], [enlace_texto], [imagen_id], [page_id]) VALUES (2, NULL, N'Biblioteca y campus', N'<p>Manuales, guías y aulas virtuales complementan el trabajo en cada ruta.</p>', N'/#biblioteca', N'Ir a la biblioteca', NULL, 7);
SET IDENTITY_INSERT [home_explorarbloque] OFF;
DECLARE @max_home_explorarbloque BIGINT; SELECT @max_home_explorarbloque = ISNULL(MAX([id]), 0) FROM [home_explorarbloque];
IF @max_home_explorarbloque > 0 DBCC CHECKIDENT (N'dbo.home_explorarbloque', RESEED, @max_home_explorarbloque);
GO

-- home_galleryitem: 6 filas
SET IDENTITY_INSERT [home_galleryitem] ON;
INSERT INTO [home_galleryitem] ([id], [sort_order], [badge], [title], [caption], [theme], [image_id], [page_id]) VALUES (1, NULL, N'Ilustración IA · Ruta Verde', N'Laboratorio de Biotecnología Austral', N'Representación conceptual sobre exploración científica de turberas y ecosistemas fueguinos.', N'bio', NULL, 3);
INSERT INTO [home_galleryitem] ([id], [sort_order], [badge], [title], [caption], [theme], [image_id], [page_id]) VALUES (2, NULL, N'Ilustración IA · Ruta Azul', N'Ciencia de Datos e IA en el Fin del Mundo', N'Visualización sobre análisis de datos climáticos y aprendizaje automático en aulas de TDF.', N'data', NULL, 3);
INSERT INTO [home_galleryitem] ([id], [sort_order], [badge], [title], [caption], [theme], [image_id], [page_id]) VALUES (3, NULL, N'Ilustración IA · Ruta Rojo', N'Creación de Videojuegos Fueguinos', N'Arte conceptual sobre diseño interactivo y narrativa digital con identidad provincial.', N'game', NULL, 3);
INSERT INTO [home_galleryitem] ([id], [sort_order], [badge], [title], [caption], [theme], [image_id], [page_id]) VALUES (4, NULL, N'Espacio Foto · Ushuaia', N'Jornada en Escuelas de Ushuaia', N'Fotografía de los estudiantes o docentes trabajando en Ushuaia.', N'game', NULL, 3);
INSERT INTO [home_galleryitem] ([id], [sort_order], [badge], [title], [caption], [theme], [image_id], [page_id]) VALUES (5, NULL, N'Espacio Foto · Tolhuin', N'Encuentro en Escuelas de Tolhuin', N'Fotografía de la ruta pedagógica en el corazón de la isla.', N'bio', NULL, 3);
INSERT INTO [home_galleryitem] ([id], [sort_order], [badge], [title], [caption], [theme], [image_id], [page_id]) VALUES (6, NULL, N'Espacio Foto · Río Grande', N'Presentación en Escuelas de Río Grande', N'Fotografía de los talleres y exposiciones en Río Grande.', N'data', NULL, 3);
SET IDENTITY_INSERT [home_galleryitem] OFF;
DECLARE @max_home_galleryitem BIGINT; SELECT @max_home_galleryitem = ISNULL(MAX([id]), 0) FROM [home_galleryitem];
IF @max_home_galleryitem > 0 DBCC CHECKIDENT (N'dbo.home_galleryitem', RESEED, @max_home_galleryitem);
GO

-- home_heroslide: 3 filas
SET IDENTITY_INSERT [home_heroslide] ON;
INSERT INTO [home_heroslide] ([id], [sort_order], [title], [theme], [image_id], [page_id]) VALUES (1, NULL, N'Presentación de Videojuegos · Escuelas de Tierra del Fuego', N'game', NULL, 3);
INSERT INTO [home_heroslide] ([id], [sort_order], [title], [theme], [image_id], [page_id]) VALUES (2, NULL, N'Estudiantes Programando en Rutas Pedagógicas', N'data', NULL, 3);
INSERT INTO [home_heroslide] ([id], [sort_order], [title], [theme], [image_id], [page_id]) VALUES (3, NULL, N'Exposición de Ciencia de Datos e IA · Agencia de Innovación', N'bio', NULL, 3);
SET IDENTITY_INSERT [home_heroslide] OFF;
DECLARE @max_home_heroslide BIGINT; SELECT @max_home_heroslide = ISNULL(MAX([id]), 0) FROM [home_heroslide];
IF @max_home_heroslide > 0 DBCC CHECKIDENT (N'dbo.home_heroslide', RESEED, @max_home_heroslide);
GO

-- home_homepage: 1 filas
SET IDENTITY_INSERT [home_homepage] ON;
INSERT INTO [home_homepage] ([page_ptr_id], [aif_url], [alcance], [biblioteca_etiqueta], [biblioteca_texto], [biblioteca_titulo], [campus_texto], [campus_titulo], [campus_url], [carrusel_titulo], [contacto_texto], [contacto_titulo], [cta_texto], [cta_url], [email], [escuelas_etiqueta], [escuelas_texto], [escuelas_titulo], [eyebrow], [formulario_texto], [formulario_titulo], [galeria_etiqueta], [galeria_texto], [galeria_titulo], [headline], [headline_highlight], [headline_rest], [impacto_aviso], [impacto_etiqueta], [impacto_texto], [impacto_titulo], [informe_id], [instagram_titulo], [instagram_url], [intro], [mapa_ciudades], [mapa_titulo], [pitch_cuerpo], [pitch_texto], [pitch_titulo], [polos_url], [redes_titulo], [rutas_etiqueta], [rutas_texto], [rutas_titulo], [sede_rio_grande], [sede_ushuaia], [voces_etiqueta], [voces_titulo], [cta_pagina_id]) VALUES (3, N'https://www.aif.gob.ar/', N'Nivel Inicial, Nivel Primario, Nivel Secundario', N'Repositorio Pedagógico', N'<p>Explorá los materiales por eje temático (<strong>Verde</strong> Bioeconomía, <strong>Azul</strong> Ciencia de Datos e IA, <strong>Rojo</strong> Videojuegos) o accedé al Campus Virtual.</p>', N'Biblioteca de Manuales y Guías', N'Ingresá a las aulas virtuales, cursos activos y materiales complementarios de formación docente continua.', N'Campus Virtual de Educación Digital · Tierra del Fuego', N'https://educaciondigital.tierradelfuego.edu.ar/campusvirtual/login/index.php', N'Rutas Pedagógicas en Acción · Tierra del Fuego', N'Comunicate con nuestro equipo territorial o seguí las novedades de todas las escuelas en nuestro Instagram oficial.', N'Agencia de Innovación Fueguina', N'Descubrí más', N'', N'rutaspedagogicas@aif.gob.ar', N'Organización Territorial', N'<p>Explorá las instituciones educativas organizadas por localidad: <strong>Escuelas Ushuaia</strong>, <strong>Escuelas Tolhuin</strong> y <strong>Escuelas Río Grande</strong>.</p>', N'Escuelas Participantes por Ciudad', N'Programa Educativo Provincial · Tierra del Fuego', N'Completá los datos para sumar tu institución o consultar al equipo pedagógico.', N'Formulario de Vinculación Educativa', N'Registro Visual', N'Ilustraciones y espacios para las fotografías reales de las jornadas en Ushuaia, Tolhuin y Río Grande.', N'Galería de experiencias', N'Rutas Pedagógicas:', N'Un espacio digital', N'para integrar, organizar y compartir propuestas educativas innovadoras.', N'Capacitaciones en curso continuo', N'Estadísticas Oficiales Verificadas', N'<p>Consolidado territorial de rutas registradas, docentes y estudiantes participantes en Ushuaia, Tolhuin y Río Grande. <strong>Las instancias de capacitación y acompañamiento docente se encuentran en trabajo permanente y crecimiento activo</strong> en toda la provincia.</p>', N'Impacto real en Tierra del Fuego', NULL, N'Seguí el trabajo en las escuelas', N'https://www.instagram.com/aif.tdf/', N'<p>Articulamos ciencia, tecnología y creatividad en las aulas de <strong>Ushuaia, Tolhuin y Río Grande</strong>. Acompañamos a 56 docentes y 364 estudiantes en 7 rutas activas de construcción de conocimiento fueguino.</p>', N'Ushuaia · Tolhuin · Río Grande', N'Recorrido Territorial TDF', N'<h3>1. Problema</h3><p>Esto afecta a… y ocurre en…</p><h3>2. Solución</h3><p>Proponemos… porque…</p><h3>3. Producto</h3><p>Les mostramos cómo funciona…</p><h3>4. Viabilidad</h3><p>En TDF se aplica porque…</p><h3>5. Impacto</h3><p>Con esto mejora… y se mide con…</p>', N'Estructura paso a paso y checklist previo para presentar los proyectos en Fábrica de Talentos e I.P.R.A.', N'Guía de Pitch: Cómo defender tu investigación en 5 minutos', N'https://polos.aif.gob.ar/', N'¡SEGUINOS EN NUESTRAS REDES!', N'Ejes Pedagógicos Provinciales', N'<p>Propuestas articuladas para niveles <strong>Inicial, Primario y Secundario</strong> con acompañamiento de la Agencia de Innovación Fueguina.</p>', N'Las 3 Rutas Temáticas', N'I.P.R.A. · Perito Moreno 168', N'Fábrica de Talentos · Av. Maipú 1255', N'Territorio', N'Voces del territorio', 7);
SET IDENTITY_INSERT [home_homepage] OFF;
DECLARE @max_home_homepage BIGINT; SELECT @max_home_homepage = ISNULL(MAX([page_ptr_id]), 0) FROM [home_homepage];
IF @max_home_homepage > 0 DBCC CHECKIDENT (N'dbo.home_homepage', RESEED, @max_home_homepage);
GO

-- home_metric: 4 filas
SET IDENTITY_INSERT [home_metric] ON;
INSERT INTO [home_metric] ([id], [sort_order], [value], [label], [detail], [theme], [icon], [page_id]) VALUES (1, NULL, 7, N'Rutas registradas', N'3 en Ushuaia · 1 en Tolhuin · 3 en Río Grande · En expansión', N'game', N'ph-map-pin-line', 3);
INSERT INTO [home_metric] ([id], [sort_order], [value], [label], [detail], [theme], [icon], [page_id]) VALUES (2, NULL, 56, N'Docentes en capacitación', N'14 en Ushuaia · 6 en Tolhuin · 36 en Río Grande · Formación continua', N'data', N'ph-chalkboard-teacher', 3);
INSERT INTO [home_metric] ([id], [sort_order], [value], [label], [detail], [theme], [icon], [page_id]) VALUES (3, NULL, 364, N'Estudiantes protagonistas', N'52 en Ushuaia · 51 en Tolhuin · 261 en Río Grande · Talleres activos', N'game', N'ph-student', 3);
INSERT INTO [home_metric] ([id], [sort_order], [value], [label], [detail], [theme], [icon], [page_id]) VALUES (4, NULL, 420, N'Total participantes', N'Cifras en actualización permanente en toda la provincia', N'bio', N'ph-users-four', 3);
SET IDENTITY_INSERT [home_metric] OFF;
DECLARE @max_home_metric BIGINT; SELECT @max_home_metric = ISNULL(MAX([id]), 0) FROM [home_metric];
IF @max_home_metric > 0 DBCC CHECKIDENT (N'dbo.home_metric', RESEED, @max_home_metric);
GO

-- home_resource: 6 filas
SET IDENTITY_INSERT [home_resource] ON;
INSERT INTO [home_resource] ([id], [sort_order], [title], [level], [route], [kind], [description], [theme], [document_id], [page_id]) VALUES (1, NULL, N'Manual Docente: Introducción a la Biotecnología Fueguina', N'Primario', N'Biotecnología', N'Manual PDF · 42 págs.', N'Secuencias experimentales seguras para realizar en el aula con recursos locales.', N'bio', NULL, 3);
INSERT INTO [home_resource] ([id], [sort_order], [title], [level], [route], [kind], [description], [theme], [document_id], [page_id]) VALUES (2, NULL, N'Cuadernillo de Ciencia de Datos e IA Ética en el Aula', N'Secundario', N'Ciencia de Datos', N'Guía Metodológica · 56 págs.', N'Actividades prácticas con datasets provinciales y talleres de pensamiento crítico.', N'data', NULL, 3);
INSERT INTO [home_resource] ([id], [sort_order], [title], [level], [route], [kind], [description], [theme], [document_id], [page_id]) VALUES (3, NULL, N'Taller de Diseño Narrativo y Videojuegos Desenchufados', N'Inicial', N'Videojuegos', N'Kit Didáctico · Imprimible', N'Tarjetas de secuencias lógicas y dinámicas lúdicas sin necesidad de pantallas.', N'game', NULL, 3);
INSERT INTO [home_resource] ([id], [sort_order], [title], [level], [route], [kind], [description], [theme], [document_id], [page_id]) VALUES (4, NULL, N'Plantilla de Planificación Interdisciplinaria por Rutas', N'Secundario', N'Transversal', N'Plantilla Editable', N'Matriz para articular espacios curriculares y evaluar competencias digitales.', N'neutral', NULL, 3);
INSERT INTO [home_resource] ([id], [sort_order], [title], [level], [route], [kind], [description], [theme], [document_id], [page_id]) VALUES (5, NULL, N'Primeros Pasos en Programación Creativa con Bloques', N'Primario', N'Videojuegos', N'Guía Paso a Paso', N'Proyectos guiados para crear trivias y juegos sobre geografía de Tierra del Fuego.', N'game', NULL, 3);
INSERT INTO [home_resource] ([id], [sort_order], [title], [level], [route], [kind], [description], [theme], [document_id], [page_id]) VALUES (6, NULL, N'Exploradores de la Naturaleza Austral: Bitácora Inicial', N'Inicial', N'Biotecnología', N'Cuaderno de Campo', N'Propuestas de indagación ambiental adaptadas a salas de 4 y 5 años.', N'bio', NULL, 3);
SET IDENTITY_INSERT [home_resource] OFF;
DECLARE @max_home_resource BIGINT; SELECT @max_home_resource = ISNULL(MAX([id]), 0) FROM [home_resource];
IF @max_home_resource > 0 DBCC CHECKIDENT (N'dbo.home_resource', RESEED, @max_home_resource);
GO

-- home_route: 3 filas
SET IDENTITY_INSERT [home_route] ON;
INSERT INTO [home_route] ([id], [sort_order], [code], [title], [subtitle], [summary], [theme], [icon], [external_url], [page_id], [pagina_id]) VALUES (1, NULL, N'Ruta 01 · Rojo', N'Industria del Videojuego', N'Diseño, narrativa interactiva, arte digital y lógica de programación lúdica.', N'Transforma a los estudiantes en creadores de experiencias interactivas con identidad fueguina, abordando mecánicas y prototipado funcional.', N'game', N'ph-game-controller', N'', 3, 4);
INSERT INTO [home_route] ([id], [sort_order], [code], [title], [subtitle], [summary], [theme], [icon], [external_url], [page_id], [pagina_id]) VALUES (2, NULL, N'Ruta 02 · Azul', N'Ciencia de Datos e Inteligencia Artificial', N'Análisis de información, visualización y uso ético de modelos de IA.', N'Promueve la alfabetización en datos reales de la provincia, el entrenamiento de modelos y la reflexión crítica sobre ética en la IA.', N'data', N'ph-cpu', N'', 3, 5);
INSERT INTO [home_route] ([id], [sort_order], [code], [title], [subtitle], [summary], [theme], [icon], [external_url], [page_id], [pagina_id]) VALUES (3, NULL, N'Ruta 03 · Verde', N'Biotecnología y Bioeconomía', N'Ciencias biológicas aplicadas a los recursos naturales y sostenibilidad fueguina.', N'Conecta el laboratorio escolar con los ecosistemas subantárticos, la turba, los bosques y el mar austral para idear soluciones sostenibles.', N'bio', N'ph-flask', N'', 3, 6);
SET IDENTITY_INSERT [home_route] OFF;
DECLARE @max_home_route BIGINT; SELECT @max_home_route = ISNULL(MAX([id]), 0) FROM [home_route];
IF @max_home_route > 0 DBCC CHECKIDENT (N'dbo.home_route', RESEED, @max_home_route);
GO

-- home_routelevel: 9 filas
SET IDENTITY_INSERT [home_routelevel] ON;
INSERT INTO [home_routelevel] ([id], [sort_order], [level], [description], [route_id]) VALUES (1, NULL, N'Nivel Inicial', N'Pensamiento computacional desenchufado, secuencias lógicas mediante juego corporal y creación de historias interactivas ilustradas.', 1);
INSERT INTO [home_routelevel] ([id], [sort_order], [level], [description], [route_id]) VALUES (2, NULL, N'Nivel Primario', N'Programación por bloques (Scratch), diseño de personajes inspirados en la fauna fueguina y mecánicas básicas de puntaje y niveles.', 1);
INSERT INTO [home_routelevel] ([id], [sort_order], [level], [description], [route_id]) VALUES (3, NULL, N'Nivel Secundario', N'Diseño de videojuegos 2D/3D, narrativa transmedia, arte pixel/vectorial, sonido y prototipado funcional con defensa en formato Pitch.', 1);
INSERT INTO [home_routelevel] ([id], [sort_order], [level], [description], [route_id]) VALUES (4, NULL, N'Nivel Inicial', N'Clasificación de objetos, reconocimiento de patrones visuales y comprensión temprana de cómo aprenden las máquinas a través del juego.', 2);
INSERT INTO [home_routelevel] ([id], [sort_order], [level], [description], [route_id]) VALUES (5, NULL, N'Nivel Primario', N'Recolección de datos del entorno escolar, gráficos visuales simples y entrenamiento de modelos de reconocimiento de imágenes y sonidos.', 2);
INSERT INTO [home_routelevel] ([id], [sort_order], [level], [description], [route_id]) VALUES (6, NULL, N'Nivel Secundario', N'Análisis de datasets reales de Tierra del Fuego (clima, energía, turismo), programación inicial en Python, visualización y debate ético sobre IA.', 2);
INSERT INTO [home_routelevel] ([id], [sort_order], [level], [description], [route_id]) VALUES (7, NULL, N'Nivel Inicial', N'Exploración sensorial de la naturaleza fueguina, germinación, observación con lupas y cuidado de los ecosistemas locales.', 3);
INSERT INTO [home_routelevel] ([id], [sort_order], [level], [description], [route_id]) VALUES (8, NULL, N'Nivel Primario', N'Experimentos de microbiología cotidiana (levaduras, compostaje), ciclos de la materia y aprovechamiento responsable de recursos naturales.', 3);
INSERT INTO [home_routelevel] ([id], [sort_order], [level], [description], [route_id]) VALUES (9, NULL, N'Nivel Secundario', N'Biotecnología aplicada a turberas, algas y bosques subantárticos; desarrollo de bioinsumos y proyectos de economía circular provincial.', 3);
SET IDENTITY_INSERT [home_routelevel] OFF;
DECLARE @max_home_routelevel BIGINT; SELECT @max_home_routelevel = ISNULL(MAX([id]), 0) FROM [home_routelevel];
IF @max_home_routelevel > 0 DBCC CHECKIDENT (N'dbo.home_routelevel', RESEED, @max_home_routelevel);
GO

-- home_rutabloque: 4 filas
SET IDENTITY_INSERT [home_rutabloque] ON;
INSERT INTO [home_rutabloque] ([id], [sort_order], [titulo], [texto], [enlace], [enlace_texto], [imagen_id], [page_id]) VALUES (1, NULL, N'Objetivos de aprendizaje', N'<ul><li>Diseñar personajes, escenarios y reglas de juego.</li><li>Traducir una idea en una mecánica jugable.</li><li>Presentar el prototipo en formato pitch.</li></ul>', N'', N'', NULL, 4);
INSERT INTO [home_rutabloque] ([id], [sort_order], [titulo], [texto], [enlace], [enlace_texto], [imagen_id], [page_id]) VALUES (2, NULL, N'Recursos y continuidad', N'<p>Los materiales de la biblioteca y el Campus Virtual complementan esta ruta. El contenido de esta página se puede actualizar desde el panel de administración.</p>', N'', N'', NULL, 4);
INSERT INTO [home_rutabloque] ([id], [sort_order], [titulo], [texto], [enlace], [enlace_texto], [imagen_id], [page_id]) VALUES (3, NULL, N'Objetivos de aprendizaje', N'<ul><li>Recolectar, ordenar y leer datos del entorno.</li><li>Visualizar información con gráficos claros.</li><li>Reflexionar sobre el uso ético de la inteligencia artificial.</li></ul>', N'', N'', NULL, 5);
INSERT INTO [home_rutabloque] ([id], [sort_order], [titulo], [texto], [enlace], [enlace_texto], [imagen_id], [page_id]) VALUES (4, NULL, N'Objetivos de aprendizaje', N'<ul><li>Observar y registrar el entorno natural local.</li><li>Experimentar con procesos biológicos seguros en el aula.</li><li>Diseñar ideas de aprovechamiento responsable de recursos.</li></ul>', N'', N'', NULL, 6);
SET IDENTITY_INSERT [home_rutabloque] OFF;
DECLARE @max_home_rutabloque BIGINT; SELECT @max_home_rutabloque = ISNULL(MAX([id]), 0) FROM [home_rutabloque];
IF @max_home_rutabloque > 0 DBCC CHECKIDENT (N'dbo.home_rutabloque', RESEED, @max_home_rutabloque);
GO

-- home_rutanivel: 9 filas
SET IDENTITY_INSERT [home_rutanivel] ON;
INSERT INTO [home_rutanivel] ([id], [sort_order], [level], [description], [page_id]) VALUES (1, NULL, N'Nivel Inicial', N'Pensamiento computacional desenchufado, secuencias lógicas mediante juego corporal y creación de historias interactivas ilustradas.', 4);
INSERT INTO [home_rutanivel] ([id], [sort_order], [level], [description], [page_id]) VALUES (2, NULL, N'Nivel Primario', N'Programación por bloques (Scratch), diseño de personajes inspirados en la fauna fueguina y mecánicas básicas de puntaje y niveles.', 4);
INSERT INTO [home_rutanivel] ([id], [sort_order], [level], [description], [page_id]) VALUES (3, NULL, N'Nivel Secundario', N'Diseño de videojuegos 2D/3D, narrativa transmedia, arte pixel/vectorial, sonido y prototipado funcional con defensa en formato Pitch.', 4);
INSERT INTO [home_rutanivel] ([id], [sort_order], [level], [description], [page_id]) VALUES (4, NULL, N'Nivel Inicial', N'Clasificación de objetos, reconocimiento de patrones visuales y comprensión temprana de cómo aprenden las máquinas a través del juego.', 5);
INSERT INTO [home_rutanivel] ([id], [sort_order], [level], [description], [page_id]) VALUES (5, NULL, N'Nivel Primario', N'Recolección de datos del entorno escolar, gráficos visuales simples y entrenamiento de modelos de reconocimiento de imágenes y sonidos.', 5);
INSERT INTO [home_rutanivel] ([id], [sort_order], [level], [description], [page_id]) VALUES (6, NULL, N'Nivel Secundario', N'Análisis de datasets reales de Tierra del Fuego (clima, energía, turismo), programación inicial en Python, visualización y debate ético sobre IA.', 5);
INSERT INTO [home_rutanivel] ([id], [sort_order], [level], [description], [page_id]) VALUES (7, NULL, N'Nivel Inicial', N'Exploración sensorial de la naturaleza fueguina, germinación, observación con lupas y cuidado de los ecosistemas locales.', 6);
INSERT INTO [home_rutanivel] ([id], [sort_order], [level], [description], [page_id]) VALUES (8, NULL, N'Nivel Primario', N'Experimentos de microbiología cotidiana (levaduras, compostaje), ciclos de la materia y aprovechamiento responsable de recursos naturales.', 6);
INSERT INTO [home_rutanivel] ([id], [sort_order], [level], [description], [page_id]) VALUES (9, NULL, N'Nivel Secundario', N'Biotecnología aplicada a turberas, algas y bosques subantárticos; desarrollo de bioinsumos y proyectos de economía circular provincial.', 6);
SET IDENTITY_INSERT [home_rutanivel] OFF;
DECLARE @max_home_rutanivel BIGINT; SELECT @max_home_rutanivel = ISNULL(MAX([id]), 0) FROM [home_rutanivel];
IF @max_home_rutanivel > 0 DBCC CHECKIDENT (N'dbo.home_rutanivel', RESEED, @max_home_rutanivel);
GO

-- home_rutatematicapage: 3 filas
SET IDENTITY_INSERT [home_rutatematicapage] ON;
INSERT INTO [home_rutatematicapage] ([page_ptr_id], [code], [subtitle], [summary], [theme], [icon], [cuerpo], [enlace_externo], [enlace_externo_texto]) VALUES (4, N'Ruta 01 · Rojo', N'Diseño, narrativa interactiva, arte digital y lógica de programación lúdica.', N'Transforma a los estudiantes en creadores de experiencias interactivas con identidad fueguina, abordando mecánicas y prototipado funcional.', N'game', N'ph-game-controller', N'<h2>Qué propone esta ruta</h2><p>La ruta de Industria del Videojuego invita a las escuelas a diseñar juegos, historias y prototipos con identidad de Tierra del Fuego. El trabajo articula arte digital, narrativa, sonido y pensamiento computacional.</p><h2>Cómo se trabaja</h2><p>Los equipos avanzan desde el juego desenchufado hasta el prototipo funcional. Cada nivel suma herramientas, pero el eje es el mismo: crear, probar y defender una idea propia.</p>', N'', N'Abrir versión original');
INSERT INTO [home_rutatematicapage] ([page_ptr_id], [code], [subtitle], [summary], [theme], [icon], [cuerpo], [enlace_externo], [enlace_externo_texto]) VALUES (5, N'Ruta 02 · Azul', N'Análisis de información, visualización y uso ético de modelos de IA.', N'Promueve la alfabetización en datos reales de la provincia, el entrenamiento de modelos y la reflexión crítica sobre ética en la IA.', N'data', N'ph-cpu', N'<h2>Qué propone esta ruta</h2><p>La ruta de Ciencia de Datos e Inteligencia Artificial acerca a estudiantes y docentes al análisis de información real de Tierra del Fuego: clima, energía, turismo y datos escolares.</p><h2>Enfoque ético</h2><p>Además de visualizar y entrenar modelos, cada propuesta incluye un espacio para preguntarse qué datos se usan, para qué y con qué cuidado.</p>', N'', N'Abrir versión original');
INSERT INTO [home_rutatematicapage] ([page_ptr_id], [code], [subtitle], [summary], [theme], [icon], [cuerpo], [enlace_externo], [enlace_externo_texto]) VALUES (6, N'Ruta 03 · Verde', N'Ciencias biológicas aplicadas a los recursos naturales y sostenibilidad fueguina.', N'Conecta el laboratorio escolar con los ecosistemas subantárticos, la turba, los bosques y el mar austral para idear soluciones sostenibles.', N'bio', N'ph-flask', N'<h2>Qué propone esta ruta</h2><p>La ruta de Biotecnología y Bioeconomía vincula el aula con los ecosistemas de la provincia: turberas, bosques, algas y el mar austral. El objetivo es observar, experimentar y diseñar soluciones sostenibles.</p><h2>Del laboratorio al territorio</h2><p>Las propuestas van de la exploración sensorial a proyectos de bioinsumos y economía circular, siempre con cuidado del entorno fueguino.</p>', N'', N'Abrir versión original');
SET IDENTITY_INSERT [home_rutatematicapage] OFF;
DECLARE @max_home_rutatematicapage BIGINT; SELECT @max_home_rutatematicapage = ISNULL(MAX([page_ptr_id]), 0) FROM [home_rutatematicapage];
IF @max_home_rutatematicapage > 0 DBCC CHECKIDENT (N'dbo.home_rutatematicapage', RESEED, @max_home_rutatematicapage);
GO

-- home_school: 7 filas
SET IDENTITY_INSERT [home_school] ON;
INSERT INTO [home_school] ([id], [sort_order], [name], [city], [level], [route], [teachers], [page_id]) VALUES (1, NULL, N'Colegio Provincial Kloketén', N'Ushuaia', N'Secundario', N'Ciencia de Datos e IA', N'Equipo Docente Ushuaia · Ruta 1', 3);
INSERT INTO [home_school] ([id], [sort_order], [name], [city], [level], [route], [teachers], [page_id]) VALUES (2, NULL, N'Escuela Provincial N° 1 Domingo Faustino Sarmiento', N'Ushuaia', N'Primario', N'Biotecnología y Bioeconomía', N'Equipo Docente Ushuaia · Ruta 2', 3);
INSERT INTO [home_school] ([id], [sort_order], [name], [city], [level], [route], [teachers], [page_id]) VALUES (3, NULL, N'Colegio Técnico Provincial Olga B. de Arko', N'Ushuaia', N'Secundario', N'Industria del Videojuego', N'Equipo Docente Ushuaia · Ruta 3', 3);
INSERT INTO [home_school] ([id], [sort_order], [name], [city], [level], [route], [teachers], [page_id]) VALUES (4, NULL, N'Colegio Provincial Ramón Alberto Trejo Noel', N'Tolhuin', N'Secundario', N'Biotecnología y Bioeconomía', N'Equipo Docente Tolhuin · Ruta 1', 3);
INSERT INTO [home_school] ([id], [sort_order], [name], [city], [level], [route], [teachers], [page_id]) VALUES (5, NULL, N'Colegio Provincial Dr. Ernesto Guevara', N'Río Grande', N'Secundario', N'Industria del Videojuego', N'Equipo Docente Río Grande · Ruta 1', 3);
INSERT INTO [home_school] ([id], [sort_order], [name], [city], [level], [route], [teachers], [page_id]) VALUES (6, NULL, N'Escuela Provincial N° 2 Dr. Benjamín Zorrilla', N'Río Grande', N'Primario', N'Ciencia de Datos e IA', N'Equipo Docente Río Grande · Ruta 2', 3);
INSERT INTO [home_school] ([id], [sort_order], [name], [city], [level], [route], [teachers], [page_id]) VALUES (7, NULL, N'Escuela Provincial N° 21 Provincias Unidas', N'Río Grande', N'Primario', N'Biotecnología y Bioeconomía', N'Equipo Docente Río Grande · Ruta 3', 3);
SET IDENTITY_INSERT [home_school] OFF;
DECLARE @max_home_school BIGINT; SELECT @max_home_school = ISNULL(MAX([id]), 0) FROM [home_school];
IF @max_home_school > 0 DBCC CHECKIDENT (N'dbo.home_school', RESEED, @max_home_school);
GO

-- home_sociallink: 6 filas
SET IDENTITY_INSERT [home_sociallink] ON;
INSERT INTO [home_sociallink] ([id], [sort_order], [label], [url], [icon], [page_id]) VALUES (1, NULL, N'@aif.tdf', N'https://www.facebook.com/aif.tdf', N'ph-fill ph-facebook-logo', 3);
INSERT INTO [home_sociallink] ([id], [sort_order], [label], [url], [icon], [page_id]) VALUES (2, NULL, N'@aif.tdf', N'https://www.instagram.com/aif.tdf', N'ph-bold ph-instagram-logo', 3);
INSERT INTO [home_sociallink] ([id], [sort_order], [label], [url], [icon], [page_id]) VALUES (3, NULL, N'@conocimientotdf', N'https://www.tiktok.com/@conocimientotdf', N'ph-fill ph-tiktok-logo', 3);
INSERT INTO [home_sociallink] ([id], [sort_order], [label], [url], [icon], [page_id]) VALUES (4, NULL, N'Polos Creativos', N'https://polos.aif.gob.ar/', N'ph ph-globe', 3);
INSERT INTO [home_sociallink] ([id], [sort_order], [label], [url], [icon], [page_id]) VALUES (5, NULL, N'Sitio Web AIF', N'https://www.aif.gob.ar/', N'ph ph-globe', 3);
INSERT INTO [home_sociallink] ([id], [sort_order], [label], [url], [icon], [page_id]) VALUES (6, NULL, N'Campus Virtual TDF', N'https://educaciondigital.tierradelfuego.edu.ar/campusvirtual/login/index.php', N'ph-bold ph-graduation-cap', 3);
SET IDENTITY_INSERT [home_sociallink] OFF;
DECLARE @max_home_sociallink BIGINT; SELECT @max_home_sociallink = ISNULL(MAX([id]), 0) FROM [home_sociallink];
IF @max_home_sociallink > 0 DBCC CHECKIDENT (N'dbo.home_sociallink', RESEED, @max_home_sociallink);
GO

-- home_testimonial: 3 filas
SET IDENTITY_INSERT [home_testimonial] ON;
INSERT INTO [home_testimonial] ([id], [sort_order], [category], [role], [author], [route], [theme], [quote], [page_id]) VALUES (1, NULL, N'docente', N'Directiva · Ushuaia', N'Prof. Marta Villarroel', N'Biotecnología y Bioeconomía', N'bio', N'Rutas Pedagógicas nos dio un marco ordenado y riguroso para que docentes con años de trayectoria nos animemos a experimentar con biotecnología aplicada al entorno fueguino.', 3);
INSERT INTO [home_testimonial] ([id], [sort_order], [category], [role], [author], [route], [theme], [quote], [page_id]) VALUES (2, NULL, N'docente', N'Docente · Río Grande', N'Prof. Carlos Oyarzún', N'Ciencia de Datos e IA', N'data', N'Con 36 docentes y más de 260 estudiantes participando en Río Grande, logramos que los chicos analicen datos reales de nuestra ciudad y los defiendan con orgullo.', 3);
INSERT INTO [home_testimonial] ([id], [sort_order], [category], [role], [author], [route], [theme], [quote], [page_id]) VALUES (3, NULL, N'estudiante', N'Estudiante · Tolhuin', N'Valentina Ríos', N'Industria del Videojuego', N'game', N'Trabajar en equipo desde nuestra escuela en Tolhuin y compartir proyectos con chicos de toda la provincia fue una experiencia única que nos motiva a seguir creando.', 3);
SET IDENTITY_INSERT [home_testimonial] OFF;
DECLARE @max_home_testimonial BIGINT; SELECT @max_home_testimonial = ISNULL(MAX([id]), 0) FROM [home_testimonial];
IF @max_home_testimonial > 0 DBCC CHECKIDENT (N'dbo.home_testimonial', RESEED, @max_home_testimonial);
GO

-- taggit_tag: 0 filas

-- taggit_taggeditem: 0 filas

-- wagtailadmin_admin: 0 filas

-- wagtailadmin_editingsession: 1 filas
SET IDENTITY_INSERT [wagtailadmin_editingsession] ON;
INSERT INTO [wagtailadmin_editingsession] ([id], [object_id], [last_seen_at], [content_type_id], [user_id], [is_editing]) VALUES (2, N'3', N'2026-11-19 18:35:51.508713', 1, 1, 0);
SET IDENTITY_INSERT [wagtailadmin_editingsession] OFF;
DECLARE @max_wagtailadmin_editingsession BIGINT; SELECT @max_wagtailadmin_editingsession = ISNULL(MAX([id]), 0) FROM [wagtailadmin_editingsession];
IF @max_wagtailadmin_editingsession > 0 DBCC CHECKIDENT (N'dbo.wagtailadmin_editingsession', RESEED, @max_wagtailadmin_editingsession);
GO

-- wagtailadmin_formstate: 2 filas
SET IDENTITY_INSERT [wagtailadmin_formstate] ON;
INSERT INTO [wagtailadmin_formstate] ([id], [data], [object_id], [parent_object_id], [last_updated_at], [content_type_id], [user_id]) VALUES (1, N'csrfmiddlewaretoken=ztK5IDUBjIenrAWClJDywP3KrQbd84Bwwz480s7YrDZmFS9rG2nMGPukTO73juEd&next=&loaded_revision_id=10&loaded_revision_created_at=2026-11-19T19%3A04%3A48.170532%2B00%3A00&title=Industria+del+Videojuego&code=Ruta+01+%C2%B7+Rojo&subtitle=Dise%C3%B1o%2C+narrativa+interactiva%2C+arte+digital+y+l%C3%B3gica+de+programaci%C3%B3n+l%C3%BAdica.&summary=Transforma+a+los+estudiantes+en+creadores+de+experiencias+interactivas+con+identidad+fueguina%2C+abordando+mec%C3%A1nicas+y+prototipado+funcional.%21%21%21%21%21%21%21%21%21%21%21&theme=game&icon=ph-game-controller&cuerpo=%7B%22blocks%22%3A%5B%7B%22key%22%3A%22sc1iy%22%2C%22text%22%3A%22Qu%C3%A9+propone+esta+ruta%22%2C%22type%22%3A%22header-two%22%2C%22depth%22%3A0%2C%22inlineStyleRanges%22%3A%5B%5D%2C%22entityRanges%22%3A%5B%5D%2C%22data%22%3A%7B%7D%7D%2C%7B%22key%22%3A%22p497j%22%2C%22text%22%3A%22La+ruta+de+Industria+del+Videojuego+invita+a+las+escuelas+a+dise%C3%B1ar+juegos%2C+historias+y+prototipos+con+identidad+de+Tierra+del+Fuego.+El+trabajo+articula+arte+digital%2C+narrativa%2C+sonido+y+pensamiento+computacional.%22%2C%22type%22%3A%22unstyled%22%2C%22depth%22%3A0%2C%22inlineStyleRanges%22%3A%5B%5D%2C%22entityRanges%22%3A%5B%5D%2C%22data%22%3A%7B%7D%7D%2C%7B%22key%22%3A%22d98f7%22%2C%22text%22%3A%22C%C3%B3mo+se+trabaja%22%2C%22type%22%3A%22header-two%22%2C%22depth%22%3A0%2C%22inlineStyleRanges%22%3A%5B%5D%2C%22entityRanges%22%3A%5B%5D%2C%22data%22%3A%7B%7D%7D%2C%7B%22key%22%3A%22qeahs%22%2C%22text%22%3A%22Los+equipos+avanzan+desde+el+juego+desenchufado+hasta+el+prototipo+funcional.+Cada+nivel+suma+herramientas%2C+pero+el+eje+es+el+mismo%3A+crear%2C+probar+y+defender+una+idea+propia.%22%2C%22type%22%3A%22unstyled%22%2C%22depth%22%3A0%2C%22inlineStyleRanges%22%3A%5B%5D%2C%22entityRanges%22%3A%5B%5D%2C%22data%22%3A%7B%7D%7D%5D%2C%22entityMap%22%3A%7B%7D%7D&niveles-TOTAL_FORMS=3&niveles-INITIAL_FORMS=3&niveles-MIN_NUM_FORMS=0&niveles-MAX_NUM_FORMS=1000&niveles-0-level=Nivel+Inicial&niveles-0-description=Pensamiento+computacional+desenchufado%2C+secuencias+l%C3%B3gicas+mediante+juego+corporal+y+creaci%C3%B3n+de+historias+interactivas+ilustradas.&niveles-0-id=1&niveles-0-ORDER=1&niveles-0-DELETE=&niveles-1-level=Nivel+Primario&niveles-1-description=Programaci%C3%B3n+por+bloques+%28Scratch%29%2C+dise%C3%B1o+de+personajes+inspirados+en+la+fauna+fueguina+y+mec%C3%A1nicas+b%C3%A1sicas+de+puntaje+y+niveles.&niveles-1-id=2&niveles-1-ORDER=2&niveles-1-DELETE=&niveles-2-level=Nivel+Secundario&niveles-2-description=Dise%C3%B1o+de+videojuegos+2D%2F3D%2C+narrativa+transmedia%2C+arte+pixel%2Fvectorial%2C+sonido+y+prototipado+funcional+con+defensa+en+formato+Pitch.&niveles-2-id=3&niveles-2-ORDER=3&niveles-2-DELETE=&bloques-TOTAL_FORMS=2&bloques-INITIAL_FORMS=2&bloques-MIN_NUM_FORMS=0&bloques-MAX_NUM_FORMS=1000&bloques-0-titulo=Objetivos+de+aprendizaje&bloques-0-texto=%7B%22blocks%22%3A%5B%7B%22key%22%3A%226qipv%22%2C%22text%22%3A%22Dise%C3%B1ar+personajes%2C+escenarios+y+reglas+de+juego.%22%2C%22type%22%3A%22unordered-list-item%22%2C%22depth%22%3A0%2C%22inlineStyleRanges%22%3A%5B%5D%2C%22entityRanges%22%3A%5B%5D%2C%22data%22%3A%7B%7D%7D%2C%7B%22key%22%3A%2273s93%22%2C%22text%22%3A%22Traducir+una+idea+en+una+mec%C3%A1nica+jugable.%22%2C%22type%22%3A%22unordered-list-item%22%2C%22depth%22%3A0%2C%22inlineStyleRanges%22%3A%5B%5D%2C%22entityRanges%22%3A%5B%5D%2C%22data%22%3A%7B%7D%7D%2C%7B%22key%22%3A%22fsazh%22%2C%22text%22%3A%22Presentar+el+prototipo+en+formato+pitch.%22%2C%22type%22%3A%22unordered-list-item%22%2C%22depth%22%3A0%2C%22inlineStyleRanges%22%3A%5B%5D%2C%22entityRanges%22%3A%5B%5D%2C%22data%22%3A%7B%7D%7D%5D%2C%22entityMap%22%3A%7B%7D%7D&bloques-0-enlace=&bloques-0-enlace_texto=&bloques-0-imagen=&bloques-0-id=1&bloques-0-ORDER=1&bloques-0-DELETE=&bloques-1-titulo=Recursos+y+continuidad&bloques-1-texto=%7B%22blocks%22%3A%5B%7B%22key%22%3A%22eltw0%22%2C%22text%22%3A%22Los+materiales+de+la+biblioteca+y+el+Campus+Virtual+complementan+esta+ruta.+El+contenido+de+esta+p%C3%A1gina+se+puede+actualizar+desde+el+panel+de+administraci%C3%B3n.%22%2C%22type%22%3A%22unstyled%22%2C%22depth%22%3A0%2C%22inlineStyleRanges%22%3A%5B%5D%2C%22entityRanges%22%3A%5B%5D%2C%22data%22%3A%7B%7D%7D%5D%2C%22entityMap%22%3A%7B%7D%7D&bloques-1-enlace=&bloques-1-enlace_texto=&bloques-1-imagen=&bloques-1-id=2&bloques-1-ORDER=2&bloques-1-DELETE=&enlace_externo=https%3A%2F%2Fscript.google.com%2Fmacros%2Fs%2FAKfycbyCctCBuH-sWa46nHw8gi1xqv3E-fBqFDpWrrd6nkgZbiCQ076z2pHL8-V1r3hLDPu9%2Fexec&enlace_externo_texto=Abrir+versi%C3%B3n+original&slug=industria-del-videojuego&seo_title=Industria+del+Videojuego+%7C+Rutas+Pedag%C3%B3gicas&search_description=Transforma+a+los+estudiantes+en+creadores+de+experiencias+interactivas+con+identidad+fueguina%2C+abordando+mec%C3%A1nicas+y+prototipado+funcional.&comments-TOTAL_FORMS=0&comments-INITIAL_FORMS=0&comments-MIN_NUM_FORMS=0&comments-MAX_NUM_FORMS=&go_live_at=&expire_at=', N'4', N'', N'2026-11-19 19:06:13.364835', 60, 1);
INSERT INTO [wagtailadmin_formstate] ([id], [data], [object_id], [parent_object_id], [last_updated_at], [content_type_id], [user_id]) VALUES (2, N'comment_notifications=on&csrfmiddlewaretoken=7EYAWPc3V3ndWXVazN9RCutFoKM8fmmX4KiDeEpq3Y8caf8ZU6T5MuUfQIIYqMpE&next=&title=Placeholder+title&code=Ruta+01&subtitle=&summary=&theme=game&icon=ph-game-controller&cuerpo=%7B%0D%0A++++%22blocks%22%3A+%5B%0D%0A++++++++%7B%0D%0A++++++++++++%22key%22%3A+%22rlz0y%22%2C%0D%0A++++++++++++%22type%22%3A+%22unstyled%22%2C%0D%0A++++++++++++%22depth%22%3A+0%2C%0D%0A++++++++++++%22text%22%3A+%22%22%2C%0D%0A++++++++++++%22inlineStyleRanges%22%3A+%5B%5D%2C%0D%0A++++++++++++%22entityRanges%22%3A+%5B%5D%0D%0A++++++++%7D%0D%0A++++%5D%2C%0D%0A++++%22entityMap%22%3A+%7B%7D%0D%0A%7D&niveles-TOTAL_FORMS=0&niveles-INITIAL_FORMS=0&niveles-MIN_NUM_FORMS=0&niveles-MAX_NUM_FORMS=1000&bloques-TOTAL_FORMS=0&bloques-INITIAL_FORMS=0&bloques-MIN_NUM_FORMS=0&bloques-MAX_NUM_FORMS=1000&slug=5fec3063-801a-4e4e-b7c4-daaa204edf44&seo_title=&search_description=&comments-TOTAL_FORMS=0&comments-INITIAL_FORMS=0&comments-MIN_NUM_FORMS=0&comments-MAX_NUM_FORMS=&go_live_at=&expire_at=', N'', N'3', N'2026-11-19 19:23:13.957247', 60, 1);
SET IDENTITY_INSERT [wagtailadmin_formstate] OFF;
DECLARE @max_wagtailadmin_formstate BIGINT; SELECT @max_wagtailadmin_formstate = ISNULL(MAX([id]), 0) FROM [wagtailadmin_formstate];
IF @max_wagtailadmin_formstate > 0 DBCC CHECKIDENT (N'dbo.wagtailadmin_formstate', RESEED, @max_wagtailadmin_formstate);
GO

-- wagtailcore_apitoken: 0 filas

-- wagtailcore_collection: 1 filas
SET IDENTITY_INSERT [wagtailcore_collection] ON;
INSERT INTO [wagtailcore_collection] ([id], [path], [depth], [numchild], [name]) VALUES (1, N'0001', 1, 0, N'Root');
SET IDENTITY_INSERT [wagtailcore_collection] OFF;
DECLARE @max_wagtailcore_collection BIGINT; SELECT @max_wagtailcore_collection = ISNULL(MAX([id]), 0) FROM [wagtailcore_collection];
IF @max_wagtailcore_collection > 0 DBCC CHECKIDENT (N'dbo.wagtailcore_collection', RESEED, @max_wagtailcore_collection);
GO

-- wagtailcore_collectionviewrestriction: 0 filas

-- wagtailcore_collectionviewrestriction_groups: 0 filas

-- wagtailcore_comment: 0 filas

-- wagtailcore_commentreply: 0 filas

-- wagtailcore_groupapprovaltask: 1 filas
SET IDENTITY_INSERT [wagtailcore_groupapprovaltask] ON;
INSERT INTO [wagtailcore_groupapprovaltask] ([task_ptr_id]) VALUES (1);
SET IDENTITY_INSERT [wagtailcore_groupapprovaltask] OFF;
DECLARE @max_wagtailcore_groupapprovaltask BIGINT; SELECT @max_wagtailcore_groupapprovaltask = ISNULL(MAX([task_ptr_id]), 0) FROM [wagtailcore_groupapprovaltask];
IF @max_wagtailcore_groupapprovaltask > 0 DBCC CHECKIDENT (N'dbo.wagtailcore_groupapprovaltask', RESEED, @max_wagtailcore_groupapprovaltask);
GO

-- wagtailcore_groupapprovaltask_groups: 1 filas
SET IDENTITY_INSERT [wagtailcore_groupapprovaltask_groups] ON;
INSERT INTO [wagtailcore_groupapprovaltask_groups] ([id], [groupapprovaltask_id], [group_id]) VALUES (1, 1, 1);
SET IDENTITY_INSERT [wagtailcore_groupapprovaltask_groups] OFF;
DECLARE @max_wagtailcore_groupapprovaltask_groups BIGINT; SELECT @max_wagtailcore_groupapprovaltask_groups = ISNULL(MAX([id]), 0) FROM [wagtailcore_groupapprovaltask_groups];
IF @max_wagtailcore_groupapprovaltask_groups > 0 DBCC CHECKIDENT (N'dbo.wagtailcore_groupapprovaltask_groups', RESEED, @max_wagtailcore_groupapprovaltask_groups);
GO

-- wagtailcore_groupcollectionpermission: 32 filas
SET IDENTITY_INSERT [wagtailcore_groupcollectionpermission] ON;
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (1, 1, 2, 110);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (2, 1, 1, 110);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (3, 1, 2, 111);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (4, 1, 1, 111);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (5, 1, 2, 113);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (6, 1, 1, 113);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (7, 1, 2, 114);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (8, 1, 1, 114);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (9, 1, 2, 115);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (10, 1, 1, 115);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (11, 1, 2, 117);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (12, 1, 1, 117);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (13, 1, 3, 114);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (14, 1, 3, 115);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (15, 1, 3, 110);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (16, 1, 3, 111);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (17, 1, 3, 113);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (18, 1, 3, 117);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (19, 1, 3, 116);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (20, 1, 3, 112);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (21, 1, 4, 114);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (22, 1, 4, 115);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (23, 1, 4, 110);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (24, 1, 4, 111);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (25, 1, 4, 113);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (26, 1, 4, 117);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (27, 1, 5, 114);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (28, 1, 5, 115);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (29, 1, 5, 110);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (30, 1, 5, 111);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (31, 1, 5, 113);
INSERT INTO [wagtailcore_groupcollectionpermission] ([id], [collection_id], [group_id], [permission_id]) VALUES (32, 1, 5, 117);
SET IDENTITY_INSERT [wagtailcore_groupcollectionpermission] OFF;
DECLARE @max_wagtailcore_groupcollectionpermission BIGINT; SELECT @max_wagtailcore_groupcollectionpermission = ISNULL(MAX([id]), 0) FROM [wagtailcore_groupcollectionpermission];
IF @max_wagtailcore_groupcollectionpermission > 0 DBCC CHECKIDENT (N'dbo.wagtailcore_groupcollectionpermission', RESEED, @max_wagtailcore_groupcollectionpermission);
GO

-- wagtailcore_grouppagepermission: 20 filas
SET IDENTITY_INSERT [wagtailcore_grouppagepermission] ON;
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (1, 1, 1, 70);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (2, 1, 1, 71);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (3, 1, 1, 76);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (4, 2, 1, 70);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (5, 2, 1, 71);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (6, 1, 1, 75);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (7, 1, 1, 77);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (8, 3, 1, 70);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (9, 3, 1, 71);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (10, 3, 1, 76);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (11, 3, 1, 75);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (12, 3, 1, 77);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (13, 3, 1, 72);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (14, 4, 1, 70);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (15, 4, 1, 71);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (16, 4, 1, 76);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (17, 4, 1, 75);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (18, 4, 1, 77);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (19, 5, 1, 70);
INSERT INTO [wagtailcore_grouppagepermission] ([id], [group_id], [page_id], [permission_id]) VALUES (20, 5, 1, 71);
SET IDENTITY_INSERT [wagtailcore_grouppagepermission] OFF;
DECLARE @max_wagtailcore_grouppagepermission BIGINT; SELECT @max_wagtailcore_grouppagepermission = ISNULL(MAX([id]), 0) FROM [wagtailcore_grouppagepermission];
IF @max_wagtailcore_grouppagepermission > 0 DBCC CHECKIDENT (N'dbo.wagtailcore_grouppagepermission', RESEED, @max_wagtailcore_grouppagepermission);
GO

-- wagtailcore_groupsitepermission: 0 filas

-- wagtailcore_locale: 1 filas
SET IDENTITY_INSERT [wagtailcore_locale] ON;
INSERT INTO [wagtailcore_locale] ([id], [language_code]) VALUES (1, N'en');
SET IDENTITY_INSERT [wagtailcore_locale] OFF;
DECLARE @max_wagtailcore_locale BIGINT; SELECT @max_wagtailcore_locale = ISNULL(MAX([id]), 0) FROM [wagtailcore_locale];
IF @max_wagtailcore_locale > 0 DBCC CHECKIDENT (N'dbo.wagtailcore_locale', RESEED, @max_wagtailcore_locale);
GO

-- wagtailcore_modellogentry: 0 filas

-- wagtailcore_page: 6 filas
SET IDENTITY_INSERT [wagtailcore_page] ON;
INSERT INTO [wagtailcore_page] ([id], [path], [depth], [numchild], [title], [slug], [live], [has_unpublished_changes], [url_path], [seo_title], [show_in_menus], [search_description], [go_live_at], [expire_at], [expired], [content_type_id], [owner_id], [locked], [latest_revision_created_at], [first_published_at], [live_revision_id], [last_published_at], [draft_title], [locked_at], [locked_by_id], [locale_id], [translation_key], [alias_of_id], [latest_revision_id]) VALUES (1, N'0001', 1, 1, N'Root', N'root', 1, 0, N'/', N'', 0, N'', NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, NULL, N'Root', NULL, NULL, 1, N'5e2d3023a8de4a888cb4969a4a19ce6f', NULL, NULL);
INSERT INTO [wagtailcore_page] ([id], [path], [depth], [numchild], [title], [slug], [live], [has_unpublished_changes], [url_path], [seo_title], [show_in_menus], [search_description], [go_live_at], [expire_at], [expired], [content_type_id], [owner_id], [locked], [latest_revision_created_at], [first_published_at], [live_revision_id], [last_published_at], [draft_title], [locked_at], [locked_by_id], [locale_id], [translation_key], [alias_of_id], [latest_revision_id]) VALUES (3, N'00010001', 2, 4, N'Rutas Pedagógicas', N'home', 1, 0, N'/home/', N'Rutas Pedagógicas | Agencia de Innovación Fueguina', 0, N'Programa educativo provincial de Tierra del Fuego. Rutas de videojuegos, ciencia de datos e IA, y biotecnología en Ushuaia, Tolhuin y Río Grande.', NULL, NULL, 0, 2, NULL, 0, N'2026-11-19 19:02:41.332793', N'2026-11-03 13:58:42.426377', 8, N'2026-11-19 19:02:41.459795', N'Rutas Pedagógicas', NULL, NULL, 1, N'b74334d34581440fa5b22fb369d79e12', NULL, 8);
INSERT INTO [wagtailcore_page] ([id], [path], [depth], [numchild], [title], [slug], [live], [has_unpublished_changes], [url_path], [seo_title], [show_in_menus], [search_description], [go_live_at], [expire_at], [expired], [content_type_id], [owner_id], [locked], [latest_revision_created_at], [first_published_at], [live_revision_id], [last_published_at], [draft_title], [locked_at], [locked_by_id], [locale_id], [translation_key], [alias_of_id], [latest_revision_id]) VALUES (4, N'000100010001', 3, 0, N'Industria del Videojuego', N'industria-del-videojuego', 1, 0, N'/home/industria-del-videojuego/', N'Industria del Videojuego | Rutas Pedagógicas', 0, N'Transforma a los estudiantes en creadores de experiencias interactivas con identidad fueguina, abordando mecánicas y prototipado funcional.', NULL, NULL, 0, 60, NULL, 0, N'2026-11-19 19:10:19.526510', N'2026-11-19 19:02:40.500387', 12, N'2026-11-19 19:10:19.713511', N'Industria del Videojuego', NULL, NULL, 1, N'f996c62bdce446b58781574d67d89ca0', NULL, 12);
INSERT INTO [wagtailcore_page] ([id], [path], [depth], [numchild], [title], [slug], [live], [has_unpublished_changes], [url_path], [seo_title], [show_in_menus], [search_description], [go_live_at], [expire_at], [expired], [content_type_id], [owner_id], [locked], [latest_revision_created_at], [first_published_at], [live_revision_id], [last_published_at], [draft_title], [locked_at], [locked_by_id], [locale_id], [translation_key], [alias_of_id], [latest_revision_id]) VALUES (5, N'000100010002', 3, 0, N'Ciencia de Datos e Inteligencia Artificial', N'ciencia-de-datos-e-inteligencia-artificial', 1, 0, N'/home/ciencia-de-datos-e-inteligencia-artificial/', N'Ciencia de Datos e Inteligencia Artificial | Rutas Pedagógicas', 0, N'Promueve la alfabetización en datos reales de la provincia, el entrenamiento de modelos y la reflexión crítica sobre ética en la IA.', NULL, NULL, 0, 60, NULL, 0, N'2026-11-19 19:02:40.672070', N'2026-11-19 19:02:40.711070', 5, N'2026-11-19 19:02:40.711070', N'Ciencia de Datos e Inteligencia Artificial', NULL, NULL, 1, N'0d32035c9897449ba14b546117fbfa83', NULL, 5);
INSERT INTO [wagtailcore_page] ([id], [path], [depth], [numchild], [title], [slug], [live], [has_unpublished_changes], [url_path], [seo_title], [show_in_menus], [search_description], [go_live_at], [expire_at], [expired], [content_type_id], [owner_id], [locked], [latest_revision_created_at], [first_published_at], [live_revision_id], [last_published_at], [draft_title], [locked_at], [locked_by_id], [locale_id], [translation_key], [alias_of_id], [latest_revision_id]) VALUES (6, N'000100010003', 3, 0, N'Biotecnología y Bioeconomía', N'biotecnologia-y-bioeconomia', 1, 0, N'/home/biotecnologia-y-bioeconomia/', N'Biotecnología y Bioeconomía | Rutas Pedagógicas', 0, N'Conecta el laboratorio escolar con los ecosistemas subantárticos, la turba, los bosques y el mar austral para idear soluciones sostenibles.', NULL, NULL, 0, 60, NULL, 0, N'2026-11-19 19:02:40.843072', N'2026-11-19 19:02:40.886070', 6, N'2026-11-19 19:02:40.886070', N'Biotecnología y Bioeconomía', NULL, NULL, 1, N'a4c97911778a4df193d8b3eb0a0ff301', NULL, 6);
INSERT INTO [wagtailcore_page] ([id], [path], [depth], [numchild], [title], [slug], [live], [has_unpublished_changes], [url_path], [seo_title], [show_in_menus], [search_description], [go_live_at], [expire_at], [expired], [content_type_id], [owner_id], [locked], [latest_revision_created_at], [first_published_at], [live_revision_id], [last_published_at], [draft_title], [locked_at], [locked_by_id], [locale_id], [translation_key], [alias_of_id], [latest_revision_id]) VALUES (7, N'000100010004', 3, 0, N'Descubrí más', N'descubri-mas', 1, 0, N'/home/descubri-mas/', N'Descubrí más | Rutas Pedagógicas', 0, N'Programa educativo provincial de Rutas Pedagógicas en Tierra del Fuego.', NULL, NULL, 0, 61, NULL, 0, N'2026-11-19 19:02:41.163073', N'2026-11-19 19:02:41.199146', 7, N'2026-11-19 19:02:41.199146', N'Descubrí más', NULL, NULL, 1, N'74c8b4687a244d3b9098511af928b399', NULL, 7);
SET IDENTITY_INSERT [wagtailcore_page] OFF;
DECLARE @max_wagtailcore_page BIGINT; SELECT @max_wagtailcore_page = ISNULL(MAX([id]), 0) FROM [wagtailcore_page];
IF @max_wagtailcore_page > 0 DBCC CHECKIDENT (N'dbo.wagtailcore_page', RESEED, @max_wagtailcore_page);
GO

-- wagtailcore_pagelogentry: 21 filas
SET IDENTITY_INSERT [wagtailcore_pagelogentry] ON;
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (1, N'Home', N'wagtail.edit', N'2026-11-03 13:58:36.165169', 1, 0, 2, 3, 1, 1, N'58128848de9f47d4932e721c9938792a', N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (2, N'INICIO', N'wagtail.edit', N'2026-11-03 13:58:42.360378', 1, 0, 2, 3, 2, 1, N'bdb8086765af41a0872d13c8f9818d74', N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (3, N'INICIO', N'wagtail.rename', N'2026-11-03 13:58:42.459376', 0, 0, 2, 3, 2, 1, N'bdb8086765af41a0872d13c8f9818d74', N'{"title": {"old": "Home", "new": "INICIO"}}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (4, N'INICIO', N'wagtail.publish', N'2026-11-03 13:58:42.525376', 0, 0, 2, 3, 2, 1, N'bdb8086765af41a0872d13c8f9818d74', N'{"title": {"old": "Home", "new": "INICIO"}}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (5, N'Rutas Pedagógicas', N'wagtail.publish', N'2026-11-19 18:10:38.621514', 1, 0, 2, 3, 3, NULL, NULL, N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (6, N'Industria del Videojuego', N'wagtail.create', N'2026-11-19 19:02:40.442392', 1, 0, 60, 4, NULL, NULL, NULL, N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (7, N'Industria del Videojuego', N'wagtail.publish', N'2026-11-19 19:02:40.532368', 1, 0, 60, 4, 4, NULL, NULL, N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (8, N'Ciencia de Datos e Inteligencia Artificial', N'wagtail.create', N'2026-11-19 19:02:40.654087', 1, 0, 60, 5, NULL, NULL, NULL, N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (9, N'Ciencia de Datos e Inteligencia Artificial', N'wagtail.publish', N'2026-11-19 19:02:40.738087', 1, 0, 60, 5, 5, NULL, NULL, N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (10, N'Biotecnología y Bioeconomía', N'wagtail.create', N'2026-11-19 19:02:40.825072', 1, 0, 60, 6, NULL, NULL, NULL, N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (11, N'Biotecnología y Bioeconomía', N'wagtail.publish', N'2026-11-19 19:02:40.921071', 1, 0, 60, 6, 6, NULL, NULL, N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (12, N'Descubrí más', N'wagtail.create', N'2026-11-19 19:02:41.148069', 1, 0, 61, 7, NULL, NULL, NULL, N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (13, N'Descubrí más', N'wagtail.publish', N'2026-11-19 19:02:41.230153', 1, 0, 61, 7, 7, NULL, NULL, N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (14, N'Rutas Pedagógicas', N'wagtail.publish', N'2026-11-19 19:02:41.732624', 1, 0, 2, 3, 8, NULL, NULL, N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (15, N'Industria del Videojuego', N'wagtail.edit', N'2026-11-19 19:04:47.534043', 1, 0, 60, 4, 9, 1, N'7a0f36450b7b49a788e54c72cc6f3eee', N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (16, N'Industria del Videojuego', N'wagtail.edit', N'2026-11-19 19:04:48.184531', 1, 0, 60, 4, 10, 1, N'cbac574d21cb47908380200ea473ed2d', N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (17, N'Industria del Videojuego', N'wagtail.publish', N'2026-11-19 19:10:04.464261', 1, 0, 60, 4, 11, NULL, NULL, N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (18, N'Industria del Videojuego', N'wagtail.publish', N'2026-11-19 19:10:19.761513', 1, 0, 60, 4, 12, NULL, NULL, N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (19, N'Talleres de verano', N'wagtail.create', N'2026-11-24 12:28:19.831923', 1, 0, 59, 8, NULL, 1, N'ccc21f75752544019edaae2f226fb058', N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (20, N'Talleres de verano', N'wagtail.publish', N'2026-11-24 12:28:19.926461', 1, 0, 59, 8, 13, 1, N'ccc21f75752544019edaae2f226fb058', N'{}');
INSERT INTO [wagtailcore_pagelogentry] ([id], [label], [action], [timestamp], [content_changed], [deleted], [content_type_id], [page_id], [revision_id], [user_id], [uuid], [data]) VALUES (21, N'Talleres de verano', N'wagtail.delete', N'2026-11-24 12:28:31.083690', 0, 1, 59, 8, NULL, NULL, NULL, N'{}');
SET IDENTITY_INSERT [wagtailcore_pagelogentry] OFF;
DECLARE @max_wagtailcore_pagelogentry BIGINT; SELECT @max_wagtailcore_pagelogentry = ISNULL(MAX([id]), 0) FROM [wagtailcore_pagelogentry];
IF @max_wagtailcore_pagelogentry > 0 DBCC CHECKIDENT (N'dbo.wagtailcore_pagelogentry', RESEED, @max_wagtailcore_pagelogentry);
GO

-- wagtailcore_pagesubscription: 3 filas
SET IDENTITY_INSERT [wagtailcore_pagesubscription] ON;
INSERT INTO [wagtailcore_pagesubscription] ([id], [comment_notifications], [page_id], [user_id]) VALUES (1, 0, 3, 1);
INSERT INTO [wagtailcore_pagesubscription] ([id], [comment_notifications], [page_id], [user_id]) VALUES (2, 0, 7, 1);
INSERT INTO [wagtailcore_pagesubscription] ([id], [comment_notifications], [page_id], [user_id]) VALUES (3, 0, 4, 1);
SET IDENTITY_INSERT [wagtailcore_pagesubscription] OFF;
DECLARE @max_wagtailcore_pagesubscription BIGINT; SELECT @max_wagtailcore_pagesubscription = ISNULL(MAX([id]), 0) FROM [wagtailcore_pagesubscription];
IF @max_wagtailcore_pagesubscription > 0 DBCC CHECKIDENT (N'dbo.wagtailcore_pagesubscription', RESEED, @max_wagtailcore_pagesubscription);
GO

-- wagtailcore_pageviewrestriction: 0 filas

-- wagtailcore_pageviewrestriction_groups: 0 filas

-- wagtailcore_referenceindex: 4 filas
SET IDENTITY_INSERT [wagtailcore_referenceindex] ON;
INSERT INTO [wagtailcore_referenceindex] ([id], [object_id], [to_object_id], [model_path], [content_path], [content_path_hash], [base_content_type_id], [content_type_id], [to_content_type_id]) VALUES (1, N'3', N'4', N'routes.item.pagina', N'routes.1.pagina', N'bc89bd47b39955f5b5aa630d318beb17', 1, 2, 1);
INSERT INTO [wagtailcore_referenceindex] ([id], [object_id], [to_object_id], [model_path], [content_path], [content_path_hash], [base_content_type_id], [content_type_id], [to_content_type_id]) VALUES (2, N'3', N'5', N'routes.item.pagina', N'routes.2.pagina', N'c87f100432075eb7b93f3406a48ec569', 1, 2, 1);
INSERT INTO [wagtailcore_referenceindex] ([id], [object_id], [to_object_id], [model_path], [content_path], [content_path_hash], [base_content_type_id], [content_type_id], [to_content_type_id]) VALUES (3, N'3', N'6', N'routes.item.pagina', N'routes.3.pagina', N'6bb9ed2140f9583daa65a8d1d730664f', 1, 2, 1);
INSERT INTO [wagtailcore_referenceindex] ([id], [object_id], [to_object_id], [model_path], [content_path], [content_path_hash], [base_content_type_id], [content_type_id], [to_content_type_id]) VALUES (4, N'3', N'7', N'cta_pagina', N'cta_pagina', N'53491c5f0ceb55c89eed351bf467a88e', 1, 2, 1);
SET IDENTITY_INSERT [wagtailcore_referenceindex] OFF;
DECLARE @max_wagtailcore_referenceindex BIGINT; SELECT @max_wagtailcore_referenceindex = ISNULL(MAX([id]), 0) FROM [wagtailcore_referenceindex];
IF @max_wagtailcore_referenceindex > 0 DBCC CHECKIDENT (N'dbo.wagtailcore_referenceindex', RESEED, @max_wagtailcore_referenceindex);
GO

-- wagtailcore_revision: 12 filas
SET IDENTITY_INSERT [wagtailcore_revision] ON;
INSERT INTO [wagtailcore_revision] ([id], [created_at], [approved_go_live_at], [user_id], [content], [object_id], [content_type_id], [base_content_type_id], [object_str]) VALUES (1, N'2026-11-03 13:58:36.125896', NULL, 1, N'{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "translation_key": "b74334d3-4581-440f-a5b2-2fb369d79e12", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "INICIO", "draft_title": "Home", "slug": "home", "content_type": 2, "url_path": "/home/", "owner": null, "latest_revision_created_at": null, "alias_of": null, "show_in_menus": false, "seo_title": "", "search_description": "", "wagtail_admin_comments": []}', N'3', 2, 1, N'INICIO');
INSERT INTO [wagtailcore_revision] ([id], [created_at], [approved_go_live_at], [user_id], [content], [object_id], [content_type_id], [base_content_type_id], [object_str]) VALUES (2, N'2026-11-03 13:58:42.329376', NULL, 1, N'{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "translation_key": "b74334d3-4581-440f-a5b2-2fb369d79e12", "locale": 1, "latest_revision": 1, "live": true, "has_unpublished_changes": true, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "INICIO", "draft_title": "INICIO", "slug": "home", "content_type": 2, "url_path": "/home/", "owner": null, "latest_revision_created_at": "2026-11-03T13:58:36.125Z", "alias_of": null, "show_in_menus": false, "seo_title": "", "search_description": "", "wagtail_admin_comments": []}', N'3', 2, 1, N'INICIO');
INSERT INTO [wagtailcore_revision] ([id], [created_at], [approved_go_live_at], [user_id], [content], [object_id], [content_type_id], [base_content_type_id], [object_str]) VALUES (3, N'2026-11-19 18:10:38.532514', NULL, NULL, N'{"pk": 3, "path": "00010001", "depth": 2, "numchild": 0, "translation_key": "b74334d3-4581-440f-a5b2-2fb369d79e12", "locale": 1, "latest_revision": 2, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-11-03T13:58:42.426Z", "last_published_at": "2026-11-03T13:58:42.426Z", "live_revision": 2, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Rutas Pedag\u00f3gicas", "draft_title": "Rutas Pedag\u00f3gicas", "slug": "home", "content_type": 2, "url_path": "/home/", "owner": null, "latest_revision_created_at": "2026-11-03T13:58:42.329Z", "alias_of": null, "show_in_menus": false, "seo_title": "Rutas Pedag\u00f3gicas | Agencia de Innovaci\u00f3n Fueguina", "search_description": "Programa educativo provincial de Tierra del Fuego. Rutas de videojuegos, ciencia de datos e IA, y biotecnolog\u00eda en Ushuaia, Tolhuin y R\u00edo Grande.", "eyebrow": "Programa Educativo Provincial \u00b7 Tierra del Fuego", "headline": "Rutas Pedag\u00f3gicas:", "headline_highlight": "Un espacio digital", "headline_rest": "para integrar, organizar y compartir propuestas educativas innovadoras.", "intro": "<p>Articulamos ciencia, tecnolog\u00eda y creatividad en las aulas de <strong>Ushuaia, Tolhuin y R\u00edo Grande</strong>. Acompa\u00f1amos a 56 docentes y 364 estudiantes en 7 rutas activas de construcci\u00f3n de conocimiento fueguino.</p>", "polos_url": "https://polos.aif.gob.ar/", "aif_url": "https://www.aif.gob.ar/", "campus_url": "https://educaciondigital.tierradelfuego.edu.ar/campusvirtual/login/index.php", "alcance": "Nivel Inicial, Nivel Primario, Nivel Secundario", "mapa_titulo": "Recorrido Territorial TDF", "mapa_ciudades": "Ushuaia \u00b7 Tolhuin \u00b7 R\u00edo Grande", "carrusel_titulo": "Rutas Pedag\u00f3gicas en Acci\u00f3n \u00b7 Tierra del Fuego", "impacto_etiqueta": "Estad\u00edsticas Oficiales Verificadas", "impacto_aviso": "Capacitaciones en curso continuo", "impacto_titulo": "Impacto real en Tierra del Fuego", "impacto_texto": "<p>Consolidado territorial de rutas registradas, docentes y estudiantes participantes en Ushuaia, Tolhuin y R\u00edo Grande. <strong>Las instancias de capacitaci\u00f3n y acompa\u00f1amiento docente se encuentran en trabajo permanente y crecimiento activo</strong> en toda la provincia.</p>", "cta_texto": "Descubr\u00ed m\u00e1s", "cta_url": "https://script.google.com/macros/s/AKfycbw6-k21aE__icoLThz_fuCgoM-J88MTaPj0c_njMucoeBnKAsUqam8piSUQCrxbqd26Sg/exec", "escuelas_etiqueta": "Organizaci\u00f3n Territorial", "escuelas_titulo": "Escuelas Participantes por Ciudad", "escuelas_texto": "<p>Explor\u00e1 las instituciones educativas organizadas por localidad: <strong>Escuelas Ushuaia</strong>, <strong>Escuelas Tolhuin</strong> y <strong>Escuelas R\u00edo Grande</strong>.</p>", "galeria_etiqueta": "Registro Visual", "galeria_titulo": "Galer\u00eda de experiencias", "galeria_texto": "Ilustraciones y espacios para las fotograf\u00edas reales de las jornadas en Ushuaia, Tolhuin y R\u00edo Grande.", "voces_etiqueta": "Territorio", "voces_titulo": "Voces del territorio", "instagram_url": "https://www.instagram.com/aif.tdf/", "instagram_titulo": "Segu\u00ed el trabajo en las escuelas", "rutas_etiqueta": "Ejes Pedag\u00f3gicos Provinciales", "rutas_titulo": "Las 3 Rutas Tem\u00e1ticas", "rutas_texto": "<p>Propuestas articuladas para niveles <strong>Inicial, Primario y Secundario</strong> con acompa\u00f1amiento de la Agencia de Innovaci\u00f3n Fueguina.</p>", "biblioteca_etiqueta": "Repositorio Pedag\u00f3gico", "biblioteca_titulo": "Biblioteca de Manuales y Gu\u00edas", "biblioteca_texto": "<p>Explor\u00e1 los materiales por eje tem\u00e1tico (<strong>Verde</strong> Bioeconom\u00eda, <strong>Azul</strong> Ciencia de Datos e IA, <strong>Rojo</strong> Videojuegos) o acced\u00e9 al Campus Virtual.</p>", "campus_titulo": "Campus Virtual de Educaci\u00f3n Digital \u00b7 Tierra del Fuego", "campus_texto": "Ingres\u00e1 a las aulas virtuales, cursos activos y materiales complementarios de formaci\u00f3n docente continua.", "pitch_titulo": "Gu\u00eda de Pitch: C\u00f3mo defender tu investigaci\u00f3n en 5 minutos", "pitch_texto": "Estructura paso a paso y checklist previo para presentar los proyectos en F\u00e1brica de Talentos e I.P.R.A.", "pitch_cuerpo": "<h3>1. Problema</h3><p>Esto afecta a\u2026 y ocurre en\u2026</p><h3>2. Soluci\u00f3n</h3><p>Proponemos\u2026 porque\u2026</p><h3>3. Producto</h3><p>Les mostramos c\u00f3mo funciona\u2026</p><h3>4. Viabilidad</h3><p>En TDF se aplica porque\u2026</p><h3>5. Impacto</h3><p>Con esto mejora\u2026 y se mide con\u2026</p>", "informe": null, "contacto_titulo": "Agencia de Innovaci\u00f3n Fueguina", "contacto_texto": "Comunicate con nuestro equipo territorial o segu\u00ed las novedades de todas las escuelas en nuestro Instagram oficial.", "email": "rutaspedagogicas@aif.gob.ar", "sede_ushuaia": "F\u00e1brica de Talentos \u00b7 Av. Maip\u00fa 1255", "sede_rio_grande": "I.P.R.A. \u00b7 Perito Moreno 168", "formulario_titulo": "Formulario de Vinculaci\u00f3n Educativa", "formulario_texto": "Complet\u00e1 los datos para sumar tu instituci\u00f3n o consultar al equipo pedag\u00f3gico.", "redes_titulo": "\u00a1SEGUINOS EN NUESTRAS REDES!", "wagtail_admin_comments": [], "slides": [], "metrics": [], "city_stats": [], "schools": [], "gallery_items": [], "testimonials": [], "routes": [], "resources": [], "social_links": []}', N'3', 2, 1, N'Rutas Pedagógicas');
INSERT INTO [wagtailcore_revision] ([id], [created_at], [approved_go_live_at], [user_id], [content], [object_id], [content_type_id], [base_content_type_id], [object_str]) VALUES (4, N'2026-11-19 19:02:40.462467', NULL, NULL, N'{"pk": 4, "path": "000100010001", "depth": 3, "numchild": 0, "translation_key": "f996c62b-dce4-46b5-8781-574d67d89ca0", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Industria del Videojuego", "draft_title": "Industria del Videojuego", "slug": "industria-del-videojuego", "content_type": 60, "url_path": "/home/industria-del-videojuego/", "owner": null, "latest_revision_created_at": null, "alias_of": null, "show_in_menus": false, "seo_title": "Industria del Videojuego | Rutas Pedag\u00f3gicas", "search_description": "Transforma a los estudiantes en creadores de experiencias interactivas con identidad fueguina, abordando mec\u00e1nicas y prototipado funcional.", "code": "Ruta 01 \u00b7 Rojo", "subtitle": "Dise\u00f1o, narrativa interactiva, arte digital y l\u00f3gica de programaci\u00f3n l\u00fadica.", "summary": "Transforma a los estudiantes en creadores de experiencias interactivas con identidad fueguina, abordando mec\u00e1nicas y prototipado funcional.", "theme": "game", "icon": "ph-game-controller", "cuerpo": "<h2>Qu\u00e9 propone esta ruta</h2><p>La ruta de Industria del Videojuego invita a las escuelas a dise\u00f1ar juegos, historias y prototipos con identidad de Tierra del Fuego. El trabajo articula arte digital, narrativa, sonido y pensamiento computacional.</p><h2>C\u00f3mo se trabaja</h2><p>Los equipos avanzan desde el juego desenchufado hasta el prototipo funcional. Cada nivel suma herramientas, pero el eje es el mismo: crear, probar y defender una idea propia.</p>", "enlace_externo": "https://script.google.com/macros/s/AKfycbyCctCBuH-sWa46nHw8gi1xqv3E-fBqFDpWrrd6nkgZbiCQ076z2pHL8-V1r3hLDPu9/exec", "enlace_externo_texto": "Abrir versi\u00f3n original", "wagtail_admin_comments": [], "niveles": [], "bloques": []}', N'4', 60, 1, N'Industria del Videojuego');
INSERT INTO [wagtailcore_revision] ([id], [created_at], [approved_go_live_at], [user_id], [content], [object_id], [content_type_id], [base_content_type_id], [object_str]) VALUES (5, N'2026-11-19 19:02:40.672070', NULL, NULL, N'{"pk": 5, "path": "000100010002", "depth": 3, "numchild": 0, "translation_key": "0d32035c-9897-449b-a14b-546117fbfa83", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Ciencia de Datos e Inteligencia Artificial", "draft_title": "Ciencia de Datos e Inteligencia Artificial", "slug": "ciencia-de-datos-e-inteligencia-artificial", "content_type": 60, "url_path": "/home/ciencia-de-datos-e-inteligencia-artificial/", "owner": null, "latest_revision_created_at": null, "alias_of": null, "show_in_menus": false, "seo_title": "Ciencia de Datos e Inteligencia Artificial | Rutas Pedag\u00f3gicas", "search_description": "Promueve la alfabetizaci\u00f3n en datos reales de la provincia, el entrenamiento de modelos y la reflexi\u00f3n cr\u00edtica sobre \u00e9tica en la IA.", "code": "Ruta 02 \u00b7 Azul", "subtitle": "An\u00e1lisis de informaci\u00f3n, visualizaci\u00f3n y uso \u00e9tico de modelos de IA.", "summary": "Promueve la alfabetizaci\u00f3n en datos reales de la provincia, el entrenamiento de modelos y la reflexi\u00f3n cr\u00edtica sobre \u00e9tica en la IA.", "theme": "data", "icon": "ph-cpu", "cuerpo": "<h2>Qu\u00e9 propone esta ruta</h2><p>La ruta de Ciencia de Datos e Inteligencia Artificial acerca a estudiantes y docentes al an\u00e1lisis de informaci\u00f3n real de Tierra del Fuego: clima, energ\u00eda, turismo y datos escolares.</p><h2>Enfoque \u00e9tico</h2><p>Adem\u00e1s de visualizar y entrenar modelos, cada propuesta incluye un espacio para preguntarse qu\u00e9 datos se usan, para qu\u00e9 y con qu\u00e9 cuidado.</p>", "enlace_externo": "https://script.google.com/macros/s/AKfycbz1rRkRHKrijBjktU59ymNBxSE62NGRtHtmCr0icjDDl1ayFg8PnHcSIJw7oiqMTI2bIA/exec", "enlace_externo_texto": "Abrir versi\u00f3n original", "wagtail_admin_comments": [], "niveles": [], "bloques": []}', N'5', 60, 1, N'Ciencia de Datos e Inteligencia Artificial');
INSERT INTO [wagtailcore_revision] ([id], [created_at], [approved_go_live_at], [user_id], [content], [object_id], [content_type_id], [base_content_type_id], [object_str]) VALUES (6, N'2026-11-19 19:02:40.843072', NULL, NULL, N'{"pk": 6, "path": "000100010003", "depth": 3, "numchild": 0, "translation_key": "a4c97911-778a-4df1-93d8-b3eb0a0ff301", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Biotecnolog\u00eda y Bioeconom\u00eda", "draft_title": "Biotecnolog\u00eda y Bioeconom\u00eda", "slug": "biotecnologia-y-bioeconomia", "content_type": 60, "url_path": "/home/biotecnologia-y-bioeconomia/", "owner": null, "latest_revision_created_at": null, "alias_of": null, "show_in_menus": false, "seo_title": "Biotecnolog\u00eda y Bioeconom\u00eda | Rutas Pedag\u00f3gicas", "search_description": "Conecta el laboratorio escolar con los ecosistemas subant\u00e1rticos, la turba, los bosques y el mar austral para idear soluciones sostenibles.", "code": "Ruta 03 \u00b7 Verde", "subtitle": "Ciencias biol\u00f3gicas aplicadas a los recursos naturales y sostenibilidad fueguina.", "summary": "Conecta el laboratorio escolar con los ecosistemas subant\u00e1rticos, la turba, los bosques y el mar austral para idear soluciones sostenibles.", "theme": "bio", "icon": "ph-flask", "cuerpo": "<h2>Qu\u00e9 propone esta ruta</h2><p>La ruta de Biotecnolog\u00eda y Bioeconom\u00eda vincula el aula con los ecosistemas de la provincia: turberas, bosques, algas y el mar austral. El objetivo es observar, experimentar y dise\u00f1ar soluciones sostenibles.</p><h2>Del laboratorio al territorio</h2><p>Las propuestas van de la exploraci\u00f3n sensorial a proyectos de bioinsumos y econom\u00eda circular, siempre con cuidado del entorno fueguino.</p>", "enlace_externo": "https://script.google.com/macros/s/AKfycbyhREv8iO6ZnjvhXLxaIbZN7mCkJhUANTOi3eFzzVOCb_OboppY-Wu8vP5g8T-ZR9Y/exec", "enlace_externo_texto": "Abrir versi\u00f3n original", "wagtail_admin_comments": [], "niveles": [], "bloques": []}', N'6', 60, 1, N'Biotecnología y Bioeconomía');
INSERT INTO [wagtailcore_revision] ([id], [created_at], [approved_go_live_at], [user_id], [content], [object_id], [content_type_id], [base_content_type_id], [object_str]) VALUES (7, N'2026-11-19 19:02:41.163073', NULL, NULL, N'{"pk": 7, "path": "000100010004", "depth": 3, "numchild": 0, "translation_key": "74c8b468-7a24-4d3b-9098-511af928b399", "locale": 1, "latest_revision": null, "live": true, "has_unpublished_changes": false, "first_published_at": null, "last_published_at": null, "live_revision": null, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Descubr\u00ed m\u00e1s", "draft_title": "Descubr\u00ed m\u00e1s", "slug": "descubri-mas", "content_type": 61, "url_path": "/home/descubri-mas/", "owner": null, "latest_revision_created_at": null, "alias_of": null, "show_in_menus": false, "seo_title": "Descubr\u00ed m\u00e1s | Rutas Pedag\u00f3gicas", "search_description": "Programa educativo provincial de Rutas Pedag\u00f3gicas en Tierra del Fuego.", "intro": "Un espacio digital para integrar, organizar y compartir propuestas educativas innovadoras en Ushuaia, Tolhuin y R\u00edo Grande.", "cuerpo": "<h2>El programa</h2><p>Rutas Pedag\u00f3gicas articula ciencia, tecnolog\u00eda y creatividad en las aulas fueguinas. Acompa\u00f1amos a docentes y estudiantes en tres ejes: Industria del Videojuego, Ciencia de Datos e Inteligencia Artificial, y Biotecnolog\u00eda y Bioeconom\u00eda.</p><h2>Qu\u00e9 vas a encontrar</h2><p>En cada ruta hay una progresi\u00f3n por nivel, materiales de apoyo y un recorrido para sumar a tu escuela. El contenido de esta secci\u00f3n se edita desde el panel de administraci\u00f3n, sin cambiar el c\u00f3digo del sitio.</p><h2>C\u00f3mo participar</h2><p>Complet\u00e1 el <a href=\"/#contacto\">formulario de Vinculaci\u00f3n Educativa</a> o escribinos a rutaspedagogicas@aif.gob.ar. Tambi\u00e9n pod\u00e9s seguir el trabajo territorial en Instagram.</p>", "imagen": null, "wagtail_admin_comments": [], "bloques": []}', N'7', 61, 1, N'Descubrí más');
INSERT INTO [wagtailcore_revision] ([id], [created_at], [approved_go_live_at], [user_id], [content], [object_id], [content_type_id], [base_content_type_id], [object_str]) VALUES (8, N'2026-11-19 19:02:41.332793', NULL, NULL, N'{"pk": 3, "path": "00010001", "depth": 2, "numchild": 4, "translation_key": "b74334d3-4581-440f-a5b2-2fb369d79e12", "locale": 1, "latest_revision": 3, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-11-03T13:58:42.426Z", "last_published_at": "2026-11-19T18:10:38.581Z", "live_revision": 3, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Rutas Pedag\u00f3gicas", "draft_title": "Rutas Pedag\u00f3gicas", "slug": "home", "content_type": 2, "url_path": "/home/", "owner": null, "latest_revision_created_at": "2026-11-19T18:10:38.532Z", "alias_of": null, "show_in_menus": false, "seo_title": "Rutas Pedag\u00f3gicas | Agencia de Innovaci\u00f3n Fueguina", "search_description": "Programa educativo provincial de Tierra del Fuego. Rutas de videojuegos, ciencia de datos e IA, y biotecnolog\u00eda en Ushuaia, Tolhuin y R\u00edo Grande.", "eyebrow": "Programa Educativo Provincial \u00b7 Tierra del Fuego", "headline": "Rutas Pedag\u00f3gicas:", "headline_highlight": "Un espacio digital", "headline_rest": "para integrar, organizar y compartir propuestas educativas innovadoras.", "intro": "<p>Articulamos ciencia, tecnolog\u00eda y creatividad en las aulas de <strong>Ushuaia, Tolhuin y R\u00edo Grande</strong>. Acompa\u00f1amos a 56 docentes y 364 estudiantes en 7 rutas activas de construcci\u00f3n de conocimiento fueguino.</p>", "polos_url": "https://polos.aif.gob.ar/", "aif_url": "https://www.aif.gob.ar/", "campus_url": "https://educaciondigital.tierradelfuego.edu.ar/campusvirtual/login/index.php", "alcance": "Nivel Inicial, Nivel Primario, Nivel Secundario", "mapa_titulo": "Recorrido Territorial TDF", "mapa_ciudades": "Ushuaia \u00b7 Tolhuin \u00b7 R\u00edo Grande", "carrusel_titulo": "Rutas Pedag\u00f3gicas en Acci\u00f3n \u00b7 Tierra del Fuego", "impacto_etiqueta": "Estad\u00edsticas Oficiales Verificadas", "impacto_aviso": "Capacitaciones en curso continuo", "impacto_titulo": "Impacto real en Tierra del Fuego", "impacto_texto": "<p>Consolidado territorial de rutas registradas, docentes y estudiantes participantes en Ushuaia, Tolhuin y R\u00edo Grande. <strong>Las instancias de capacitaci\u00f3n y acompa\u00f1amiento docente se encuentran en trabajo permanente y crecimiento activo</strong> en toda la provincia.</p>", "cta_texto": "Descubr\u00ed m\u00e1s", "cta_pagina": 7, "cta_url": "https://script.google.com/macros/s/AKfycbw6-k21aE__icoLThz_fuCgoM-J88MTaPj0c_njMucoeBnKAsUqam8piSUQCrxbqd26Sg/exec", "escuelas_etiqueta": "Organizaci\u00f3n Territorial", "escuelas_titulo": "Escuelas Participantes por Ciudad", "escuelas_texto": "<p>Explor\u00e1 las instituciones educativas organizadas por localidad: <strong>Escuelas Ushuaia</strong>, <strong>Escuelas Tolhuin</strong> y <strong>Escuelas R\u00edo Grande</strong>.</p>", "galeria_etiqueta": "Registro Visual", "galeria_titulo": "Galer\u00eda de experiencias", "galeria_texto": "Ilustraciones y espacios para las fotograf\u00edas reales de las jornadas en Ushuaia, Tolhuin y R\u00edo Grande.", "voces_etiqueta": "Territorio", "voces_titulo": "Voces del territorio", "instagram_url": "https://www.instagram.com/aif.tdf/", "instagram_titulo": "Segu\u00ed el trabajo en las escuelas", "rutas_etiqueta": "Ejes Pedag\u00f3gicos Provinciales", "rutas_titulo": "Las 3 Rutas Tem\u00e1ticas", "rutas_texto": "<p>Propuestas articuladas para niveles <strong>Inicial, Primario y Secundario</strong> con acompa\u00f1amiento de la Agencia de Innovaci\u00f3n Fueguina.</p>", "biblioteca_etiqueta": "Repositorio Pedag\u00f3gico", "biblioteca_titulo": "Biblioteca de Manuales y Gu\u00edas", "biblioteca_texto": "<p>Explor\u00e1 los materiales por eje tem\u00e1tico (<strong>Verde</strong> Bioeconom\u00eda, <strong>Azul</strong> Ciencia de Datos e IA, <strong>Rojo</strong> Videojuegos) o acced\u00e9 al Campus Virtual.</p>", "campus_titulo": "Campus Virtual de Educaci\u00f3n Digital \u00b7 Tierra del Fuego", "campus_texto": "Ingres\u00e1 a las aulas virtuales, cursos activos y materiales complementarios de formaci\u00f3n docente continua.", "pitch_titulo": "Gu\u00eda de Pitch: C\u00f3mo defender tu investigaci\u00f3n en 5 minutos", "pitch_texto": "Estructura paso a paso y checklist previo para presentar los proyectos en F\u00e1brica de Talentos e I.P.R.A.", "pitch_cuerpo": "<h3>1. Problema</h3><p>Esto afecta a\u2026 y ocurre en\u2026</p><h3>2. Soluci\u00f3n</h3><p>Proponemos\u2026 porque\u2026</p><h3>3. Producto</h3><p>Les mostramos c\u00f3mo funciona\u2026</p><h3>4. Viabilidad</h3><p>En TDF se aplica porque\u2026</p><h3>5. Impacto</h3><p>Con esto mejora\u2026 y se mide con\u2026</p>", "informe": null, "contacto_titulo": "Agencia de Innovaci\u00f3n Fueguina", "contacto_texto": "Comunicate con nuestro equipo territorial o segu\u00ed las novedades de todas las escuelas en nuestro Instagram oficial.", "email": "rutaspedagogicas@aif.gob.ar", "sede_ushuaia": "F\u00e1brica de Talentos \u00b7 Av. Maip\u00fa 1255", "sede_rio_grande": "I.P.R.A. \u00b7 Perito Moreno 168", "formulario_titulo": "Formulario de Vinculaci\u00f3n Educativa", "formulario_texto": "Complet\u00e1 los datos para sumar tu instituci\u00f3n o consultar al equipo pedag\u00f3gico.", "redes_titulo": "\u00a1SEGUINOS EN NUESTRAS REDES!", "wagtail_admin_comments": [], "slides": [{"pk": 1, "sort_order": null, "page": 3, "title": "Presentaci\u00f3n de Videojuegos \u00b7 Escuelas de Tierra del Fuego", "theme": "game", "image": null}, {"pk": 2, "sort_order": null, "page": 3, "title": "Estudiantes Programando en Rutas Pedag\u00f3gicas", "theme": "data", "image": null}, {"pk": 3, "sort_order": null, "page": 3, "title": "Exposici\u00f3n de Ciencia de Datos e IA \u00b7 Agencia de Innovaci\u00f3n", "theme": "bio", "image": null}], "metrics": [{"pk": 1, "sort_order": null, "page": 3, "value": 7, "label": "Rutas registradas", "detail": "3 en Ushuaia \u00b7 1 en Tolhuin \u00b7 3 en R\u00edo Grande \u00b7 En expansi\u00f3n", "theme": "game", "icon": "ph-map-pin-line"}, {"pk": 2, "sort_order": null, "page": 3, "value": 56, "label": "Docentes en capacitaci\u00f3n", "detail": "14 en Ushuaia \u00b7 6 en Tolhuin \u00b7 36 en R\u00edo Grande \u00b7 Formaci\u00f3n continua", "theme": "data", "icon": "ph-chalkboard-teacher"}, {"pk": 3, "sort_order": null, "page": 3, "value": 364, "label": "Estudiantes protagonistas", "detail": "52 en Ushuaia \u00b7 51 en Tolhuin \u00b7 261 en R\u00edo Grande \u00b7 Talleres activos", "theme": "game", "icon": "ph-student"}, {"pk": 4, "sort_order": null, "page": 3, "value": 420, "label": "Total participantes", "detail": "Cifras en actualizaci\u00f3n permanente en toda la provincia", "theme": "bio", "icon": "ph-users-four"}], "city_stats": [{"pk": 1, "sort_order": null, "page": 3, "city": "Ushuaia", "routes": 3, "teachers": 14, "students": 52, "theme": "game"}, {"pk": 2, "sort_order": null, "page": 3, "city": "Tolhuin", "routes": 1, "teachers": 6, "students": 51, "theme": "bio"}, {"pk": 3, "sort_order": null, "page": 3, "city": "R\u00edo Grande", "routes": 3, "teachers": 36, "students": 261, "theme": "data"}], "schools": [{"pk": 1, "sort_order": null, "page": 3, "name": "Colegio Provincial Kloket\u00e9n", "city": "Ushuaia", "level": "Secundario", "route": "Ciencia de Datos e IA", "teachers": "Equipo Docente Ushuaia \u00b7 Ruta 1"}, {"pk": 2, "sort_order": null, "page": 3, "name": "Escuela Provincial N\u00b0 1 Domingo Faustino Sarmiento", "city": "Ushuaia", "level": "Primario", "route": "Biotecnolog\u00eda y Bioeconom\u00eda", "teachers": "Equipo Docente Ushuaia \u00b7 Ruta 2"}, {"pk": 3, "sort_order": null, "page": 3, "name": "Colegio T\u00e9cnico Provincial Olga B. de Arko", "city": "Ushuaia", "level": "Secundario", "route": "Industria del Videojuego", "teachers": "Equipo Docente Ushuaia \u00b7 Ruta 3"}, {"pk": 4, "sort_order": null, "page": 3, "name": "Colegio Provincial Ram\u00f3n Alberto Trejo Noel", "city": "Tolhuin", "level": "Secundario", "route": "Biotecnolog\u00eda y Bioeconom\u00eda", "teachers": "Equipo Docente Tolhuin \u00b7 Ruta 1"}, {"pk": 5, "sort_order": null, "page": 3, "name": "Colegio Provincial Dr. Ernesto Guevara", "city": "R\u00edo Grande", "level": "Secundario", "route": "Industria del Videojuego", "teachers": "Equipo Docente R\u00edo Grande \u00b7 Ruta 1"}, {"pk": 6, "sort_order": null, "page": 3, "name": "Escuela Provincial N\u00b0 2 Dr. Benjam\u00edn Zorrilla", "city": "R\u00edo Grande", "level": "Primario", "route": "Ciencia de Datos e IA", "teachers": "Equipo Docente R\u00edo Grande \u00b7 Ruta 2"}, {"pk": 7, "sort_order": null, "page": 3, "name": "Escuela Provincial N\u00b0 21 Provincias Unidas", "city": "R\u00edo Grande", "level": "Primario", "route": "Biotecnolog\u00eda y Bioeconom\u00eda", "teachers": "Equipo Docente R\u00edo Grande \u00b7 Ruta 3"}], "gallery_items": [{"pk": 1, "sort_order": null, "page": 3, "badge": "Ilustraci\u00f3n IA \u00b7 Ruta Verde", "title": "Laboratorio de Biotecnolog\u00eda Austral", "caption": "Representaci\u00f3n conceptual sobre exploraci\u00f3n cient\u00edfica de turberas y ecosistemas fueguinos.", "theme": "bio", "image": null}, {"pk": 2, "sort_order": null, "page": 3, "badge": "Ilustraci\u00f3n IA \u00b7 Ruta Azul", "title": "Ciencia de Datos e IA en el Fin del Mundo", "caption": "Visualizaci\u00f3n sobre an\u00e1lisis de datos clim\u00e1ticos y aprendizaje autom\u00e1tico en aulas de TDF.", "theme": "data", "image": null}, {"pk": 3, "sort_order": null, "page": 3, "badge": "Ilustraci\u00f3n IA \u00b7 Ruta Rojo", "title": "Creaci\u00f3n de Videojuegos Fueguinos", "caption": "Arte conceptual sobre dise\u00f1o interactivo y narrativa digital con identidad provincial.", "theme": "game", "image": null}, {"pk": 4, "sort_order": null, "page": 3, "badge": "Espacio Foto \u00b7 Ushuaia", "title": "Jornada en Escuelas de Ushuaia", "caption": "Fotograf\u00eda de los estudiantes o docentes trabajando en Ushuaia.", "theme": "game", "image": null}, {"pk": 5, "sort_order": null, "page": 3, "badge": "Espacio Foto \u00b7 Tolhuin", "title": "Encuentro en Escuelas de Tolhuin", "caption": "Fotograf\u00eda de la ruta pedag\u00f3gica en el coraz\u00f3n de la isla.", "theme": "bio", "image": null}, {"pk": 6, "sort_order": null, "page": 3, "badge": "Espacio Foto \u00b7 R\u00edo Grande", "title": "Presentaci\u00f3n en Escuelas de R\u00edo Grande", "caption": "Fotograf\u00eda de los talleres y exposiciones en R\u00edo Grande.", "theme": "data", "image": null}], "testimonials": [{"pk": 1, "sort_order": null, "page": 3, "category": "docente", "role": "Directiva \u00b7 Ushuaia", "author": "Prof. Marta Villarroel", "route": "Biotecnolog\u00eda y Bioeconom\u00eda", "theme": "bio", "quote": "Rutas Pedag\u00f3gicas nos dio un marco ordenado y riguroso para que docentes con a\u00f1os de trayectoria nos animemos a experimentar con biotecnolog\u00eda aplicada al entorno fueguino."}, {"pk": 2, "sort_order": null, "page": 3, "category": "docente", "role": "Docente \u00b7 R\u00edo Grande", "author": "Prof. Carlos Oyarz\u00fan", "route": "Ciencia de Datos e IA", "theme": "data", "quote": "Con 36 docentes y m\u00e1s de 260 estudiantes participando en R\u00edo Grande, logramos que los chicos analicen datos reales de nuestra ciudad y los defiendan con orgullo."}, {"pk": 3, "sort_order": null, "page": 3, "category": "estudiante", "role": "Estudiante \u00b7 Tolhuin", "author": "Valentina R\u00edos", "route": "Industria del Videojuego", "theme": "game", "quote": "Trabajar en equipo desde nuestra escuela en Tolhuin y compartir proyectos con chicos de toda la provincia fue una experiencia \u00fanica que nos motiva a seguir creando."}], "routes": [{"pk": 1, "sort_order": null, "page": 3, "code": "Ruta 01 \u00b7 Rojo", "title": "Industria del Videojuego", "subtitle": "Dise\u00f1o, narrativa interactiva, arte digital y l\u00f3gica de programaci\u00f3n l\u00fadica.", "summary": "Transforma a los estudiantes en creadores de experiencias interactivas con identidad fueguina, abordando mec\u00e1nicas y prototipado funcional.", "theme": "game", "icon": "ph-game-controller", "external_url": "https://script.google.com/macros/s/AKfycbyCctCBuH-sWa46nHw8gi1xqv3E-fBqFDpWrrd6nkgZbiCQ076z2pHL8-V1r3hLDPu9/exec", "pagina": 4, "levels": [{"pk": 1, "sort_order": null, "route": 1, "level": "Nivel Inicial", "description": "Pensamiento computacional desenchufado, secuencias l\u00f3gicas mediante juego corporal y creaci\u00f3n de historias interactivas ilustradas."}, {"pk": 2, "sort_order": null, "route": 1, "level": "Nivel Primario", "description": "Programaci\u00f3n por bloques (Scratch), dise\u00f1o de personajes inspirados en la fauna fueguina y mec\u00e1nicas b\u00e1sicas de puntaje y niveles."}, {"pk": 3, "sort_order": null, "route": 1, "level": "Nivel Secundario", "description": "Dise\u00f1o de videojuegos 2D/3D, narrativa transmedia, arte pixel/vectorial, sonido y prototipado funcional con defensa en formato Pitch."}]}, {"pk": 2, "sort_order": null, "page": 3, "code": "Ruta 02 \u00b7 Azul", "title": "Ciencia de Datos e Inteligencia Artificial", "subtitle": "An\u00e1lisis de informaci\u00f3n, visualizaci\u00f3n y uso \u00e9tico de modelos de IA.", "summary": "Promueve la alfabetizaci\u00f3n en datos reales de la provincia, el entrenamiento de modelos y la reflexi\u00f3n cr\u00edtica sobre \u00e9tica en la IA.", "theme": "data", "icon": "ph-cpu", "external_url": "https://script.google.com/macros/s/AKfycbz1rRkRHKrijBjktU59ymNBxSE62NGRtHtmCr0icjDDl1ayFg8PnHcSIJw7oiqMTI2bIA/exec", "pagina": 5, "levels": [{"pk": 4, "sort_order": null, "route": 2, "level": "Nivel Inicial", "description": "Clasificaci\u00f3n de objetos, reconocimiento de patrones visuales y comprensi\u00f3n temprana de c\u00f3mo aprenden las m\u00e1quinas a trav\u00e9s del juego."}, {"pk": 5, "sort_order": null, "route": 2, "level": "Nivel Primario", "description": "Recolecci\u00f3n de datos del entorno escolar, gr\u00e1ficos visuales simples y entrenamiento de modelos de reconocimiento de im\u00e1genes y sonidos."}, {"pk": 6, "sort_order": null, "route": 2, "level": "Nivel Secundario", "description": "An\u00e1lisis de datasets reales de Tierra del Fuego (clima, energ\u00eda, turismo), programaci\u00f3n inicial en Python, visualizaci\u00f3n y debate \u00e9tico sobre IA."}]}, {"pk": 3, "sort_order": null, "page": 3, "code": "Ruta 03 \u00b7 Verde", "title": "Biotecnolog\u00eda y Bioeconom\u00eda", "subtitle": "Ciencias biol\u00f3gicas aplicadas a los recursos naturales y sostenibilidad fueguina.", "summary": "Conecta el laboratorio escolar con los ecosistemas subant\u00e1rticos, la turba, los bosques y el mar austral para idear soluciones sostenibles.", "theme": "bio", "icon": "ph-flask", "external_url": "https://script.google.com/macros/s/AKfycbyhREv8iO6ZnjvhXLxaIbZN7mCkJhUANTOi3eFzzVOCb_OboppY-Wu8vP5g8T-ZR9Y/exec", "pagina": 6, "levels": [{"pk": 7, "sort_order": null, "route": 3, "level": "Nivel Inicial", "description": "Exploraci\u00f3n sensorial de la naturaleza fueguina, germinaci\u00f3n, observaci\u00f3n con lupas y cuidado de los ecosistemas locales."}, {"pk": 8, "sort_order": null, "route": 3, "level": "Nivel Primario", "description": "Experimentos de microbiolog\u00eda cotidiana (levaduras, compostaje), ciclos de la materia y aprovechamiento responsable de recursos naturales."}, {"pk": 9, "sort_order": null, "route": 3, "level": "Nivel Secundario", "description": "Biotecnolog\u00eda aplicada a turberas, algas y bosques subant\u00e1rticos; desarrollo de bioinsumos y proyectos de econom\u00eda circular provincial."}]}], "resources": [{"pk": 1, "sort_order": null, "page": 3, "title": "Manual Docente: Introducci\u00f3n a la Biotecnolog\u00eda Fueguina", "level": "Primario", "route": "Biotecnolog\u00eda", "kind": "Manual PDF \u00b7 42 p\u00e1gs.", "description": "Secuencias experimentales seguras para realizar en el aula con recursos locales.", "theme": "bio", "document": null}, {"pk": 2, "sort_order": null, "page": 3, "title": "Cuadernillo de Ciencia de Datos e IA \u00c9tica en el Aula", "level": "Secundario", "route": "Ciencia de Datos", "kind": "Gu\u00eda Metodol\u00f3gica \u00b7 56 p\u00e1gs.", "description": "Actividades pr\u00e1cticas con datasets provinciales y talleres de pensamiento cr\u00edtico.", "theme": "data", "document": null}, {"pk": 3, "sort_order": null, "page": 3, "title": "Taller de Dise\u00f1o Narrativo y Videojuegos Desenchufados", "level": "Inicial", "route": "Videojuegos", "kind": "Kit Did\u00e1ctico \u00b7 Imprimible", "description": "Tarjetas de secuencias l\u00f3gicas y din\u00e1micas l\u00fadicas sin necesidad de pantallas.", "theme": "game", "document": null}, {"pk": 4, "sort_order": null, "page": 3, "title": "Plantilla de Planificaci\u00f3n Interdisciplinaria por Rutas", "level": "Secundario", "route": "Transversal", "kind": "Plantilla Editable", "description": "Matriz para articular espacios curriculares y evaluar competencias digitales.", "theme": "neutral", "document": null}, {"pk": 5, "sort_order": null, "page": 3, "title": "Primeros Pasos en Programaci\u00f3n Creativa con Bloques", "level": "Primario", "route": "Videojuegos", "kind": "Gu\u00eda Paso a Paso", "description": "Proyectos guiados para crear trivias y juegos sobre geograf\u00eda de Tierra del Fuego.", "theme": "game", "document": null}, {"pk": 6, "sort_order": null, "page": 3, "title": "Exploradores de la Naturaleza Austral: Bit\u00e1cora Inicial", "level": "Inicial", "route": "Biotecnolog\u00eda", "kind": "Cuaderno de Campo", "description": "Propuestas de indagaci\u00f3n ambiental adaptadas a salas de 4 y 5 a\u00f1os.", "theme": "bio", "document": null}], "social_links": [{"pk": 1, "sort_order": null, "page": 3, "label": "@aif.tdf", "url": "https://www.facebook.com/aif.tdf", "icon": "ph-fill ph-facebook-logo"}, {"pk": 2, "sort_order": null, "page": 3, "label": "@aif.tdf", "url": "https://www.instagram.com/aif.tdf", "icon": "ph-bold ph-instagram-logo"}, {"pk": 3, "sort_order": null, "page": 3, "label": "@conocimientotdf", "url": "https://www.tiktok.com/@conocimientotdf", "icon": "ph-fill ph-tiktok-logo"}, {"pk": 4, "sort_order": null, "page": 3, "label": "Polos Creativos", "url": "https://polos.aif.gob.ar/", "icon": "ph ph-globe"}, {"pk": 5, "sort_order": null, "page": 3, "label": "Sitio Web AIF", "url": "https://www.aif.gob.ar/", "icon": "ph ph-globe"}, {"pk": 6, "sort_order": null, "page": 3, "label": "Campus Virtual TDF", "url": "https://educaciondigital.tierradelfuego.edu.ar/campusvirtual/login/index.php", "icon": "ph-bold ph-graduation-cap"}]}', N'3', 2, 1, N'Rutas Pedagógicas');
INSERT INTO [wagtailcore_revision] ([id], [created_at], [approved_go_live_at], [user_id], [content], [object_id], [content_type_id], [base_content_type_id], [object_str]) VALUES (9, N'2026-11-19 19:04:47.511035', NULL, 1, N'{"pk": 4, "path": "000100010001", "depth": 3, "numchild": 0, "translation_key": "f996c62b-dce4-46b5-8781-574d67d89ca0", "locale": 1, "latest_revision": 4, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-11-19T19:02:40.500Z", "last_published_at": "2026-11-19T19:02:40.500Z", "live_revision": 4, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Industria del Videojuego", "draft_title": "Industria del Videojuego", "slug": "industria-del-videojuego", "content_type": 60, "url_path": "/home/industria-del-videojuego/", "owner": null, "latest_revision_created_at": "2026-11-19T19:02:40.462Z", "alias_of": null, "show_in_menus": false, "seo_title": "Industria del Videojuego | Rutas Pedag\u00f3gicas", "search_description": "Transforma a los estudiantes en creadores de experiencias interactivas con identidad fueguina, abordando mec\u00e1nicas y prototipado funcional.", "code": "Ruta 01 \u00b7 Rojo", "subtitle": "Dise\u00f1o, narrativa interactiva, arte digital y l\u00f3gica de programaci\u00f3n l\u00fadica.", "summary": "Transforma a los estudiantes en creadores de experiencias interactivas con identidad fueguina, abordando mec\u00e1nicas y prototipado funcional.!!!!!!!!!!!", "theme": "game", "icon": "ph-game-controller", "cuerpo": "<h2 data-block-key=\"sc1iy\">Qu\u00e9 propone esta ruta</h2><p data-block-key=\"p497j\">La ruta de Industria del Videojuego invita a las escuelas a dise\u00f1ar juegos, historias y prototipos con identidad de Tierra del Fuego. El trabajo articula arte digital, narrativa, sonido y pensamiento computacional.</p><h2 data-block-key=\"d98f7\">C\u00f3mo se trabaja</h2><p data-block-key=\"qeahs\">Los equipos avanzan desde el juego desenchufado hasta el prototipo funcional. Cada nivel suma herramientas, pero el eje es el mismo: crear, probar y defender una idea propia.</p>", "enlace_externo": "https://script.google.com/macros/s/AKfycbyCctCBuH-sWa46nHw8gi1xqv3E-fBqFDpWrrd6nkgZbiCQ076z2pHL8-V1r3hLDPu9/exec", "enlace_externo_texto": "Abrir versi\u00f3n original", "wagtail_admin_comments": [], "niveles": [{"pk": 1, "sort_order": null, "page": 4, "level": "Nivel Inicial", "description": "Pensamiento computacional desenchufado, secuencias l\u00f3gicas mediante juego corporal y creaci\u00f3n de historias interactivas ilustradas."}, {"pk": 2, "sort_order": null, "page": 4, "level": "Nivel Primario", "description": "Programaci\u00f3n por bloques (Scratch), dise\u00f1o de personajes inspirados en la fauna fueguina y mec\u00e1nicas b\u00e1sicas de puntaje y niveles."}, {"pk": 3, "sort_order": null, "page": 4, "level": "Nivel Secundario", "description": "Dise\u00f1o de videojuegos 2D/3D, narrativa transmedia, arte pixel/vectorial, sonido y prototipado funcional con defensa en formato Pitch."}], "bloques": [{"pk": 1, "sort_order": 0, "page": 4, "titulo": "Objetivos de aprendizaje", "texto": "<ul><li data-block-key=\"6qipv\">Dise\u00f1ar personajes, escenarios y reglas de juego.</li><li data-block-key=\"73s93\">Traducir una idea en una mec\u00e1nica jugable.</li><li data-block-key=\"fsazh\">Presentar el prototipo en formato pitch.</li></ul>", "enlace": "", "enlace_texto": "", "imagen": null}, {"pk": 2, "sort_order": 1, "page": 4, "titulo": "Recursos y continuidad", "texto": "<p data-block-key=\"eltw0\">Los materiales de la biblioteca y el Campus Virtual complementan esta ruta. El contenido de esta p\u00e1gina se puede actualizar desde el panel de administraci\u00f3n.</p>", "enlace": "", "enlace_texto": "", "imagen": null}]}', N'4', 60, 1, N'Industria del Videojuego');
INSERT INTO [wagtailcore_revision] ([id], [created_at], [approved_go_live_at], [user_id], [content], [object_id], [content_type_id], [base_content_type_id], [object_str]) VALUES (10, N'2026-11-19 19:04:48.170532', NULL, 1, N'{"pk": 4, "path": "000100010001", "depth": 3, "numchild": 0, "translation_key": "f996c62b-dce4-46b5-8781-574d67d89ca0", "locale": 1, "latest_revision": 9, "live": true, "has_unpublished_changes": true, "first_published_at": "2026-11-19T19:02:40.500Z", "last_published_at": "2026-11-19T19:02:40.500Z", "live_revision": 4, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Industria del Videojuego", "draft_title": "Industria del Videojuego", "slug": "industria-del-videojuego", "content_type": 60, "url_path": "/home/industria-del-videojuego/", "owner": null, "latest_revision_created_at": "2026-11-19T19:04:47.511Z", "alias_of": null, "show_in_menus": false, "seo_title": "Industria del Videojuego | Rutas Pedag\u00f3gicas", "search_description": "Transforma a los estudiantes en creadores de experiencias interactivas con identidad fueguina, abordando mec\u00e1nicas y prototipado funcional.", "code": "Ruta 01 \u00b7 Rojo", "subtitle": "Dise\u00f1o, narrativa interactiva, arte digital y l\u00f3gica de programaci\u00f3n l\u00fadica.", "summary": "Transforma a los estudiantes en creadores de experiencias interactivas con identidad fueguina, abordando mec\u00e1nicas y prototipado funcional.!!!!!!!!!!!", "theme": "game", "icon": "ph-game-controller", "cuerpo": "<h2 data-block-key=\"sc1iy\">Qu\u00e9 propone esta ruta</h2><p data-block-key=\"p497j\">La ruta de Industria del Videojuego invita a las escuelas a dise\u00f1ar juegos, historias y prototipos con identidad de Tierra del Fuego. El trabajo articula arte digital, narrativa, sonido y pensamiento computacional.</p><h2 data-block-key=\"d98f7\">C\u00f3mo se trabaja</h2><p data-block-key=\"qeahs\">Los equipos avanzan desde el juego desenchufado hasta el prototipo funcional. Cada nivel suma herramientas, pero el eje es el mismo: crear, probar y defender una idea propia.</p>", "enlace_externo": "https://script.google.com/macros/s/AKfycbyCctCBuH-sWa46nHw8gi1xqv3E-fBqFDpWrrd6nkgZbiCQ076z2pHL8-V1r3hLDPu9/exec", "enlace_externo_texto": "Abrir versi\u00f3n original", "wagtail_admin_comments": [], "niveles": [{"pk": 1, "sort_order": 0, "page": 4, "level": "Nivel Inicial", "description": "Pensamiento computacional desenchufado, secuencias l\u00f3gicas mediante juego corporal y creaci\u00f3n de historias interactivas ilustradas."}, {"pk": 2, "sort_order": 1, "page": 4, "level": "Nivel Primario", "description": "Programaci\u00f3n por bloques (Scratch), dise\u00f1o de personajes inspirados en la fauna fueguina y mec\u00e1nicas b\u00e1sicas de puntaje y niveles."}, {"pk": 3, "sort_order": 2, "page": 4, "level": "Nivel Secundario", "description": "Dise\u00f1o de videojuegos 2D/3D, narrativa transmedia, arte pixel/vectorial, sonido y prototipado funcional con defensa en formato Pitch."}], "bloques": [{"pk": 1, "sort_order": 0, "page": 4, "titulo": "Objetivos de aprendizaje", "texto": "<ul><li data-block-key=\"6qipv\">Dise\u00f1ar personajes, escenarios y reglas de juego.</li><li data-block-key=\"73s93\">Traducir una idea en una mec\u00e1nica jugable.</li><li data-block-key=\"fsazh\">Presentar el prototipo en formato pitch.</li></ul>", "enlace": "", "enlace_texto": "", "imagen": null}, {"pk": 2, "sort_order": 1, "page": 4, "titulo": "Recursos y continuidad", "texto": "<p data-block-key=\"eltw0\">Los materiales de la biblioteca y el Campus Virtual complementan esta ruta. El contenido de esta p\u00e1gina se puede actualizar desde el panel de administraci\u00f3n.</p>", "enlace": "", "enlace_texto": "", "imagen": null}]}', N'4', 60, 1, N'Industria del Videojuego');
INSERT INTO [wagtailcore_revision] ([id], [created_at], [approved_go_live_at], [user_id], [content], [object_id], [content_type_id], [base_content_type_id], [object_str]) VALUES (11, N'2026-11-19 19:10:04.181962', NULL, NULL, N'{"pk": 4, "path": "000100010001", "depth": 3, "numchild": 0, "translation_key": "f996c62b-dce4-46b5-8781-574d67d89ca0", "locale": 1, "latest_revision": 10, "live": true, "has_unpublished_changes": true, "first_published_at": "2026-11-19T19:02:40.500Z", "last_published_at": "2026-11-19T19:02:40.500Z", "live_revision": 4, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Industria del Videojuego", "draft_title": "Industria del Videojuego", "slug": "industria-del-videojuego", "content_type": 60, "url_path": "/home/industria-del-videojuego/", "owner": null, "latest_revision_created_at": "2026-11-19T19:04:48.170Z", "alias_of": null, "show_in_menus": false, "seo_title": "Industria del Videojuego | Rutas Pedag\u00f3gicas", "search_description": "Transforma a los estudiantes en creadores de experiencias interactivas con identidad fueguina, abordando mec\u00e1nicas y prototipado funcional.", "code": "Ruta 01 \u00b7 Rojo", "subtitle": "Dise\u00f1o, narrativa interactiva, arte digital y l\u00f3gica de programaci\u00f3n l\u00fadica.", "summary": "Cambio publicado desde el panel: la ruta de videojuegos se edita ac\u00e1.", "theme": "game", "icon": "ph-game-controller", "cuerpo": "<h2>Qu\u00e9 propone esta ruta</h2><p>La ruta de Industria del Videojuego invita a las escuelas a dise\u00f1ar juegos, historias y prototipos con identidad de Tierra del Fuego. El trabajo articula arte digital, narrativa, sonido y pensamiento computacional.</p><h2>C\u00f3mo se trabaja</h2><p>Los equipos avanzan desde el juego desenchufado hasta el prototipo funcional. Cada nivel suma herramientas, pero el eje es el mismo: crear, probar y defender una idea propia.</p>", "enlace_externo": "", "enlace_externo_texto": "Abrir versi\u00f3n original", "wagtail_admin_comments": [], "niveles": [{"pk": 1, "sort_order": null, "page": 4, "level": "Nivel Inicial", "description": "Pensamiento computacional desenchufado, secuencias l\u00f3gicas mediante juego corporal y creaci\u00f3n de historias interactivas ilustradas."}, {"pk": 2, "sort_order": null, "page": 4, "level": "Nivel Primario", "description": "Programaci\u00f3n por bloques (Scratch), dise\u00f1o de personajes inspirados en la fauna fueguina y mec\u00e1nicas b\u00e1sicas de puntaje y niveles."}, {"pk": 3, "sort_order": null, "page": 4, "level": "Nivel Secundario", "description": "Dise\u00f1o de videojuegos 2D/3D, narrativa transmedia, arte pixel/vectorial, sonido y prototipado funcional con defensa en formato Pitch."}], "bloques": [{"pk": 1, "sort_order": null, "page": 4, "titulo": "Objetivos de aprendizaje", "texto": "<ul><li>Dise\u00f1ar personajes, escenarios y reglas de juego.</li><li>Traducir una idea en una mec\u00e1nica jugable.</li><li>Presentar el prototipo en formato pitch.</li></ul>", "enlace": "", "enlace_texto": "", "imagen": null}, {"pk": 2, "sort_order": null, "page": 4, "titulo": "Recursos y continuidad", "texto": "<p>Los materiales de la biblioteca y el Campus Virtual complementan esta ruta. El contenido de esta p\u00e1gina se puede actualizar desde el panel de administraci\u00f3n.</p>", "enlace": "", "enlace_texto": "", "imagen": null}]}', N'4', 60, 1, N'Industria del Videojuego');
INSERT INTO [wagtailcore_revision] ([id], [created_at], [approved_go_live_at], [user_id], [content], [object_id], [content_type_id], [base_content_type_id], [object_str]) VALUES (12, N'2026-11-19 19:10:19.526510', NULL, NULL, N'{"pk": 4, "path": "000100010001", "depth": 3, "numchild": 0, "translation_key": "f996c62b-dce4-46b5-8781-574d67d89ca0", "locale": 1, "latest_revision": 11, "live": true, "has_unpublished_changes": false, "first_published_at": "2026-11-19T19:02:40.500Z", "last_published_at": "2026-11-19T19:10:04.410Z", "live_revision": 11, "go_live_at": null, "expire_at": null, "expired": false, "locked": false, "locked_at": null, "locked_by": null, "title": "Industria del Videojuego", "draft_title": "Industria del Videojuego", "slug": "industria-del-videojuego", "content_type": 60, "url_path": "/home/industria-del-videojuego/", "owner": null, "latest_revision_created_at": "2026-11-19T19:10:04.181Z", "alias_of": null, "show_in_menus": false, "seo_title": "Industria del Videojuego | Rutas Pedag\u00f3gicas", "search_description": "Transforma a los estudiantes en creadores de experiencias interactivas con identidad fueguina, abordando mec\u00e1nicas y prototipado funcional.", "code": "Ruta 01 \u00b7 Rojo", "subtitle": "Dise\u00f1o, narrativa interactiva, arte digital y l\u00f3gica de programaci\u00f3n l\u00fadica.", "summary": "Transforma a los estudiantes en creadores de experiencias interactivas con identidad fueguina, abordando mec\u00e1nicas y prototipado funcional.", "theme": "game", "icon": "ph-game-controller", "cuerpo": "<h2>Qu\u00e9 propone esta ruta</h2><p>La ruta de Industria del Videojuego invita a las escuelas a dise\u00f1ar juegos, historias y prototipos con identidad de Tierra del Fuego. El trabajo articula arte digital, narrativa, sonido y pensamiento computacional.</p><h2>C\u00f3mo se trabaja</h2><p>Los equipos avanzan desde el juego desenchufado hasta el prototipo funcional. Cada nivel suma herramientas, pero el eje es el mismo: crear, probar y defender una idea propia.</p>", "enlace_externo": "", "enlace_externo_texto": "Abrir versi\u00f3n original", "wagtail_admin_comments": [], "niveles": [{"pk": 1, "sort_order": null, "page": 4, "level": "Nivel Inicial", "description": "Pensamiento computacional desenchufado, secuencias l\u00f3gicas mediante juego corporal y creaci\u00f3n de historias interactivas ilustradas."}, {"pk": 2, "sort_order": null, "page": 4, "level": "Nivel Primario", "description": "Programaci\u00f3n por bloques (Scratch), dise\u00f1o de personajes inspirados en la fauna fueguina y mec\u00e1nicas b\u00e1sicas de puntaje y niveles."}, {"pk": 3, "sort_order": null, "page": 4, "level": "Nivel Secundario", "description": "Dise\u00f1o de videojuegos 2D/3D, narrativa transmedia, arte pixel/vectorial, sonido y prototipado funcional con defensa en formato Pitch."}], "bloques": [{"pk": 1, "sort_order": null, "page": 4, "titulo": "Objetivos de aprendizaje", "texto": "<ul><li>Dise\u00f1ar personajes, escenarios y reglas de juego.</li><li>Traducir una idea en una mec\u00e1nica jugable.</li><li>Presentar el prototipo en formato pitch.</li></ul>", "enlace": "", "enlace_texto": "", "imagen": null}, {"pk": 2, "sort_order": null, "page": 4, "titulo": "Recursos y continuidad", "texto": "<p>Los materiales de la biblioteca y el Campus Virtual complementan esta ruta. El contenido de esta p\u00e1gina se puede actualizar desde el panel de administraci\u00f3n.</p>", "enlace": "", "enlace_texto": "", "imagen": null}]}', N'4', 60, 1, N'Industria del Videojuego');
SET IDENTITY_INSERT [wagtailcore_revision] OFF;
DECLARE @max_wagtailcore_revision BIGINT; SELECT @max_wagtailcore_revision = ISNULL(MAX([id]), 0) FROM [wagtailcore_revision];
IF @max_wagtailcore_revision > 0 DBCC CHECKIDENT (N'dbo.wagtailcore_revision', RESEED, @max_wagtailcore_revision);
GO

-- wagtailcore_site: 1 filas
SET IDENTITY_INSERT [wagtailcore_site] ON;
INSERT INTO [wagtailcore_site] ([id], [hostname], [port], [is_default_site], [root_page_id], [site_name]) VALUES (2, N'localhost', 80, 1, 3, N'');
SET IDENTITY_INSERT [wagtailcore_site] OFF;
DECLARE @max_wagtailcore_site BIGINT; SELECT @max_wagtailcore_site = ISNULL(MAX([id]), 0) FROM [wagtailcore_site];
IF @max_wagtailcore_site > 0 DBCC CHECKIDENT (N'dbo.wagtailcore_site', RESEED, @max_wagtailcore_site);
GO

-- wagtailcore_task: 1 filas
SET IDENTITY_INSERT [wagtailcore_task] ON;
INSERT INTO [wagtailcore_task] ([id], [name], [active], [content_type_id]) VALUES (1, N'Moderators approval', 1, 4);
SET IDENTITY_INSERT [wagtailcore_task] OFF;
DECLARE @max_wagtailcore_task BIGINT; SELECT @max_wagtailcore_task = ISNULL(MAX([id]), 0) FROM [wagtailcore_task];
IF @max_wagtailcore_task > 0 DBCC CHECKIDENT (N'dbo.wagtailcore_task', RESEED, @max_wagtailcore_task);
GO

-- wagtailcore_taskstate: 0 filas

-- wagtailcore_uploadedfile: 0 filas

-- wagtailcore_workflow: 1 filas
SET IDENTITY_INSERT [wagtailcore_workflow] ON;
INSERT INTO [wagtailcore_workflow] ([id], [name], [active]) VALUES (1, N'Moderators approval', 1);
SET IDENTITY_INSERT [wagtailcore_workflow] OFF;
DECLARE @max_wagtailcore_workflow BIGINT; SELECT @max_wagtailcore_workflow = ISNULL(MAX([id]), 0) FROM [wagtailcore_workflow];
IF @max_wagtailcore_workflow > 0 DBCC CHECKIDENT (N'dbo.wagtailcore_workflow', RESEED, @max_wagtailcore_workflow);
GO

-- wagtailcore_workflowcontenttype: 0 filas

-- wagtailcore_workflowpage: 1 filas
SET IDENTITY_INSERT [wagtailcore_workflowpage] ON;
INSERT INTO [wagtailcore_workflowpage] ([page_id], [workflow_id]) VALUES (1, 1);
SET IDENTITY_INSERT [wagtailcore_workflowpage] OFF;
DECLARE @max_wagtailcore_workflowpage BIGINT; SELECT @max_wagtailcore_workflowpage = ISNULL(MAX([page_id]), 0) FROM [wagtailcore_workflowpage];
IF @max_wagtailcore_workflowpage > 0 DBCC CHECKIDENT (N'dbo.wagtailcore_workflowpage', RESEED, @max_wagtailcore_workflowpage);
GO

-- wagtailcore_workflowstate: 0 filas

-- wagtailcore_workflowtask: 1 filas
SET IDENTITY_INSERT [wagtailcore_workflowtask] ON;
INSERT INTO [wagtailcore_workflowtask] ([id], [sort_order], [task_id], [workflow_id]) VALUES (1, 0, 1, 1);
SET IDENTITY_INSERT [wagtailcore_workflowtask] OFF;
DECLARE @max_wagtailcore_workflowtask BIGINT; SELECT @max_wagtailcore_workflowtask = ISNULL(MAX([id]), 0) FROM [wagtailcore_workflowtask];
IF @max_wagtailcore_workflowtask > 0 DBCC CHECKIDENT (N'dbo.wagtailcore_workflowtask', RESEED, @max_wagtailcore_workflowtask);
GO

-- wagtaildocs_document: 0 filas

-- wagtailembeds_embed: 0 filas

-- wagtailforms_formsubmission: 0 filas

-- wagtailimages_image: 0 filas

-- wagtailimages_rendition: 0 filas

-- wagtailredirects_redirect: 0 filas

-- wagtailsearch_indexentry: 5 filas
SET IDENTITY_INSERT [wagtailsearch_indexentry] ON;
INSERT INTO [wagtailsearch_indexentry] ([id], [object_id], [title_norm], [content_type_id], [autocomplete], [body], [title]) VALUES (1, N'3', 1.2058823529411764, 2, N'Rutas Pedagógicas', N'', N'Rutas Pedagógicas');
INSERT INTO [wagtailsearch_indexentry] ([id], [object_id], [title_norm], [content_type_id], [autocomplete], [body], [title]) VALUES (2, N'4', 0.8541666666666666, 60, N'Industria del Videojuego', N'', N'Industria del Videojuego');
INSERT INTO [wagtailsearch_indexentry] ([id], [object_id], [title_norm], [content_type_id], [autocomplete], [body], [title]) VALUES (3, N'5', 0.6587301587301587, 60, N'Ciencia de Datos e Inteligencia Artificial', N'', N'Ciencia de Datos e Inteligencia Artificial');
INSERT INTO [wagtailsearch_indexentry] ([id], [object_id], [title_norm], [content_type_id], [autocomplete], [body], [title]) VALUES (4, N'6', 1.0185185185185186, 60, N'Biotecnología y Bioeconomía', N'', N'Biotecnología y Bioeconomía');
INSERT INTO [wagtailsearch_indexentry] ([id], [object_id], [title_norm], [content_type_id], [autocomplete], [body], [title]) VALUES (5, N'7', 2.033333333333333, 61, N'Descubrí más', N'', N'Descubrí más');
SET IDENTITY_INSERT [wagtailsearch_indexentry] OFF;
DECLARE @max_wagtailsearch_indexentry BIGINT; SELECT @max_wagtailsearch_indexentry = ISNULL(MAX([id]), 0) FROM [wagtailsearch_indexentry];
IF @max_wagtailsearch_indexentry > 0 DBCC CHECKIDENT (N'dbo.wagtailsearch_indexentry', RESEED, @max_wagtailsearch_indexentry);
GO

-- wagtailusers_userprofile: 1 filas
SET IDENTITY_INSERT [wagtailusers_userprofile] ON;
INSERT INTO [wagtailusers_userprofile] ([id], [submitted_notifications], [approved_notifications], [rejected_notifications], [user_id], [preferred_language], [current_time_zone], [avatar], [updated_comments_notifications], [dismissibles], [theme], [density], [contrast], [keyboard_shortcuts]) VALUES (1, 1, 1, 1, 1, N'', N'', N'', 1, N'{"last_upgrade_check": 8.1}', N'system', N'default', N'system', 1);
SET IDENTITY_INSERT [wagtailusers_userprofile] OFF;
DECLARE @max_wagtailusers_userprofile BIGINT; SELECT @max_wagtailusers_userprofile = ISNULL(MAX([id]), 0) FROM [wagtailusers_userprofile];
IF @max_wagtailusers_userprofile > 0 DBCC CHECKIDENT (N'dbo.wagtailusers_userprofile', RESEED, @max_wagtailusers_userprofile);
GO

ALTER TABLE [auth_group_permissions] WITH NOCHECK ADD CONSTRAINT [FK_auth_group_permissions_permission_id_1] FOREIGN KEY ([permission_id]) REFERENCES [auth_permission] ([id]) ON DELETE NO ACTION;
ALTER TABLE [auth_group_permissions] WITH NOCHECK ADD CONSTRAINT [FK_auth_group_permissions_group_id_2] FOREIGN KEY ([group_id]) REFERENCES [auth_group] ([id]) ON DELETE NO ACTION;
ALTER TABLE [auth_permission] WITH NOCHECK ADD CONSTRAINT [FK_auth_permission_content_type_id_3] FOREIGN KEY ([content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [auth_user_groups] WITH NOCHECK ADD CONSTRAINT [FK_auth_user_groups_group_id_4] FOREIGN KEY ([group_id]) REFERENCES [auth_group] ([id]) ON DELETE NO ACTION;
ALTER TABLE [auth_user_groups] WITH NOCHECK ADD CONSTRAINT [FK_auth_user_groups_user_id_5] FOREIGN KEY ([user_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [auth_user_user_permissions] WITH NOCHECK ADD CONSTRAINT [FK_auth_user_user_permissions_permission_id_6] FOREIGN KEY ([permission_id]) REFERENCES [auth_permission] ([id]) ON DELETE NO ACTION;
ALTER TABLE [auth_user_user_permissions] WITH NOCHECK ADD CONSTRAINT [FK_auth_user_user_permissions_user_id_7] FOREIGN KEY ([user_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [django_admin_log] WITH NOCHECK ADD CONSTRAINT [FK_django_admin_log_user_id_8] FOREIGN KEY ([user_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [django_admin_log] WITH NOCHECK ADD CONSTRAINT [FK_django_admin_log_content_type_id_9] FOREIGN KEY ([content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [home_citystat] WITH NOCHECK ADD CONSTRAINT [FK_home_citystat_page_id_10] FOREIGN KEY ([page_id]) REFERENCES [home_homepage] ([page_ptr_id]) ON DELETE NO ACTION;
ALTER TABLE [home_contenidopage] WITH NOCHECK ADD CONSTRAINT [FK_home_contenidopage_video_archivo_id_11] FOREIGN KEY ([video_archivo_id]) REFERENCES [wagtaildocs_document] ([id]) ON DELETE NO ACTION;
ALTER TABLE [home_contenidopage] WITH NOCHECK ADD CONSTRAINT [FK_home_contenidopage_imagen_id_12] FOREIGN KEY ([imagen_id]) REFERENCES [wagtailimages_image] ([id]) ON DELETE NO ACTION;
ALTER TABLE [home_contenidopage] WITH NOCHECK ADD CONSTRAINT [FK_home_contenidopage_page_ptr_id_13] FOREIGN KEY ([page_ptr_id]) REFERENCES [wagtailcore_page] ([id]) ON DELETE NO ACTION;
ALTER TABLE [home_descubrimaspage] WITH NOCHECK ADD CONSTRAINT [FK_home_descubrimaspage_imagen_id_14] FOREIGN KEY ([imagen_id]) REFERENCES [wagtailimages_image] ([id]) ON DELETE NO ACTION;
ALTER TABLE [home_descubrimaspage] WITH NOCHECK ADD CONSTRAINT [FK_home_descubrimaspage_page_ptr_id_15] FOREIGN KEY ([page_ptr_id]) REFERENCES [wagtailcore_page] ([id]) ON DELETE NO ACTION;
ALTER TABLE [home_explorarbloque] WITH NOCHECK ADD CONSTRAINT [FK_home_explorarbloque_page_id_16] FOREIGN KEY ([page_id]) REFERENCES [home_descubrimaspage] ([page_ptr_id]) ON DELETE NO ACTION;
ALTER TABLE [home_explorarbloque] WITH NOCHECK ADD CONSTRAINT [FK_home_explorarbloque_imagen_id_17] FOREIGN KEY ([imagen_id]) REFERENCES [wagtailimages_image] ([id]) ON DELETE NO ACTION;
ALTER TABLE [home_galleryitem] WITH NOCHECK ADD CONSTRAINT [FK_home_galleryitem_page_id_18] FOREIGN KEY ([page_id]) REFERENCES [home_homepage] ([page_ptr_id]) ON DELETE NO ACTION;
ALTER TABLE [home_galleryitem] WITH NOCHECK ADD CONSTRAINT [FK_home_galleryitem_image_id_19] FOREIGN KEY ([image_id]) REFERENCES [wagtailimages_image] ([id]) ON DELETE NO ACTION;
ALTER TABLE [home_heroslide] WITH NOCHECK ADD CONSTRAINT [FK_home_heroslide_page_id_20] FOREIGN KEY ([page_id]) REFERENCES [home_homepage] ([page_ptr_id]) ON DELETE NO ACTION;
ALTER TABLE [home_heroslide] WITH NOCHECK ADD CONSTRAINT [FK_home_heroslide_image_id_21] FOREIGN KEY ([image_id]) REFERENCES [wagtailimages_image] ([id]) ON DELETE NO ACTION;
ALTER TABLE [home_homepage] WITH NOCHECK ADD CONSTRAINT [FK_home_homepage_cta_pagina_id_22] FOREIGN KEY ([cta_pagina_id]) REFERENCES [wagtailcore_page] ([id]) ON DELETE NO ACTION;
ALTER TABLE [home_homepage] WITH NOCHECK ADD CONSTRAINT [FK_home_homepage_informe_id_23] FOREIGN KEY ([informe_id]) REFERENCES [wagtaildocs_document] ([id]) ON DELETE NO ACTION;
ALTER TABLE [home_homepage] WITH NOCHECK ADD CONSTRAINT [FK_home_homepage_page_ptr_id_24] FOREIGN KEY ([page_ptr_id]) REFERENCES [wagtailcore_page] ([id]) ON DELETE NO ACTION;
ALTER TABLE [home_metric] WITH NOCHECK ADD CONSTRAINT [FK_home_metric_page_id_25] FOREIGN KEY ([page_id]) REFERENCES [home_homepage] ([page_ptr_id]) ON DELETE NO ACTION;
ALTER TABLE [home_resource] WITH NOCHECK ADD CONSTRAINT [FK_home_resource_page_id_26] FOREIGN KEY ([page_id]) REFERENCES [home_homepage] ([page_ptr_id]) ON DELETE NO ACTION;
ALTER TABLE [home_resource] WITH NOCHECK ADD CONSTRAINT [FK_home_resource_document_id_27] FOREIGN KEY ([document_id]) REFERENCES [wagtaildocs_document] ([id]) ON DELETE NO ACTION;
ALTER TABLE [home_route] WITH NOCHECK ADD CONSTRAINT [FK_home_route_pagina_id_28] FOREIGN KEY ([pagina_id]) REFERENCES [wagtailcore_page] ([id]) ON DELETE NO ACTION;
ALTER TABLE [home_route] WITH NOCHECK ADD CONSTRAINT [FK_home_route_page_id_29] FOREIGN KEY ([page_id]) REFERENCES [home_homepage] ([page_ptr_id]) ON DELETE NO ACTION;
ALTER TABLE [home_routelevel] WITH NOCHECK ADD CONSTRAINT [FK_home_routelevel_route_id_30] FOREIGN KEY ([route_id]) REFERENCES [home_route] ([id]) ON DELETE NO ACTION;
ALTER TABLE [home_rutabloque] WITH NOCHECK ADD CONSTRAINT [FK_home_rutabloque_page_id_31] FOREIGN KEY ([page_id]) REFERENCES [home_rutatematicapage] ([page_ptr_id]) ON DELETE NO ACTION;
ALTER TABLE [home_rutabloque] WITH NOCHECK ADD CONSTRAINT [FK_home_rutabloque_imagen_id_32] FOREIGN KEY ([imagen_id]) REFERENCES [wagtailimages_image] ([id]) ON DELETE NO ACTION;
ALTER TABLE [home_rutanivel] WITH NOCHECK ADD CONSTRAINT [FK_home_rutanivel_page_id_33] FOREIGN KEY ([page_id]) REFERENCES [home_rutatematicapage] ([page_ptr_id]) ON DELETE NO ACTION;
ALTER TABLE [home_rutatematicapage] WITH NOCHECK ADD CONSTRAINT [FK_home_rutatematicapage_page_ptr_id_34] FOREIGN KEY ([page_ptr_id]) REFERENCES [wagtailcore_page] ([id]) ON DELETE NO ACTION;
ALTER TABLE [home_school] WITH NOCHECK ADD CONSTRAINT [FK_home_school_page_id_35] FOREIGN KEY ([page_id]) REFERENCES [home_homepage] ([page_ptr_id]) ON DELETE NO ACTION;
ALTER TABLE [home_sociallink] WITH NOCHECK ADD CONSTRAINT [FK_home_sociallink_page_id_36] FOREIGN KEY ([page_id]) REFERENCES [home_homepage] ([page_ptr_id]) ON DELETE NO ACTION;
ALTER TABLE [home_testimonial] WITH NOCHECK ADD CONSTRAINT [FK_home_testimonial_page_id_37] FOREIGN KEY ([page_id]) REFERENCES [home_homepage] ([page_ptr_id]) ON DELETE NO ACTION;
ALTER TABLE [taggit_taggeditem] WITH NOCHECK ADD CONSTRAINT [FK_taggit_taggeditem_tag_id_38] FOREIGN KEY ([tag_id]) REFERENCES [taggit_tag] ([id]) ON DELETE NO ACTION;
ALTER TABLE [taggit_taggeditem] WITH NOCHECK ADD CONSTRAINT [FK_taggit_taggeditem_content_type_id_39] FOREIGN KEY ([content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailadmin_editingsession] WITH NOCHECK ADD CONSTRAINT [FK_wagtailadmin_editingsession_user_id_40] FOREIGN KEY ([user_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailadmin_editingsession] WITH NOCHECK ADD CONSTRAINT [FK_wagtailadmin_editingsession_content_type_id_41] FOREIGN KEY ([content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailadmin_formstate] WITH NOCHECK ADD CONSTRAINT [FK_wagtailadmin_formstate_user_id_42] FOREIGN KEY ([user_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailadmin_formstate] WITH NOCHECK ADD CONSTRAINT [FK_wagtailadmin_formstate_content_type_id_43] FOREIGN KEY ([content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_apitoken] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_apitoken_user_id_44] FOREIGN KEY ([user_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_collectionviewrestriction] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_collectionviewrestriction_collection_id_45] FOREIGN KEY ([collection_id]) REFERENCES [wagtailcore_collection] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_collectionviewrestriction_groups] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_collectionviewrestriction_groups_group_id_46] FOREIGN KEY ([group_id]) REFERENCES [auth_group] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_collectionviewrestriction_groups] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_collectionviewrestriction_groups_collectionviewrestriction_id_47] FOREIGN KEY ([collectionviewrestriction_id]) REFERENCES [wagtailcore_collectionviewrestriction] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_comment] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_comment_user_id_48] FOREIGN KEY ([user_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_comment] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_comment_revision_created_id_49] FOREIGN KEY ([revision_created_id]) REFERENCES [wagtailcore_revision] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_comment] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_comment_resolved_by_id_50] FOREIGN KEY ([resolved_by_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_comment] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_comment_page_id_51] FOREIGN KEY ([page_id]) REFERENCES [wagtailcore_page] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_commentreply] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_commentreply_user_id_52] FOREIGN KEY ([user_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_commentreply] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_commentreply_comment_id_53] FOREIGN KEY ([comment_id]) REFERENCES [wagtailcore_comment] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_groupapprovaltask] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_groupapprovaltask_task_ptr_id_54] FOREIGN KEY ([task_ptr_id]) REFERENCES [wagtailcore_task] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_groupapprovaltask_groups] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_groupapprovaltask_groups_group_id_55] FOREIGN KEY ([group_id]) REFERENCES [auth_group] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_groupapprovaltask_groups] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_groupapprovaltask_groups_groupapprovaltask_id_56] FOREIGN KEY ([groupapprovaltask_id]) REFERENCES [wagtailcore_groupapprovaltask] ([task_ptr_id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_groupcollectionpermission] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_groupcollectionpermission_permission_id_57] FOREIGN KEY ([permission_id]) REFERENCES [auth_permission] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_groupcollectionpermission] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_groupcollectionpermission_group_id_58] FOREIGN KEY ([group_id]) REFERENCES [auth_group] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_groupcollectionpermission] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_groupcollectionpermission_collection_id_59] FOREIGN KEY ([collection_id]) REFERENCES [wagtailcore_collection] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_grouppagepermission] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_grouppagepermission_permission_id_60] FOREIGN KEY ([permission_id]) REFERENCES [auth_permission] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_grouppagepermission] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_grouppagepermission_page_id_61] FOREIGN KEY ([page_id]) REFERENCES [wagtailcore_page] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_grouppagepermission] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_grouppagepermission_group_id_62] FOREIGN KEY ([group_id]) REFERENCES [auth_group] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_groupsitepermission] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_groupsitepermission_site_id_63] FOREIGN KEY ([site_id]) REFERENCES [wagtailcore_site] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_groupsitepermission] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_groupsitepermission_permission_id_64] FOREIGN KEY ([permission_id]) REFERENCES [auth_permission] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_groupsitepermission] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_groupsitepermission_group_id_65] FOREIGN KEY ([group_id]) REFERENCES [auth_group] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_modellogentry] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_modellogentry_content_type_id_66] FOREIGN KEY ([content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_page] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_page_latest_revision_id_67] FOREIGN KEY ([latest_revision_id]) REFERENCES [wagtailcore_revision] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_page] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_page_alias_of_id_68] FOREIGN KEY ([alias_of_id]) REFERENCES [wagtailcore_page] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_page] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_page_locale_id_69] FOREIGN KEY ([locale_id]) REFERENCES [wagtailcore_locale] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_page] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_page_locked_by_id_70] FOREIGN KEY ([locked_by_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_page] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_page_live_revision_id_71] FOREIGN KEY ([live_revision_id]) REFERENCES [wagtailcore_revision] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_page] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_page_owner_id_72] FOREIGN KEY ([owner_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_page] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_page_content_type_id_73] FOREIGN KEY ([content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_pagelogentry] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_pagelogentry_content_type_id_74] FOREIGN KEY ([content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_pagesubscription] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_pagesubscription_user_id_75] FOREIGN KEY ([user_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_pagesubscription] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_pagesubscription_page_id_76] FOREIGN KEY ([page_id]) REFERENCES [wagtailcore_page] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_pageviewrestriction] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_pageviewrestriction_page_id_77] FOREIGN KEY ([page_id]) REFERENCES [wagtailcore_page] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_pageviewrestriction_groups] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_pageviewrestriction_groups_group_id_78] FOREIGN KEY ([group_id]) REFERENCES [auth_group] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_pageviewrestriction_groups] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_pageviewrestriction_groups_pageviewrestriction_id_79] FOREIGN KEY ([pageviewrestriction_id]) REFERENCES [wagtailcore_pageviewrestriction] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_referenceindex] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_referenceindex_to_content_type_id_80] FOREIGN KEY ([to_content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_referenceindex] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_referenceindex_content_type_id_81] FOREIGN KEY ([content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_referenceindex] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_referenceindex_base_content_type_id_82] FOREIGN KEY ([base_content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_revision] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_revision_base_content_type_id_83] FOREIGN KEY ([base_content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_revision] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_revision_content_type_id_84] FOREIGN KEY ([content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_revision] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_revision_user_id_85] FOREIGN KEY ([user_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_site] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_site_root_page_id_86] FOREIGN KEY ([root_page_id]) REFERENCES [wagtailcore_page] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_task] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_task_content_type_id_87] FOREIGN KEY ([content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_taskstate] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_taskstate_revision_id_88] FOREIGN KEY ([revision_id]) REFERENCES [wagtailcore_revision] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_taskstate] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_taskstate_finished_by_id_89] FOREIGN KEY ([finished_by_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_taskstate] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_taskstate_workflow_state_id_90] FOREIGN KEY ([workflow_state_id]) REFERENCES [wagtailcore_workflowstate] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_taskstate] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_taskstate_task_id_91] FOREIGN KEY ([task_id]) REFERENCES [wagtailcore_task] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_taskstate] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_taskstate_content_type_id_92] FOREIGN KEY ([content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_uploadedfile] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_uploadedfile_uploaded_by_user_id_93] FOREIGN KEY ([uploaded_by_user_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_uploadedfile] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_uploadedfile_for_content_type_id_94] FOREIGN KEY ([for_content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_workflowcontenttype] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_workflowcontenttype_workflow_id_95] FOREIGN KEY ([workflow_id]) REFERENCES [wagtailcore_workflow] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_workflowcontenttype] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_workflowcontenttype_content_type_id_96] FOREIGN KEY ([content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_workflowpage] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_workflowpage_workflow_id_97] FOREIGN KEY ([workflow_id]) REFERENCES [wagtailcore_workflow] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_workflowpage] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_workflowpage_page_id_98] FOREIGN KEY ([page_id]) REFERENCES [wagtailcore_page] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_workflowstate] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_workflowstate_content_type_id_99] FOREIGN KEY ([content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_workflowstate] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_workflowstate_base_content_type_id_100] FOREIGN KEY ([base_content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_workflowstate] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_workflowstate_workflow_id_101] FOREIGN KEY ([workflow_id]) REFERENCES [wagtailcore_workflow] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_workflowstate] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_workflowstate_requested_by_id_102] FOREIGN KEY ([requested_by_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_workflowstate] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_workflowstate_current_task_state_id_103] FOREIGN KEY ([current_task_state_id]) REFERENCES [wagtailcore_taskstate] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_workflowtask] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_workflowtask_workflow_id_104] FOREIGN KEY ([workflow_id]) REFERENCES [wagtailcore_workflow] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailcore_workflowtask] WITH NOCHECK ADD CONSTRAINT [FK_wagtailcore_workflowtask_task_id_105] FOREIGN KEY ([task_id]) REFERENCES [wagtailcore_task] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtaildocs_document] WITH NOCHECK ADD CONSTRAINT [FK_wagtaildocs_document_collection_id_106] FOREIGN KEY ([collection_id]) REFERENCES [wagtailcore_collection] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtaildocs_document] WITH NOCHECK ADD CONSTRAINT [FK_wagtaildocs_document_uploaded_by_user_id_107] FOREIGN KEY ([uploaded_by_user_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailforms_formsubmission] WITH NOCHECK ADD CONSTRAINT [FK_wagtailforms_formsubmission_page_id_108] FOREIGN KEY ([page_id]) REFERENCES [wagtailcore_page] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailimages_image] WITH NOCHECK ADD CONSTRAINT [FK_wagtailimages_image_collection_id_109] FOREIGN KEY ([collection_id]) REFERENCES [wagtailcore_collection] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailimages_image] WITH NOCHECK ADD CONSTRAINT [FK_wagtailimages_image_uploaded_by_user_id_110] FOREIGN KEY ([uploaded_by_user_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailimages_rendition] WITH NOCHECK ADD CONSTRAINT [FK_wagtailimages_rendition_image_id_111] FOREIGN KEY ([image_id]) REFERENCES [wagtailimages_image] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailredirects_redirect] WITH NOCHECK ADD CONSTRAINT [FK_wagtailredirects_redirect_site_id_112] FOREIGN KEY ([site_id]) REFERENCES [wagtailcore_site] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailredirects_redirect] WITH NOCHECK ADD CONSTRAINT [FK_wagtailredirects_redirect_redirect_page_id_113] FOREIGN KEY ([redirect_page_id]) REFERENCES [wagtailcore_page] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailsearch_indexentry] WITH NOCHECK ADD CONSTRAINT [FK_wagtailsearch_indexentry_content_type_id_114] FOREIGN KEY ([content_type_id]) REFERENCES [django_content_type] ([id]) ON DELETE NO ACTION;
ALTER TABLE [wagtailusers_userprofile] WITH NOCHECK ADD CONSTRAINT [FK_wagtailusers_userprofile_user_id_115] FOREIGN KEY ([user_id]) REFERENCES [auth_user] ([id]) ON DELETE NO ACTION;
GO

PRINT N'Volcado completado.';
