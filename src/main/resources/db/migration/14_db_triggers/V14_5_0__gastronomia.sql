-- Trigger: Tabla productos
CREATE TRIGGER trg_productos_fecha_actualizacion
    BEFORE UPDATE ON gastronomia.productos
    FOR EACH ROW
    EXECUTE FUNCTION update_fecha_actualizacion();