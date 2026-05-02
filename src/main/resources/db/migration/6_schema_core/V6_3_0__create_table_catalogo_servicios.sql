-- TABLA: catalogo_servicios
-- Descripción: Catálogo maestro de servicios disponibles
-- (WiFi, estacionamiento, aire acondicionado, etc.)
-- ================================================
CREATE TABLE core.catalogo_servicios (
    id UUID NOT NULL DEFAULT uuid_generate_v4(),
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300),
    icono VARCHAR(50),
    orden INT NOT NULL DEFAULT 0,
    destacado BOOLEAN NOT NULL DEFAULT FALSE,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT now(),
    
    CONSTRAINT pk_catalogo_servicios PRIMARY KEY (id)
);

COMMENT ON TABLE core.catalogo_servicios IS 'Catálogo maestro de servicios que pueden ofrecer los negocios.';
COMMENT ON COLUMN core.catalogo_servicios.id IS 'Identificador único del servicio.';
COMMENT ON COLUMN core.catalogo_servicios.nombre IS 'Nombre único del servicio.';
COMMENT ON COLUMN core.catalogo_servicios.descripcion IS 'Descripción del servicio.';
COMMENT ON COLUMN core.catalogo_servicios.icono IS 'Nombre del icono para representación visual.';
COMMENT ON COLUMN core.catalogo_servicios.orden IS 'Orden de presentación en listados.';
COMMENT ON COLUMN core.catalogo_servicios.destacado IS 'Indica si es un servicio destacado.';
COMMENT ON COLUMN core.catalogo_servicios.activo IS 'Permite desactivar servicios sin eliminarlos.';
COMMENT ON COLUMN core.catalogo_servicios.fecha_creacion IS 'Marca temporal de creación del registro.';