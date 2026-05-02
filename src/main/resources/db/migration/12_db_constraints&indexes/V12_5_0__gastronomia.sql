-- ESQUEMA: gastronomia
-- PROPÓSITO:
--   Definir constraints de integridad referencial, índices y checks
--   entre tablas del esquema gastronomia.

-- ==========================
-- 🔒 CONSTRAINTS Tabla productos
-- ==========================
ALTER TABLE gastronomia.productos 
    ADD CONSTRAINT fk_restaurantes_productos_negocio 
    FOREIGN KEY (negocio_id) 
    REFERENCES core.negocios(id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    ADD CONSTRAINT chk_restaurantes_productos_categoria 
    CHECK (categoria IN ('ENTRADA','PLATO_FUERTE','POSTRE','BEBIDA','ESPECIAL')),
    ADD CONSTRAINT chk_restaurantes_productos_precio 
    CHECK (precio >= 0);

-- ==========================
-- ÍNDICES Tabla productos
-- ==========================
CREATE INDEX idx_rest_prod_negocio ON gastronomia.productos(negocio_id);
CREATE INDEX idx_rest_prod_categoria ON gastronomia.productos(negocio_id, categoria);
CREATE INDEX idx_rest_prod_menu ON gastronomia.productos(negocio_id, categoria, disponible, orden);
CREATE INDEX idx_rest_prod_disponible ON gastronomia.productos(disponible);
CREATE INDEX idx_rest_prod_recomendado ON gastronomia.productos(negocio_id, recomendado) WHERE recomendado = TRUE;
CREATE INDEX idx_rest_prod_eliminado ON gastronomia.productos(fecha_eliminacion) WHERE fecha_eliminacion IS NULL;