-- admin_user (DBAs y Mantenimiento)
-- ───────────────────────────────────────────────────────────────
-- PROPÓSITO:
--   Para administradores de base de datos y desarrolladores senior
--   que necesitan hacer mantenimiento, optimización o investigar problemas.
--
-- PERMISOS:
--   Hereda TODOS los permisos de role_admin, que incluyen:
--   - Todo lo que tiene role_app
--   - TRUNCATE (limpiar tablas de prueba)
--   - CREATE (crear índices, vistas, funciones)
--   - Acceso a pg_stat_* (estadísticas y monitoreo)
--
-- LÍMITE DE CONEXIONES:
--   5 conexiones porque es uso ocasional (no 24/7 como la app)

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'admin_user') THEN
        
        CREATE ROLE admin_user WITH 
            LOGIN
            PASSWORD '${ADMIN_USER_PASSWORD}'
            CONNECTION LIMIT 5;
        
        -- Heredar permisos de role_admin
        GRANT role_admin TO admin_user;
        
        
        EXECUTE format('GRANT CONNECT ON DATABASE %I TO admin_user', '${POSTGRES_DB}');
        
        -- Configuraciones más relajadas que app_user porque
        -- los DBAs pueden necesitar ejecutar queries pesadas de análisis
        ALTER ROLE admin_user SET statement_timeout = '10min';  -- 10 minutos
        ALTER ROLE admin_user SET idle_in_transaction_session_timeout = '30min';
        ALTER ROLE admin_user SET timezone = 'UTC';
        -- 
        COMMENT ON ROLE admin_user IS 
        'Usuario para administración y mantenimiento de BD.
        Hereda permisos de role_admin (incluye role_app + CREATE + TRUNCATE + monitoring).
        Uso: Optimización, análisis, limpieza de datos de prueba.
        Todas las acciones se registran en log.';
        
        RAISE NOTICE '═══════════════════════════════════════════════════';
        RAISE NOTICE '✅ admin_user creado exitosamente';
        RAISE NOTICE '═══════════════════════════════════════════════════';
        RAISE NOTICE '';
        RAISE NOTICE '📋 Detalles:';
        RAISE NOTICE '   Hereda permisos de: role_admin';
        RAISE NOTICE '   Límite de conexiones: 5';
        RAISE NOTICE '   Statement timeout: 10 minutos';
        RAISE NOTICE '   Idle transaction timeout: 30 minutos';
        RAISE NOTICE '   Logging: Todas las queries registradas';
        RAISE NOTICE '';
        RAISE NOTICE '🔐 Uso:';
        RAISE NOTICE '   psql -U admin_user -d calima_explorer';
        RAISE NOTICE '   Password: Variable ${ADMIN_USER_PASSWORD}';
        RAISE NOTICE '';
        
    ELSE
        RAISE NOTICE 'ℹ️  admin_user ya existe - omitiendo creación';
    END IF;
END $$;