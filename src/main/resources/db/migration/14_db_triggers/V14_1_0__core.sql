-- ═══════════════════════════════════════════════════════════════
-- TRIGGERS PARA TABLA LUGARES
-- ═══════════════════════════════════════════════════════════════

-- Trigger: Actualizar fecha de actualización
CREATE TRIGGER trg_lugares_fecha_actualizacion
BEFORE UPDATE ON core.lugares
FOR EACH ROW
EXECUTE FUNCTION update_fecha_actualizacion();

-- Trigger: Actualizar vector de búsqueda
CREATE TRIGGER trg_lugares_search_vector
BEFORE INSERT OR UPDATE ON core.lugares
FOR EACH ROW 
EXECUTE FUNCTION update_search_vector_general();

-- Trigger: Validar coordenadas geográficas
CREATE TRIGGER trg_lugares_validar_coords
BEFORE INSERT OR UPDATE ON core.lugares
FOR EACH ROW 
EXECUTE FUNCTION validar_coordenadas();

-- ═══════════════════════════════════════════════════════════════
-- TRIGGERS PARA TABLA NEGOCIOS
-- ═══════════════════════════════════════════════════════════════

-- Trigger: Actualizar fecha de actualización
CREATE TRIGGER trg_negocios_fecha_actualizacion
BEFORE UPDATE ON core.negocios
FOR EACH ROW
EXECUTE FUNCTION update_fecha_actualizacion();

-- Trigger: Actualizar vector de búsqueda
CREATE TRIGGER trg_negocios_search_vector
BEFORE INSERT OR UPDATE ON core.negocios
FOR EACH ROW 
EXECUTE FUNCTION update_search_vector_general();

-- Trigger: Validar coordenadas geográficas
CREATE TRIGGER trg_negocios_validar_coords
BEFORE INSERT OR UPDATE ON core.negocios
FOR EACH ROW 
EXECUTE FUNCTION validar_coordenadas();