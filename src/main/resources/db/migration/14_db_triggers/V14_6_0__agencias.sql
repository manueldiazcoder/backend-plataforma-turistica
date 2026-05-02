-- Trigger: Tabla tours
CREATE TRIGGER trg_tours_fecha_actualizacion
    BEFORE UPDATE ON agencias.tours
    FOR EACH ROW
    EXECUTE FUNCTION update_fecha_actualizacion();