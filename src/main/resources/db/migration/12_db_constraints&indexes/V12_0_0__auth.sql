-- ESQUEMA: auth
-- PROPÓSITO:
--   Definir constraints de integridad referencial, índices y checks
--   entre tablas del esquema auth.

-- ==========================
-- 🔗 CONSTRAINTS Tabla Usuarios
-- ==========================
ALTER TABLE auth.usuarios 
    ADD CONSTRAINT uq_usuarios_correo UNIQUE (correo),
    ADD CONSTRAINT uq_usuarios_oauth UNIQUE (proveedor_oauth, id_proveedor_oauth),
    ADD CONSTRAINT chk_usuarios_rol CHECK (rol IN ('VISITANTE','ENCARGADO'));

-- ==========================
-- 🔍 ÍNDICES Tabla Usuarios
-- ==========================
CREATE INDEX idx_usuarios_activo ON auth.usuarios (activo);
CREATE INDEX idx_usuarios_rol ON auth.usuarios (rol);
CREATE INDEX idx_usuarios_correo ON auth.usuarios (correo);
CREATE UNIQUE INDEX idx_usuarios_oauth ON auth.usuarios(proveedor_oauth, id_proveedor_oauth) WHERE proveedor_oauth IS NOT NULL;