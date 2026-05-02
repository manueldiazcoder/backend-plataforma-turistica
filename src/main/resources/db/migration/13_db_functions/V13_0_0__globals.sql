-- Función: Actualizar fecha_actualizacion automáticamente
CREATE OR REPLACE FUNCTION update_fecha_actualizacion()
RETURNS TRIGGER AS $$
BEGIN
    NEW.fecha_actualizacion = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION update_fecha_actualizacion() IS 'Función trigger que actualiza automáticamente el campo fecha_actualizacion al modificar un registro.';

-- ───────────────────────────────────────────────────────────────
-- Función: Actualizar vector de búsqueda de texto de tablas con nombre y descripcion corta
-- ───────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION update_search_vector_general()
RETURNS TRIGGER AS $$
BEGIN
    -- Combina nombre + descripcion_corta
    -- unaccent() elimina acentos para búsquedas más flexibles
    -- to_tsvector('spanish') optimiza para búsquedas en español
    NEW.search_vector := to_tsvector('spanish',
        unaccent(
            COALESCE(NEW.nombre, '') || ' ' ||
            COALESCE(NEW.descripcion_corta, '')
        )
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION update_search_vector_general() IS 
'Genera/actualiza el vector de búsqueda de texto completo combinando nombre y descripcion_corta.
Elimina acentos y usa diccionario español para búsquedas óptimas.';

-- ───────────────────────────────────────────────────────────────
-- Función: Soft delete automático
-- ───────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION soft_delete()
RETURNS TRIGGER AS $$
BEGIN
    -- En lugar de eliminar el registro, marca fecha_eliminacion
    NEW.fecha_eliminacion = NOW();
    NEW.activo = FALSE;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION soft_delete() IS 
'Implementa soft delete: en lugar de eliminar físicamente el registro, 
marca fecha_eliminacion y desactiva el registro.';

-- ───────────────────────────────────────────────────────────────
-- Función: Validar coordenadas geográficas
-- ───────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION validar_coordenadas()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.ubicacion IS NOT NULL THEN
        -- Extraer latitud y longitud del punto geográfico
        DECLARE
            lat DOUBLE PRECISION;
            lon DOUBLE PRECISION;
        BEGIN
            lat := ST_Y(NEW.ubicacion::geometry);
            lon := ST_X(NEW.ubicacion::geometry);
            
            -- Validar rangos correctos
            IF lat < -90 OR lat > 90 THEN
                RAISE EXCEPTION 'Latitud inválida: % (debe estar entre -90 y 90)', lat;
            END IF;
            
            IF lon < -180 OR lon > 180 THEN
                RAISE EXCEPTION 'Longitud inválida: % (debe estar entre -180 y 180)', lon;
            END IF;
        END;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION validar_coordenadas() IS 
'Valida que las coordenadas geográficas estén dentro de rangos válidos antes de INSERT/UPDATE.
Latitud: -90 a 90, Longitud: -180 a 180';