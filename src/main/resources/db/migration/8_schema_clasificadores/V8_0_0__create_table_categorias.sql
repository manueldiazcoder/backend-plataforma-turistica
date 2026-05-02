-- TABLA: categorias
-- Descripción: Catálogo jerárquico de categorías para clasificar
--              negocios y lugares turísticos
CREATE TABLE clasificadores.categorias (
    id UUID DEFAULT uuid_generate_v4(),
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(500),
    orden INT NOT NULL DEFAULT 0,
    activa BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT now(),

    CONSTRAINT pk_categorias_id PRIMARY KEY (id)
);

-- ================================================
-- COMENTARIOS DE TABLA Y COLUMNAS SQL
-- ================================================
COMMENT ON TABLE clasificadores.categorias IS 'Catálogo de categorías para clasificar negocios y lugares turísticos.';
COMMENT ON COLUMN clasificadores.categorias.id IS 'UUID interno autogenerado, usado en relaciones con negocios/lugares.';
COMMENT ON COLUMN clasificadores.categorias.nombre IS 'Nombre único de la categoría (ej. Restaurantes, Hoteles).';
COMMENT ON COLUMN clasificadores.categorias.descripcion IS 'Descripción detallada de la categoría.';
COMMENT ON COLUMN clasificadores.categorias.orden IS 'Orden de presentación en la interfaz.';
COMMENT ON COLUMN clasificadores.categorias.activa IS 'Permite desactivar categorías sin eliminarlas físicamente.';
COMMENT ON COLUMN clasificadores.categorias.fecha_creacion IS 'Marca temporal de creación del registro.';