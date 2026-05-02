-- ═══════════════════════════════════════════════════════════════
-- FUNCIONES DE UTILIDAD PARA CONSULTAS DE NEGOCIOS 
-- ═══════════════════════════════════════════════════════════════

-- Función: Buscar negocios cercanos (radio en metros)
CREATE OR REPLACE FUNCTION buscar_negocios_cercanos(
    p_lat DOUBLE PRECISION,
    p_lon DOUBLE PRECISION,
    p_radio_metros INTEGER DEFAULT 5000,
    p_categoria_id INTEGER DEFAULT NULL
)
RETURNS TABLE (
    negocio_id INTEGER,
    nombre VARCHAR,
    descripcion_corta VARCHAR,
    distancia_metros DOUBLE PRECISION,
    categoria VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        n.id,
        n.nombre,
        n.descripcion_corta,
        ST_Distance(
            n.ubicacion::geography,
            ST_SetSRID(ST_MakePoint(p_lon, p_lat), 4326)::geography
        ) AS distancia_metros,
        c.nombre AS categoria
    FROM core.negocios n
    INNER JOIN catalogos.categorias c ON n.categoria_id = c.id
    WHERE n.activo = TRUE
      AND n.fecha_eliminacion IS NULL
      AND n.ubicacion IS NOT NULL
      AND ST_DWithin(
          n.ubicacion::geography,
          ST_SetSRID(ST_MakePoint(p_lon, p_lat), 4326)::geography,
          p_radio_metros
      )
      AND (p_categoria_id IS NULL OR n.categoria_id = p_categoria_id)
    ORDER BY distancia_metros ASC;
END;
$$ LANGUAGE plpgsql STABLE;

COMMENT ON FUNCTION buscar_negocios_cercanos IS 
'Busca negocios dentro de un radio (en metros) desde una ubicación.
Ejemplo: SELECT * FROM buscar_negocios_cercanos(3.5, -76.5, 2000, NULL);';