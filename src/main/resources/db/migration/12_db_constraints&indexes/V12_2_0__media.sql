-- ESQUEMA: media
-- PROPÓSITO:
--   Definir constraints de integridad referencial, índices y checks
--   entre tablas del esquema media.

-- ==========================
-- 🔒 CONSTRAINTS Tabla imagenes_lugares
-- ==========================
ALTER TABLE media.imagenes_lugares
    ADD CONSTRAINT fk_imagenes_lugares_lugar_id FOREIGN KEY (lugar_id) REFERENCES core.lugares(id) ON DELETE CASCADE,
    ADD CONSTRAINT chk_orden_non_negative CHECK (orden >= 0);

-- ==========================
-- 🔍 ÍNDICES Tabla imagenes_lugares
-- ==========================
CREATE INDEX idx_imagenes_lug_lugar_id ON media.imagenes_lugares(lugar_id);
CREATE INDEX idx_img_lug_principal ON media.imagenes_lugares(lugar_id, es_principal);
CREATE INDEX idx_img_lug_orden ON media.imagenes_lugares(lugar_id, orden);

-- ==========================
-- 🔒 CONSTRAINTS Tabla imagenes_negocios
-- ==========================
ALTER TABLE media.imagenes_negocios
    ADD CONSTRAINT fk_imagenes_negocios_negocio FOREIGN KEY (negocio_id) REFERENCES core.negocios(id) ON DELETE CASCADE,
    ADD CONSTRAINT chk_tipo_imagen CHECK (tipo IN ('GENERAL', 'MENU', 'AMBIENTE', 'EVENTO', 'OTRO')),
    ADD CONSTRAINT chk_orden_non_negative CHECK (orden >= 0);

-- ==========================
-- 🔍 ÍNDICES Tabla imagenes_negocios
-- ==========================
CREATE INDEX idx_imagenes_negocios_negocio_id ON media.imagenes_negocios(negocio_id);
CREATE INDEX idx_img_neg_tipo ON media.imagenes_negocios(negocio_id, tipo);
CREATE INDEX idx_img_neg_principal ON media.imagenes_negocios(negocio_id, es_principal);
CREATE INDEX idx_img_neg_orden ON media.imagenes_negocios(negocio_id, orden);

-- ==========================
-- 🔒 CONSTRAINTS Tabla imagenes_habitaciones
-- ==========================
ALTER TABLE media.imagenes_habitaciones
    ADD CONSTRAINT fk_imagenes_habitaciones_habitacion
    FOREIGN KEY (habitacion_id)
    REFERENCES hospedajes.habitaciones(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- ==========================
-- 🔍 ÍNDICES Tabla imagenes_habitaciones
-- ==========================
CREATE INDEX idx_img_hab_habitacion ON media.imagenes_habitaciones(habitacion_id);
CREATE INDEX idx_img_hab_principal ON media.imagenes_habitaciones(habitacion_id, es_principal);
CREATE INDEX idx_img_hab_orden ON media.imagenes_habitaciones(habitacion_id, orden);