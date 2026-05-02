-- ESQUEMA: media
-- PROPÓSITO:
--   Crear tabla para almacenar imágenes asociadas a lugares turísticos.
-- DEPENDE DE: V1_13_0__create_table_lugares.sql
-- AFECTA A: módulo de presentación (galerías de lugares).

CREATE TABLE media.imagenes_lugares (
    id UUID NOT NULL DEFAULT uuid_generate_v4(),
    lugar_id UUID NOT NULL,
    url VARCHAR(500) NOT NULL,
    orden INT NOT NULL DEFAULT 0,
    es_principal BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT now(),

    CONSTRAINT pk_imagenes_lugares PRIMARY KEY (id)
);

-- =══════════════════════════════════════════════════════════════
-- COMENTARIOS de TABLA Y COLUMNAS
-- =══════════════════════════════════════════════════════════════
COMMENT ON TABLE media.imagenes_lugares IS 'Imágenes asociadas a lugares turísticos.';
COMMENT ON COLUMN media.imagenes_lugares.id IS 'Identificador único de la imagen.';
COMMENT ON COLUMN media.imagenes_lugares.lugar_id IS 'Referencia al lugar al que pertenece la imagen.';
COMMENT ON COLUMN media.imagenes_lugares.url IS 'URL de almacenamiento de la imagen.';
COMMENT ON COLUMN media.imagenes_lugares.orden IS 'Orden de presentación en la galería.';
COMMENT ON COLUMN media.imagenes_lugares.es_principal IS 'Indica si es la imagen principal del lugar.';
COMMENT ON COLUMN media.imagenes_lugares.fecha_creacion IS 'Marca temporal de creación del registro.';