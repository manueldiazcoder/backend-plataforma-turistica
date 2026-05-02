-- ESQUEMA: clasificadores
-- PROPÓSITO:
--   Definir constraints de integridad referencial, índices y checks
--   entre tablas del esquema clasificadores.

-- ==========================
-- 🔒 CONSTRAINTS Tabla categorías
-- ==========================
ALTER TABLE clasificadores.categorias
    ADD CONSTRAINT uq_categorias_nombre UNIQUE (nombre),
    ADD CONSTRAINT chk_categorias_orden CHECK (orden >= 0);

-- ==========================
-- 🔍 ÍNDICES Tabla categorías
-- ==========================
CREATE INDEX idx_categorias_activa ON clasificadores.categorias(activa);
CREATE INDEX idx_categorias_activa_orden ON clasificadores.categorias(activa, orden);