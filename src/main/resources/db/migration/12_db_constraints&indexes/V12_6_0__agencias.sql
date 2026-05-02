-- ESQUEMA: agencias
-- PROPÓSITO:
--   Definir constraints de integridad referencial, índices y checks
--   entre tablas del esquema agencias.

-- ==========================
-- 🔒 CONSTRAINTS Tabla tours
-- ==========================
ALTER TABLE agencias.tours 
    ADD CONSTRAINT fk_agencias_tours_negocio 
    FOREIGN KEY (negocio_id) 
    REFERENCES core.negocios(id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    ADD CONSTRAINT chk_agencias_tours_precio_adulto 
    CHECK (precio_adulto >= 0),
    ADD CONSTRAINT chk_agencias_tours_capacidad 
    CHECK (capacidad_minima > 0 AND (capacidad_maxima IS NULL OR capacidad_maxima >= capacidad_minima)),
    ADD CONSTRAINT chk_agencias_tours_nivel_dificultad 
    CHECK (nivel_dificultad IN ('FACIL','MODERADO','DIFICIL','EXTREMO') OR nivel_dificultad IS NULL),
    ADD CONSTRAINT chk_agencias_tours_dias_anticipacion 
    CHECK (dias_anticipacion >= 0);

-- ==========================
-- 📊 ÍNDICES Tabla tours
-- ==========================
CREATE INDEX idx_agencia_tour_negocio ON agencias.tours(negocio_id);
CREATE INDEX idx_agencia_tour_disponible ON agencias.tours(negocio_id, disponible);
CREATE INDEX idx_agencia_tour_precio ON agencias.tours(precio_adulto);
CREATE INDEX idx_agencia_tour_dificultad ON agencias.tours(nivel_dificultad) WHERE nivel_dificultad IS NOT NULL;
CREATE INDEX idx_agencia_tour_eliminado ON agencias.tours(fecha_eliminacion) WHERE fecha_eliminacion IS NULL;