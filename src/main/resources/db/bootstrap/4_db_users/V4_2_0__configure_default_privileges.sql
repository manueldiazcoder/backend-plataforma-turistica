-- PROPÓSITO:
--   Establecer privilegios por defecto para nuevos objetos en cada esquema.
-- RESPONSABILIDAD: asegurar que objetos futuros (tablas, sequences) creados en los esquemas
-- hereden permisos.
-- Esto evita tener que usar GRANT manualmente tras cada CREATE TABLE.

-- PROPÓSITO: Configurar privilegios automáticos para objetos futuros
-- ═══════════════════════════════════════════════════════════════

-- ¿QUÉ HACE ALTER DEFAULT PRIVILEGES?
--   Cuando creas un nuevo objeto (tabla, función, sequence),
--   PostgreSQL automáticamente le asigna los permisos definidos aquí.

-- ¿POR QUÉ ES NECESARIO?
--   Sin esto, cada nueva tabla requeriría GRANT manual.
--   Con esto, las tablas futuras heredan permisos automáticamente.

-- EJEMPLO:
--   Sin default_privileges:
--     CREATE TABLE nueva_tabla (...);
--     GRANT SELECT, INSERT... TO role_app;  ← Tedioso, propenso a errores

--   Con default_privileges:
--     CREATE TABLE nueva_tabla (...);  ← Ya tiene permisos automáticamente


-- ───────────────────────────────────────────────────────────────
-- Permisos por defecto para TABLAS
-- ───────────────────────────────────────────────────────────────

-- Esquema: auth
-- role_app: Solo INSERT/SELECT/UPDATE/DELETE (login, registro, actualización, eliminación)
-- role_admin: CRUD + TRUNCATE
ALTER DEFAULT PRIVILEGES IN SCHEMA auth
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO role_app;

ALTER DEFAULT PRIVILEGES IN SCHEMA auth
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON TABLES TO role_admin;


-- Esquema: core
-- role_app: CRUD completo
-- role_admin: CRUD + TRUNCATE
ALTER DEFAULT PRIVILEGES IN SCHEMA core
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO role_app;

ALTER DEFAULT PRIVILEGES IN SCHEMA core
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON TABLES TO role_admin;


-- Esquema: media
-- role_app: CRUD completo
-- role_admin: CRUD + TRUNCATE
ALTER DEFAULT PRIVILEGES IN SCHEMA media
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO role_app;

ALTER DEFAULT PRIVILEGES IN SCHEMA media
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON TABLES TO role_admin;


-- Esquema: clasificadores
-- role_app: Solo lectura (clasificadores se modifican por migraciones)
-- role_admin: Acceso completo
ALTER DEFAULT PRIVILEGES IN SCHEMA clasificadores
GRANT SELECT ON TABLES TO role_app;

ALTER DEFAULT PRIVILEGES IN SCHEMA clasificadores
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON TABLES TO role_admin;


-- Esquema: hospedajes
ALTER DEFAULT PRIVILEGES IN SCHEMA hospedajes
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO role_app;

ALTER DEFAULT PRIVILEGES IN SCHEMA hospedajes
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON TABLES TO role_admin;


-- Esquema: gastronomia
ALTER DEFAULT PRIVILEGES IN SCHEMA gastronomia
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO role_app;

ALTER DEFAULT PRIVILEGES IN SCHEMA gastronomia
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON TABLES TO role_admin;


-- Esquema: agencias
ALTER DEFAULT PRIVILEGES IN SCHEMA agencias
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO role_app;

ALTER DEFAULT PRIVILEGES IN SCHEMA agencias
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON TABLES TO role_admin;


-- ───────────────────────────────────────────────────────────────
-- SECCIÓN 2: Permisos por defecto para SEQUENCES
-- ───────────────────────────────────────────────────────────────
-- ¿POR QUÉ SEQUENCES?
--   Aunque usas UUID, PostgreSQL internamente puede crear sequences
--   y algunas funciones de utilidad pueden necesitarlas.

ALTER DEFAULT PRIVILEGES IN SCHEMA auth
GRANT USAGE, SELECT ON SEQUENCES TO role_app, role_admin;

ALTER DEFAULT PRIVILEGES IN SCHEMA core
GRANT USAGE, SELECT ON SEQUENCES TO role_app, role_admin;

ALTER DEFAULT PRIVILEGES IN SCHEMA media
GRANT USAGE, SELECT ON SEQUENCES TO role_app, role_admin;

ALTER DEFAULT PRIVILEGES IN SCHEMA clasificadores
GRANT USAGE, SELECT ON SEQUENCES TO role_app, role_admin;

ALTER DEFAULT PRIVILEGES IN SCHEMA hospedajes
GRANT USAGE, SELECT ON SEQUENCES TO role_app, role_admin;

ALTER DEFAULT PRIVILEGES IN SCHEMA gastronomia
GRANT USAGE, SELECT ON SEQUENCES TO role_app, role_admin;

ALTER DEFAULT PRIVILEGES IN SCHEMA agencias
GRANT USAGE, SELECT ON SEQUENCES TO role_app, role_admin;


-- ───────────────────────────────────────────────────────────────
-- SECCIÓN 3: Permisos por defecto para FUNCIONES
-- ───────────────────────────────────────────────────────────────
-- ¿POR QUÉ FUNCIONES?
--   Las funciones de negocio (buscar_negocios_cercanos, calcular_distancia)
--   necesitan ser ejecutables por la aplicación.

ALTER DEFAULT PRIVILEGES IN SCHEMA core
GRANT EXECUTE ON FUNCTIONS TO role_app, role_admin;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT EXECUTE ON FUNCTIONS TO role_app, role_admin;


-- ═══════════════════════════════════════════════════════════════
-- VERIFICACIÓN
-- ═══════════════════════════════════════════════════════════════
DO $$
BEGIN
    RAISE NOTICE '═══════════════════════════════════════════════════';
    RAISE NOTICE '✅ PRIVILEGIOS POR DEFECTO CONFIGURADOS';
    RAISE NOTICE '═══════════════════════════════════════════════════';
    RAISE NOTICE '';
    RAISE NOTICE '📋 Configuración aplicada:';
    RAISE NOTICE '   • Tablas futuras: permisos automáticos';
    RAISE NOTICE '   • Sequences futuras: permisos automáticos';
    RAISE NOTICE '   • Funciones futuras: permisos automáticos';
    RAISE NOTICE '';
    RAISE NOTICE '💡 Próximas tablas heredarán estos permisos automáticamente';
    RAISE NOTICE '';
END $$;