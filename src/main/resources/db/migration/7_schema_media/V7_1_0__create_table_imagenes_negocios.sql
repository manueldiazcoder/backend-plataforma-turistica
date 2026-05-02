-- ESQUEMA: media
-- PROPÓSITO:
--   Crear tabla de imágenes asociadas a negocios (galerías comerciales).
-- DEPENDE DE: V1_14_0__create_table_negocios.sql
-- AFECTA A: negocios.

CREATE TABLE media.imagenes_negocios (
    id UUID NOT NULL DEFAULT uuid_generate_v4(),
    negocio_id UUID NOT NULL,
    url VARCHAR(500) NOT NULL,
    tipo VARCHAR(20) NOT NULL DEFAULT 'GENERAL',
    orden INT NOT NULL DEFAULT 0,
    es_principal BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT now(),

    CONSTRAINT pk_imagenes_negocios PRIMARY KEY (id)
);

-- =══════════════════════════════════════════════════════════════
-- COMENTARIOS de LA TABLA Y COLUMNAS
-- =══════════════════════════════════════════════════════════════
COMMENT ON TABLE media.imagenes_negocios IS 'Imágenes asociadas a negocios comerciales.';
COMMENT ON COLUMN media.imagenes_negocios.id IS 'Identificador único de la imagen.';
COMMENT ON COLUMN media.imagenes_negocios.negocio_id IS 'Referencia al negocio al que pertenece la imagen.';
COMMENT ON COLUMN media.imagenes_negocios.url IS 'URL de almacenamiento de la imagen.';
COMMENT ON COLUMN media.imagenes_negocios.tipo IS 'Tipo de imagen (GENERAL, MENU, AMBIENTE, etc.).';
COMMENT ON COLUMN media.imagenes_negocios.orden IS 'Orden de presentación en la galería.';
COMMENT ON COLUMN media.imagenes_negocios.es_principal IS 'Indica si es la imagen principal del negocio.';
COMMENT ON COLUMN media.imagenes_negocios.fecha_creacion IS 'Marca temporal de creación del registro.';