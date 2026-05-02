-- ───────────────────────────────────────────────────────────────
-- Función: Actualizar imagen principal del lugar
-- ───────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION actualizar_imagen_principal_lugar()
RETURNS TRIGGER AS $$
BEGIN
    -- Si se marca una imagen como principal
    IF NEW.es_principal = TRUE THEN
        -- Desmarcar todas las demás imágenes del mismo lugar
        UPDATE imagenes_lugares 
        SET es_principal = FALSE 
        WHERE lugar_id = NEW.lugar_id 
          AND id != NEW.id;
        
        -- Actualizar url_imagen_principal en tabla lugares
        UPDATE lugares 
        SET url_imagen_principal = NEW.url,
            fecha_actualizacion = NOW()
        WHERE id = NEW.lugar_id;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION actualizar_imagen_principal_lugar() IS 
'Sincroniza la imagen principal de lugares: cuando se marca una imagen como es_principal=true,
desmarca las demás y actualiza url_imagen_principal en la tabla lugares.';


-- ───────────────────────────────────────────────────────────────
-- Función: Limpiar imagen principal de lugar al eliminar
-- ───────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION limpiar_imagen_principal_lugar()
RETURNS TRIGGER AS $$
BEGIN
    -- Si se eliminó la imagen principal, actualizar lugar
    IF OLD.es_principal = TRUE THEN
        UPDATE lugares 
        SET url_imagen_principal = NULL,
            fecha_actualizacion = NOW()
        WHERE id = OLD.lugar_id;
        
        -- Intentar asignar otra imagen como principal (la primera disponible)
        UPDATE imagenes_lugares
        SET es_principal = TRUE
        WHERE id = (
            SELECT id 
            FROM imagenes_lugares 
            WHERE lugar_id = OLD.lugar_id 
            ORDER BY orden ASC, fecha_creacion ASC 
            LIMIT 1
        );
    END IF;
    
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION limpiar_imagen_principal_lugar() IS 
'Al eliminar la imagen principal de un lugar, limpia url_imagen_principal 
y asigna automáticamente otra imagen como principal si existe.';


-- ───────────────────────────────────────────────────────────────
-- Función: Prevenir múltiples imágenes principales de lugares
-- ───────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION prevenir_multiples_principales_lugar()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.es_principal = TRUE THEN
        -- Verificar si ya existe una imagen principal
        IF EXISTS (
            SELECT 1 FROM media.imagenes_lugares 
            WHERE lugar_id = NEW.lugar_id 
              AND es_principal = TRUE 
              AND id != NEW.id
        ) THEN
            -- Desmarcar automáticamente la anterior
            UPDATE media.imagenes_lugares 
            SET es_principal = FALSE 
            WHERE lugar_id = NEW.lugar_id 
              AND es_principal = TRUE 
              AND id != NEW.id;
        END IF;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION prevenir_multiples_principales_lugar() IS 
'Garantiza que solo exista una imagen principal por lugar, 
desmarcando automáticamente la anterior si se intenta marcar otra.';



-- ───────────────────────────────────────────────────────────────
-- Función: Actualizar imagen principal del negocio
-- ───────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION actualizar_imagen_principal_negocio()
RETURNS TRIGGER AS $$
BEGIN
    -- Si se marca una imagen como principal
    IF NEW.es_principal = TRUE THEN
        -- Desmarcar todas las demás imágenes del mismo negocio
        UPDATE imagenes_negocios 
        SET es_principal = FALSE 
        WHERE negocio_id = NEW.negocio_id 
          AND id != NEW.id;
        
        -- Actualizar url_imagen_principal en tabla negocios
        UPDATE negocios 
        SET url_imagen_principal = NEW.url,
            fecha_actualizacion = NOW()
        WHERE id = NEW.negocio_id;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION actualizar_imagen_principal_negocio() IS 
'Sincroniza la imagen principal: cuando se marca una imagen como es_principal=true,
desmarca las demás y actualiza url_imagen_principal en la tabla negocios.';


-- ───────────────────────────────────────────────────────────────
-- Función: Limpiar imagen principal al eliminar
-- ───────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION limpiar_imagen_principal_negocio()
RETURNS TRIGGER AS $$
BEGIN
    -- Si se eliminó la imagen principal, actualizar negocio
    IF OLD.es_principal = TRUE THEN
        UPDATE negocios 
        SET url_imagen_principal = NULL,
            fecha_actualizacion = NOW()
        WHERE id = OLD.negocio_id;
        
        -- Intentar asignar otra imagen como principal (la primera disponible)
        UPDATE imagenes_negocios
        SET es_principal = TRUE
        WHERE id = (
            SELECT id 
            FROM imagenes_negocios 
            WHERE negocio_id = OLD.negocio_id 
            ORDER BY orden ASC, fecha_creacion ASC 
            LIMIT 1
        );
    END IF;
    
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION limpiar_imagen_principal_negocio() IS 
'Al eliminar la imagen principal, limpia url_imagen_principal en negocios 
y asigna automáticamente otra imagen como principal si existe.';


-- ───────────────────────────────────────────────────────────────
-- Función: Prevenir múltiples imágenes principales de negocios
-- ───────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION prevenir_multiples_principales_negocio()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.es_principal = TRUE THEN
        -- Verificar si ya existe una imagen principal
        IF EXISTS (
            SELECT 1 FROM media.imagenes_negocios 
            WHERE negocio_id = NEW.negocio_id 
              AND es_principal = TRUE 
              AND id != NEW.id
        ) THEN
            -- Desmarcar automáticamente la anterior
            UPDATE media.imagenes_negocios 
            SET es_principal = FALSE 
            WHERE negocio_id = NEW.negocio_id 
              AND es_principal = TRUE 
              AND id != NEW.id;
        END IF;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION prevenir_multiples_principales_negocio() IS 
'Garantiza que solo exista una imagen principal por negocio, 
desmarcando automáticamente la anterior si se intenta marcar otra.';