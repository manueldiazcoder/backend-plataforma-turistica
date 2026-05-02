-- ═══════════════════════════════════════════════════════════════
-- TRIGGERS PARA IMÁGENES DE LUGARES
-- ═══════════════════════════════════════════════════════════════

-- Trigger: Sincronizar imagen principal al insertar/actualizar
CREATE TRIGGER trg_imagenes_lugares_principal
AFTER INSERT OR UPDATE ON media.imagenes_lugares
FOR EACH ROW 
EXECUTE FUNCTION actualizar_imagen_principal_lugar();

-- Trigger: Limpiar imagen principal al eliminar
CREATE TRIGGER trg_imagenes_lugares_delete
AFTER DELETE ON media.imagenes_lugares
FOR EACH ROW 
EXECUTE FUNCTION limpiar_imagen_principal_lugar();

-- ═══════════════════════════════════════════════════════════════
-- TRIGGERS PARA IMÁGENES DE NEGOCIOS
-- ═══════════════════════════════════════════════════════════════

-- Trigger: Sincronizar imagen principal al insertar/actualizar
CREATE TRIGGER trg_imagenes_negocios_principal
AFTER INSERT OR UPDATE ON media.imagenes_negocios
FOR EACH ROW 
EXECUTE FUNCTION actualizar_imagen_principal_negocio();

-- Trigger: Limpiar imagen principal al eliminar
CREATE TRIGGER trg_imagenes_negocios_delete
AFTER DELETE ON media.imagenes_negocios
FOR EACH ROW 
EXECUTE FUNCTION limpiar_imagen_principal_negocio();

-- Trigger: Prevenir múltiples principales (seguridad adicional)
CREATE TRIGGER trg_imagenes_negocios_unica_principal
BEFORE INSERT OR UPDATE ON media.imagenes_negocios
FOR EACH ROW 
EXECUTE FUNCTION prevenir_multiples_principales_negocio();