-- PLATAFORMA TURÍSTICA - CALIMA EXPLORER 
-- Motor: PostgreSQL 14
-- PROPÓSITO:
--   Inicializar extensiones necesarias para la plataforma.
-- NOTAS:
--   Incluye verificación con IF NOT EXISTS para evitar errores idempotentes.


-- Este script corre como superusuario 'postgres' al iniciar el contenedor.

-- 1. CREAR ROL: Esto debe ser el primer comando para que exista.
CREATE ROLE bootstrap_admin WITH
    LOGIN CREATEDB CREATEROLE 
    PASSWORD '${BOOTSTRAP_USER_PASSWORD}' -- Usando la variable de entorno de Docker
    CONNECTION LIMIT 10;
    
COMMENT ON ROLE bootstrap_admin IS 
'Usuario administrativo con privilegios limitados para bootstrap de la BD.';

-- 2. ALTERAR LA BASE DE DATOS YA CREADA POR DOCKER
-- Nota: La BD 'calima_explorer' ya existe por la variable POSTGRES_DB_DEV.

-- Asignar el dueño (owner) al rol recién creado
ALTER DATABASE calima_explorer OWNER TO bootstrap_admin;

-- Timezone y Codificación (configuraciones globales para la BD)
ALTER DATABASE calima_explorer SET timezone TO 'UTC';
ALTER DATABASE calima_explorer SET client_encoding TO 'UTF8';


-- ───────────────────────────────────────────────────────────────
-- EXTENSIONES NECESARIAS
-- ───────────────────────────────────────────────────────────────
-- Nota: requiere superusuario manual para crear extensiones.

-- UUID: Para generar identificadores únicos universales
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
COMMENT ON EXTENSION "uuid-ossp" IS 'Genera UUIDs para seguridad en APIs públicas';

-- unaccent: Para búsquedas sin considerar acentos ("café" = "cafe")
CREATE EXTENSION IF NOT EXISTS unaccent;
COMMENT ON EXTENSION unaccent IS 'Búsquedas sin acentos para mejor UX';

-- pg_trgm: Para búsquedas de texto similares (tolerancia a errores de escritura)
CREATE EXTENSION IF NOT EXISTS pg_trgm;
COMMENT ON EXTENSION pg_trgm IS 'Búsquedas tolerantes a errores de escritura';

-- PostGIS: Para búsquedas geográficas avanzadas (restaurantes cercanos, etc)
CREATE EXTENSION IF NOT EXISTS postgis;
COMMENT ON EXTENSION postgis IS 'Permite búsquedas geográficas tipo "restaurantes a 5km"';

-- ✅ Verificación automática
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'postgis') THEN
        RAISE EXCEPTION 'PostGIS no se instaló correctamente. Verifica los logs.';
    END IF;
    RAISE NOTICE '✅ Todas las extensiones instaladas correctamente';
END $$;

-- 3. ASIGNAR PERMISOS
-- Revocar CONNECT de PUBLIC (buena práctica de seguridad)
REVOKE ALL ON DATABASE calima_explorer FROM PUBLIC;
REVOKE CREATE ON SCHEMA public FROM PUBLIC;

-- Otorgar permisos de conexión al rol creado
GRANT CONNECT ON DATABASE calima_explorer TO bootstrap_admin;

-- Flyway necesita CREATE para crear la tabla 'flyway_schema_history' en el esquema 'public'.
GRANT CREATE ON SCHEMA public TO bootstrap_admin;
-- Necesita USAGE para acceder al esquema 'public'.
GRANT USAGE ON SCHEMA public TO bootstrap_admin;