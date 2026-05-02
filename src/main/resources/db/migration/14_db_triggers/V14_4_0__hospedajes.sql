-- Trigger: Tabla habitaciones
CREATE TRIGGER trg_habitaciones_fecha_actualizacion
    BEFORE UPDATE ON hospedajes.habitaciones
    FOR EACH ROW
    EXECUTE FUNCTION update_fecha_actualizacion();