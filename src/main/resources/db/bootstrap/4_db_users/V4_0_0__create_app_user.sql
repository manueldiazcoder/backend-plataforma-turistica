-- ───────────────────────────────────────────────────────────────
-- app_user (Aplicaciones Web + Móvil)
-- ───────────────────────────────────────────────────────────────
-- PROPÓSITO:
--   Este es el usuario que Spring Boot y React Native usarán
--   para todas las operaciones normales de la aplicación.

-- PERMISOS:
--   Hereda TODOS los permisos de role_app, que incluyen:
--   - SELECT, INSERT, UPDATE, DELETE en tablas operativas
--   - SELECT en clasificadores (categorías)
--   - EXECUTE en funciones de negocio
--   - NO puede modificar estructura de BD (sin DDL)

-- LÍMITE DE CONEXIONES:
--   50 conexiones simultáneas es apropiado para:
--   - Pool de conexiones de Spring Boot (típicamente 10-20)
--   - Múltiples instancias de la app (load balancing)
--   - Conexiones de la app móvil

DO $$
BEGIN
    -- Verificar si el usuario ya existe (idempotencia)
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'app_user') THEN
        
        -- Crear la cuenta con LOGIN
        CREATE ROLE app_user WITH 
            LOGIN                           
            PASSWORD '${APP_USER_PASSWORD}'
            CONNECTION LIMIT 50;
        
        -- Asignar membership al role-group
        -- app_user ahora hereda TODOS los permisos de role_app
        GRANT role_app TO app_user;
        
        -- Otorgar permiso para conectarse a la base de datos
        GRANT CONNECT ON DATABASE ${POSTGRES_DB} TO app_user;
        
        -- ───────────────────────────────────────────────────────
        -- CONFIGURACIONES DE SEGURIDAD Y RENDIMIENTO
        -- ───────────────────────────────────────────────────────
        
        -- Timeout de queries (evita queries infinitas)
        -- Si una query tarda más de 60 segundos, PostgreSQL la cancela
        -- Esto previene:
        -- - Queries mal optimizadas que bloquean la BD
        -- - Ataques de denegación de servicio mediante queries pesadas
        -- - Bugs en el código que generen loops infinitos
        ALTER ROLE app_user SET statement_timeout = '60s';
        
        -- Timeout de transacciones inactivas
        -- Si una transacción está abierta pero no hace nada por 10 minutos,
        -- PostgreSQL la cancela y hace ROLLBACK automático
        -- Esto previene:
        -- - Locks eternos que bloquean otras transacciones
        -- - Conexiones "zombies" que desperdician recursos
        -- - Bugs donde se abre una transacción y se olvida cerrarla
        ALTER ROLE app_user SET idle_in_transaction_session_timeout = '10min';
        
        -- Configurar timezone (todas las fechas se manejan en UTC)
        ALTER ROLE app_user SET timezone = 'UTC';
        
        COMMENT ON ROLE app_user IS 
        'Usuario operativo para Spring Boot (web) y React Native (móvil).
        Hereda permisos de role_app. Límite: 50 conexiones.
        Timeouts: query 60s, idle transaction 10min.';
        
        RAISE NOTICE '═══════════════════════════════════════════════════';
        RAISE NOTICE '✅ app_user creado exitosamente';
        RAISE NOTICE '═══════════════════════════════════════════════════';
        RAISE NOTICE '';
        RAISE NOTICE '📋 Detalles:';
        RAISE NOTICE '   Hereda permisos de: role_app';
        RAISE NOTICE '   Límite de conexiones: 50';
        RAISE NOTICE '   Statement timeout: 60 segundos';
        RAISE NOTICE '   Idle transaction timeout: 10 minutos';
        RAISE NOTICE '   Log de queries lentas: > 1 segundo';
        RAISE NOTICE '';
        RAISE NOTICE '';
        
    ELSE
        RAISE NOTICE 'ℹ️  app_user ya existe - omitiendo creación';
    END IF;
END $$;