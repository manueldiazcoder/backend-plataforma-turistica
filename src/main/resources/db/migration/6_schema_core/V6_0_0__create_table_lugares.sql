-- TABLA: lugares
-- DEPENDE DE: La tabla de categorias
-- Descripción: Sitios turísticos, culturales o naturales
-- Nota: No son negocios comerciales, pero comparten estructura similar
CREATE TABLE core.lugares (
    id UUID DEFAULT uuid_generate_v4(),
    creador_id UUID NOT NULL,
    categoria_id UUID NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion_corta VARCHAR(200),
    descripcion VARCHAR(2000),
    tipo VARCHAR(50),
    direccion VARCHAR(200) NOT NULL,
    ubicacion GEOGRAPHY(POINT, 4326),
    precio_entrada DECIMAL(10,2),
    horario_acceso VARCHAR(200),
    tiene_parqueadero BOOLEAN,
    url_imagen_principal VARCHAR(500),
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    verificado BOOLEAN NOT NULL DEFAULT FALSE,
    search_vector TSVECTOR,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT now(),
    fecha_actualizacion TIMESTAMP,
    fecha_eliminacion TIMESTAMP,

    CONSTRAINT pk_lugares_id PRIMARY KEY (id)
);

COMMENT ON TABLE core.lugares IS 'Sitios turísticos (no comerciales) registrados por usuarios con permisos especiales.';
COMMENT ON COLUMN core.lugares.id IS 'Identificador único del lugar.';
COMMENT ON COLUMN core.lugares.creador_id IS 'Usuario que registró el lugar en el sistema.';
COMMENT ON COLUMN core.lugares.categoria_id IS 'Categoría a la que pertenece el lugar.';
COMMENT ON COLUMN core.lugares.nombre IS 'Nombre del lugar turístico.';
COMMENT ON COLUMN core.lugares.descripcion_corta IS 'Descripción breve para listados.';
COMMENT ON COLUMN core.lugares.descripcion IS 'Descripción completa del lugar.';
COMMENT ON COLUMN core.lugares.tipo IS 'Tipo de lugar: NATURAL, CULTURAL, HISTORICO, RECREATIVO, OTRO.';
COMMENT ON COLUMN core.lugares.direccion IS 'Dirección física del lugar.';
COMMENT ON COLUMN core.lugares.ubicacion IS 'Coordenadas geográficas del lugar almacenadas en PostGIS (lat/lng).';
COMMENT ON COLUMN core.lugares.precio_entrada IS 'Costo de entrada al lugar (si aplica).';
COMMENT ON COLUMN core.lugares.horario_acceso IS 'Horarios de acceso o visita.';
COMMENT ON COLUMN core.lugares.tiene_parqueadero IS 'Indica si el lugar cuenta con estacionamiento.';
COMMENT ON COLUMN core.lugares.url_imagen_principal IS 'URL de la imagen principal del lugar.';
COMMENT ON COLUMN core.lugares.activo IS 'Permite ocultar lugares sin eliminarlos físicamente.';
COMMENT ON COLUMN core.lugares.verificado IS 'Indica si el lugar ha sido verificado por un administrador.';
COMMENT ON COLUMN core.lugares.search_vector IS 'Vector de búsqueda para optimizar búsquedas de texto completo en nombre y descripción.';
COMMENT ON COLUMN core.lugares.fecha_creacion IS 'Marca temporal de creación del registro.';
COMMENT ON COLUMN core.lugares.fecha_actualizacion IS 'Marca temporal de última actualización.';
COMMENT ON COLUMN core.lugares.fecha_eliminacion IS 'Marca temporal de eliminación lógica (soft delete).';