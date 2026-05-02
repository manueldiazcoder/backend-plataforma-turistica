-- Esquema: media
-- Propósito:
--   Crear tabla para almacenar imágenes asociadas a habitaciones de hospedajes.
-- Depende de: V1_21_0__create_table_habitaciones.sql
-- Afecta a: habitaciones
-- ================================================
-- TABLA: imagenes_habitaciones
-- Descripción: Galería de imágenes de habitaciones
-- ================================================
CREATE TABLE media.imagenes_habitaciones (
    id UUID NOT NULL DEFAULT uuid_generate_v4(),
    habitacion_id UUID NOT NULL,
    url VARCHAR(500) NOT NULL,
    tipo VARCHAR(30) NOT NULL DEFAULT 'GENERAL',
    orden INT NOT NULL DEFAULT 0,
    es_principal BOOLEAN NOT NULL DEFAULT FALSE,

    CONSTRAINT pk_imagenes_habitaciones PRIMARY KEY (id)
);

COMMENT ON TABLE media.imagenes_habitaciones IS 'Imágenes asociadas a habitaciones de hospedajes.';
COMMENT ON COLUMN media.imagenes_habitaciones.id IS 'Identificador único de la imagen.';
COMMENT ON COLUMN media.imagenes_habitaciones.habitacion_id IS 'Referencia a la habitación a la que pertenece la imagen.';
COMMENT ON COLUMN media.imagenes_habitaciones.url IS 'URL de almacenamiento de la imagen.';
COMMENT ON COLUMN media.imagenes_habitaciones.tipo IS 'Tipo de imagen (GENERAL, BANO, VISTA, etc.).';
COMMENT ON COLUMN media.imagenes_habitaciones.orden IS 'Orden de presentación en la galería.';
COMMENT ON COLUMN media.imagenes_habitaciones.es_principal IS 'Indica si es la imagen principal de la habitación.';