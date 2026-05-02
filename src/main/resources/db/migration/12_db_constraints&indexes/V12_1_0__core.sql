-- ESQUEMA: core
-- PROPÓSITO:
--   Definir constraints de integridad referencial, índices y checks
--   entre tablas del esquema core. 

-- ==========================
-- 🔒 CONSTRAINTS Tabla Lugares
-- ==========================
ALTER TABLE core.lugares
    ADD CONSTRAINT fk_creador_id FOREIGN KEY (creador_id) REFERENCES auth.usuarios(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    ADD CONSTRAINT fk_categoria_id FOREIGN KEY (categoria_id) REFERENCES clasificadores.categorias(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    ADD CONSTRAINT chk_lugares_tipo CHECK (tipo IN ('NATURAL','CULTURAL','HISTORICO','RECREATIVO','OTRO') OR tipo IS NULL),
    ADD CONSTRAINT uq_lugares_creador UNIQUE (creador_id);

-- ==========================
-- 🔍 ÍNDICES Tabla Lugares
-- ==========================
CREATE INDEX idx_lugares_verificado ON core.lugares(verificado);
CREATE INDEX idx_lugares_categoria ON core.lugares(categoria_id);
CREATE INDEX idx_lugares_tipo ON core.lugares(tipo);
CREATE INDEX idx_lugares_ubicacion ON core.lugares USING GIST(ubicacion);
CREATE INDEX idx_lugares_search ON core.lugares USING GIN(search_vector);
CREATE INDEX idx_lugares_nombre_trgm ON core.lugares USING GIN(nombre gin_trgm_ops);
CREATE INDEX idx_lugares_creador ON core.lugares(creador_id);
CREATE INDEX idx_lugares_activo ON core.lugares(activo);
CREATE INDEX idx_lugares_precio ON core.lugares(precio_entrada) WHERE precio_entrada IS NOT NULL;
CREATE INDEX idx_lugares_eliminado ON core.lugares(fecha_eliminacion) WHERE fecha_eliminacion IS NULL;

-- ==========================
-- 🔒 CONSTRAINTS Tabla Negocios
-- ==========================
ALTER TABLE core.negocios
    ADD CONSTRAINT fk_negocios_encargado FOREIGN KEY (encargado_id)
        REFERENCES auth.usuarios(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    ADD CONSTRAINT uq_negocios_encargado UNIQUE (encargado_id),
    ADD CONSTRAINT fk_negocios_categoria FOREIGN KEY (categoria_id)
        REFERENCES clasificadores.categorias(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    ADD CONSTRAINT chk_negocios_tipo CHECK (tipo IN ('RESTAURANTE','HOSPEDAJE','AGENCIA','OTRO') OR tipo IS NULL),
    ADD CONSTRAINT chk_negocios_rango_precios CHECK (rango_precios IN ('ECONOMICO','MODERADO','COSTOSO','PREMIUM') OR rango_precios IS NULL);

-- ==========================
-- 🔍 ÍNDICES Tabla Negocios
-- ==========================
CREATE INDEX idx_negocios_activo ON core.negocios(activo);
CREATE INDEX idx_negocios_verificado ON core.negocios(verificado);
CREATE INDEX idx_negocios_categoria ON core.negocios(categoria_id);
CREATE INDEX idx_negocios_encargado ON core.negocios(encargado_id);
CREATE INDEX idx_negocios_tipo ON core.negocios(tipo);
CREATE INDEX idx_negocios_ubicacion ON core.negocios USING GIST(ubicacion);
CREATE INDEX idx_negocios_search ON core.negocios USING GIN(search_vector);
CREATE INDEX idx_negocios_nombre_trgm ON core.negocios USING GIN(nombre gin_trgm_ops);
CREATE INDEX idx_negocios_activo_cat ON core.negocios(activo, categoria_id);
CREATE INDEX idx_negocios_eliminado ON core.negocios(fecha_eliminacion) WHERE fecha_eliminacion IS NULL;
CREATE INDEX idx_negocios_rango_precios ON core.negocios(rango_precios) WHERE rango_precios IS NOT NULL;

-- ==========================
-- 🔒 CONSTRAINTS Tabla servicios_negocios
-- ==========================
ALTER TABLE core.servicios_negocios 
    ADD CONSTRAINT fk_servicios_negocios_negocio 
    FOREIGN KEY (negocio_id) 
    REFERENCES core.negocios(id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    ADD CONSTRAINT fk_servicios_negocios_servicio 
    FOREIGN KEY (servicio_id) 
    REFERENCES core.catalogo_servicios(id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    ADD CONSTRAINT chk_servicios_negocios_precio 
    CHECK (precio_adicional IS NULL OR precio_adicional >= 0);

-- ==========================
-- 🔍 ÍNDICES Tabla servicios_negocios
-- ==========================
CREATE INDEX idx_serv_neg_servicio ON core.servicios_negocios(servicio_id);

-- ==========================
-- 🔒 CONSTRAINTS Tabla catalogo_servicios
-- ==========================
ALTER TABLE core.catalogo_servicios 
    ADD CONSTRAINT uq_catalogo_servicios_nombre 
    UNIQUE (nombre),
    ADD CONSTRAINT chk_catalogo_servicios_orden 
    CHECK (orden >= 0);

-- ==========================
-- 🔍 ÍNDICES Tabla catalogo_servicios
-- ==========================
CREATE INDEX idx_cat_serv_activo ON core.catalogo_servicios(activo);
CREATE INDEX idx_cat_serv_destacado ON core.catalogo_servicios(destacado) WHERE destacado = TRUE;
CREATE INDEX idx_cat_serv_orden ON core.catalogo_servicios(orden);