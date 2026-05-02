-- ESQUEMA: hospedajes
-- PROPÓSITO:
--   Definir constraints de integridad referencial, índices y checks
--   entre tablas del esquema hospedajes.

-- ==========================
-- 🔒 CONSTRAINTS Tabla habitaciones
-- ==========================
ALTER TABLE hospedajes.habitaciones 
    ADD CONSTRAINT fk_hospedajes_habitaciones_negocio 
    FOREIGN KEY (negocio_id) 
    REFERENCES core.negocios(id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    ADD CONSTRAINT chk_hospedajes_habitaciones_capacidad 
    CHECK (capacidad_personas > 0),
    ADD CONSTRAINT chk_hospedajes_habitaciones_camas 
    CHECK (numero_camas > 0),
    ADD CONSTRAINT chk_hospedajes_habitaciones_precio 
    CHECK (precio_noche >= 0);

-- ==========================
-- ÍNDICES Tabla habitaciones
-- ==========================
CREATE INDEX idx_hosp_hab_negocio ON hospedajes.habitaciones(negocio_id);
CREATE INDEX idx_hosp_hab_disponible ON hospedajes.habitaciones(negocio_id, disponible);
CREATE INDEX idx_hosp_hab_precio ON hospedajes.habitaciones(precio_noche);
CREATE INDEX idx_hosp_hab_capacidad ON hospedajes.habitaciones(capacidad_personas);
CREATE INDEX idx_hosp_hab_eliminado ON hospedajes.habitaciones(fecha_eliminacion) WHERE fecha_eliminacion IS NULL;