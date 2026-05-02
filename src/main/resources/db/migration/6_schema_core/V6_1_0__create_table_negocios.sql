-- TABLA: negocios
-- DEPENDE DE: La tabla de categorias
-- Descripción: Entidades comerciales turísticas registradas por encargados
CREATE TABLE core.negocios (
    id UUID NOT NULL DEFAULT uuid_generate_v4(),
    encargado_id UUID NOT NULL,
    categoria_id UUID NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion_corta VARCHAR(200),
    descripcion VARCHAR(2000),
    tipo VARCHAR(50),
    direccion VARCHAR(200) NOT NULL,
    ubicacion GEOGRAPHY(POINT, 4326),
    tiene_parqueadero BOOLEAN,
    telefono_principal VARCHAR(20),
    whatsapp VARCHAR(20),
    email_contacto VARCHAR(100),
    sitio_web VARCHAR(255),
    facebook_url VARCHAR(255),
    instagram_url VARCHAR(255),
    twitter_url VARCHAR(255),
    tiktok_url VARCHAR(255),
    youtube_url VARCHAR(255),
    rango_precios VARCHAR(20),
    acepta_tarjetas BOOLEAN,
    acepta_efectivo BOOLEAN DEFAULT TRUE,
    acepta_transferencias BOOLEAN,
    horario_atencion VARCHAR(300),
    abierto_ahora BOOLEAN,
    url_imagen_principal VARCHAR(500),
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    verificado BOOLEAN NOT NULL DEFAULT FALSE,
    search_vector TSVECTOR,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT now(),
    fecha_actualizacion TIMESTAMP,
    fecha_eliminacion TIMESTAMP,

    CONSTRAINT pk_negocios PRIMARY KEY (id)
);

COMMENT ON TABLE core.negocios IS 'Entidades comerciales con búsqueda geográfica (PostGIS) y textual avanzada (full-text).';
COMMENT ON COLUMN core.negocios.id IS 'Identificador único del negocio.';
COMMENT ON COLUMN core.negocios.encargado_id IS 'Usuario encargado responsable del negocio (relación 1:1).';
COMMENT ON COLUMN core.negocios.categoria_id IS 'Categoría a la que pertenece el negocio.';
COMMENT ON COLUMN core.negocios.nombre IS 'Nombre comercial del negocio.';
COMMENT ON COLUMN core.negocios.descripcion_corta IS 'Descripción breve para listados.';
COMMENT ON COLUMN core.negocios.descripcion IS 'Descripción completa del negocio.';
COMMENT ON COLUMN core.negocios.tipo IS 'Tipo de negocio: RESTAURANTE, HOSPEDAJE, AGENCIA, OTRO.';
COMMENT ON COLUMN core.negocios.direccion IS 'Dirección física del negocio.';
COMMENT ON COLUMN core.negocios.ubicacion IS 'Punto geográfico almacenado como GEOGRAPHY(POINT,4326).';
COMMENT ON COLUMN core.negocios.tiene_parqueadero IS 'Indica si el negocio cuenta con estacionamiento.';
COMMENT ON COLUMN core.negocios.telefono_principal IS 'Número de teléfono de contacto.';
COMMENT ON COLUMN core.negocios.whatsapp IS 'Número de WhatsApp para contacto.';
COMMENT ON COLUMN core.negocios.email_contacto IS 'Correo electrónico de contacto.';
COMMENT ON COLUMN core.negocios.sitio_web IS 'URL del sitio web oficial.';
COMMENT ON COLUMN core.negocios.facebook_url IS 'URL del perfil de Facebook.';
COMMENT ON COLUMN core.negocios.instagram_url IS 'URL del perfil de Instagram.';
COMMENT ON COLUMN core.negocios.twitter_url IS 'URL del perfil de Twitter/X.';
COMMENT ON COLUMN core.negocios.tiktok_url IS 'URL del perfil de TikTok.';
COMMENT ON COLUMN core.negocios.youtube_url IS 'URL del canal de YouTube.';
COMMENT ON COLUMN core.negocios.rango_precios IS 'Clasificación de precios: ECONOMICO, MODERADO, COSTOSO, PREMIUM.';
COMMENT ON COLUMN core.negocios.acepta_tarjetas IS 'Indica si acepta pagos con tarjeta.';
COMMENT ON COLUMN core.negocios.acepta_efectivo IS 'Indica si acepta pagos en efectivo.';
COMMENT ON COLUMN core.negocios.acepta_transferencias IS 'Indica si acepta transferencias bancarias.';
COMMENT ON COLUMN core.negocios.horario_atencion IS 'Horarios de atención al público.';
COMMENT ON COLUMN core.negocios.abierto_ahora IS 'Indica si está abierto en el momento actual.';
COMMENT ON COLUMN core.negocios.url_imagen_principal IS 'URL de la imagen principal del negocio.';
COMMENT ON COLUMN core.negocios.activo IS 'Permite desactivar negocios sin eliminarlos físicamente.';
COMMENT ON COLUMN core.negocios.verificado IS 'Indica si el negocio ha sido verificado por un administrador.';
COMMENT ON COLUMN core.negocios.search_vector IS 'Vector de búsqueda para texto completo en nombre y descripción.';
COMMENT ON COLUMN core.negocios.fecha_creacion IS 'Marca temporal de creación del registro.';
COMMENT ON COLUMN core.negocios.fecha_actualizacion IS 'Marca temporal de última actualización.';
COMMENT ON COLUMN core.negocios.fecha_eliminacion IS 'Marca temporal de eliminación lógica (soft delete) para conservación de histórico.';