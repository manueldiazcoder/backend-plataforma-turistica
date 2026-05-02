-- Esquema: gastronomia
-- Propósito:
--   Crear la tabla gastronomia.productos para gestionar
--   los productos ofrecidos por los restaurantes.
-- Depende de:
--   V1_14_0__create_table_negocios.sql
-- Afecta a: Negocios
-- ================================================
-- TABLA: productos
-- Descripción: Menú de productos ofrecidos por restaurantes
-- Categorías: ENTRADA, PLATO_FUERTE, POSTRE, BEBIDA, ESPECIAL
-- ================================================
CREATE TABLE gastronomia.productos (
    id UUID NOT NULL DEFAULT uuid_generate_v4(),
    negocio_id UUID NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    descripcion VARCHAR(1000),
    precio DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    vegetariano BOOLEAN,
    vegano BOOLEAN,
    sin_gluten BOOLEAN,
    picante BOOLEAN,
    tiempo_preparacion_min INT,
    imagen_url VARCHAR(500),
    orden INT NOT NULL DEFAULT 0,
    recomendado BOOLEAN NOT NULL DEFAULT FALSE,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT now(),
    fecha_actualizacion TIMESTAMP,
    fecha_eliminacion TIMESTAMP,

    CONSTRAINT pk_gastronomia_productos PRIMARY KEY (id)
);

COMMENT ON TABLE gastronomia.productos IS 'Productos del menú ofrecidos por restaurantes.';
COMMENT ON COLUMN gastronomia.productos.id IS 'Identificador único del producto.';
COMMENT ON COLUMN gastronomia.productos.negocio_id IS 'Referencia al restaurante que ofrece el producto.';
COMMENT ON COLUMN gastronomia.productos.nombre IS 'Nombre del producto o plato.';
COMMENT ON COLUMN gastronomia.productos.descripcion IS 'Descripción detallada del producto.';
COMMENT ON COLUMN gastronomia.productos.precio IS 'Precio del producto.';
COMMENT ON COLUMN gastronomia.productos.categoria IS 'Categoría del producto: ENTRADA, PLATO_FUERTE, POSTRE, BEBIDA, ESPECIAL.';
COMMENT ON COLUMN gastronomia.productos.vegetariano IS 'Indica si el producto es vegetariano.';
COMMENT ON COLUMN gastronomia.productos.vegano IS 'Indica si el producto es vegano.';
COMMENT ON COLUMN gastronomia.productos.sin_gluten IS 'Indica si el producto no contiene gluten.';
COMMENT ON COLUMN gastronomia.productos.picante IS 'Indica si el producto es picante.';
COMMENT ON COLUMN gastronomia.productos.tiempo_preparacion_min IS 'Tiempo estimado de preparación en minutos.';
COMMENT ON COLUMN gastronomia.productos.imagen_url IS 'URL de la imagen del producto.';
COMMENT ON COLUMN gastronomia.productos.orden IS 'Orden de presentación en el menú.';
COMMENT ON COLUMN gastronomia.productos.recomendado IS 'Indica si es un producto recomendado o destacado.';
COMMENT ON COLUMN gastronomia.productos.disponible IS 'Indica si el producto está disponible actualmente.';
COMMENT ON COLUMN gastronomia.productos.fecha_creacion IS 'Marca temporal de creación del registro.';
COMMENT ON COLUMN gastronomia.productos.fecha_actualizacion IS 'Marca temporal de última actualización.';
COMMENT ON COLUMN gastronomia.productos.fecha_eliminacion IS 'Marca temporal de eliminación lógica (soft delete).';