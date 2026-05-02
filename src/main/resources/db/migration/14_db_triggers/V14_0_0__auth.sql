-- Trigger: Tabala usuarios
CREATE TRIGGER trg_usuarios_fecha_actualizacion
    BEFORE UPDATE ON auth.usuarios
    FOR EACH ROW
    EXECUTE FUNCTION update_fecha_actualizacion();