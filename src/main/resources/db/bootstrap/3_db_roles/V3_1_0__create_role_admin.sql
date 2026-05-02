-- RESPONSABILIDAD: Crear el role-group (plantilla de permisos) que define
--   el nivel de acceso en la base de datos.
-- NOTA:  Este role NO tienen LOGIN (no es cuenta de usuario).
--   Es plantilla de permisos que se asignará a un usuario real de la base de datos
--   mediante GRANT role_name TO user_name.

-- ───────────────────────────────────────────────────────────────
-- ROLE DE ADMINISTRADOR
-- ───────────────────────────────────────────────────────────────
-- DESCRIPCIÓN:
--   Este rol es para tareas de administración y mantenimiento de
--   la base de datos. Lo usará el DBA o desarrolladores senior
--   cuando necesiten optimizar queries, crear índices adicionales,
--   o investigar problemas de rendimiento.
--
-- PERMISOS QUE TENDRÁ:
--   ✓ Todo lo que tiene rol_app
--   ✓ CREATE en esquemas (puede crear vistas, funciones, índices)
--   ✓ TRUNCATE (para limpiar datos de prueba)
--   ✓ Acceso a estadísticas y catálogos del sistema
--   ✗ NO puede crear extensiones
--   ✗ NO puede modificar configuraciones globales de PostgreSQL
--   ✗ NO puede crear o eliminar roles
--
-- USO ESPERADO:
--   - Optimización de queries y creación de índices
--   - Análisis de rendimiento con EXPLAIN ANALYZE
--   - Mantenimiento rutinario (VACUUM, ANALYZE)
--   - Investigación de problemas en producción
--   - Uso ocasional (no 24/7)

CREATE ROLE role_admin NOLOGIN;
COMMENT ON ROLE role_admin IS 
'Role-group para administradores de base de datos.
Define permisos de mantenimiento y optimización sin acceso destructivo.
Puede crear objetos pero no puede afectar configuraciones globales.';


-- ═══════════════════════════════════════════════════════════════
-- ASIGNACIÓN DE PERMISOS Al ROLE-GROUP role_admin
-- ═══════════════════════════════════════════════════════════════

-- IMPORTANTE: Esta sección asigna permisos al role-group.
-- Cuando más adelante se creen usuarios reales y se les otorgue
-- GRANT role_admin TO app_user, ese usuario heredará
-- automáticamente todos estos permisos.

-- Esto sigue el principio de DRY (Don't Repeat Yourself):
-- se definen permisos una sola vez aquí, y luego se asignan
-- membresías a los usuarios.

-- ───────────────────────────────────────────────────────────────
--  Otorgar USAGE en todos los esquemas
-- ───────────────────────────────────────────────────────────────

-- role_admin necesita USAGE en los mismos esquemas para poder administrarlos
GRANT USAGE ON SCHEMA auth TO role_admin;
GRANT USAGE ON SCHEMA core TO role_admin;
GRANT USAGE ON SCHEMA media TO role_admin;
GRANT USAGE ON SCHEMA clasificadores TO role_admin;
GRANT USAGE ON SCHEMA hospedajes TO role_admin;
GRANT USAGE ON SCHEMA gastronomia TO role_admin;
GRANT USAGE ON SCHEMA agencias TO role_admin;
GRANT USAGE ON SCHEMA public TO role_admin;


-- ───────────────────────────────────────────────────────────────
--  Permisos de TABLAS para role_admin
-- ───────────────────────────────────────────────────────────────
-- El administrador necesita acceso completo para poder hacer
-- mantenimiento, correcciones de datos, y gestión del catálogo.
-- También necesita TRUNCATE para limpiar datos de prueba.
-- ───────────────────────────────────────────────────────────────

GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON ALL TABLES IN SCHEMA auth TO role_admin;
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON ALL TABLES IN SCHEMA core TO role_admin;
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON ALL TABLES IN SCHEMA media TO role_admin;
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON ALL TABLES IN SCHEMA clasificadores TO role_admin;
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON ALL TABLES IN SCHEMA hospedajes TO role_admin;
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON ALL TABLES IN SCHEMA gastronomia TO role_admin;
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON ALL TABLES IN SCHEMA agencias TO role_admin;

-- Permisos sobre la tabla flyway_schema_history para role_admin 
-- Es necesario para ejecutar las migraciones del proyecto springboot
GRANT SELECT, INSERT, UPDATE, DELETE ON public.flyway_schema_history TO role_admin;


-- ───────────────────────────────────────────────────────────────
-- Permiso CREATE en esquemas para role_admin
-- ───────────────────────────────────────────────────────────────
-- ¿POR QUÉ NECESITA CREATE?
--   CREATE permite al administrador crear nuevos objetos en el
--   esquema: vistas, índices adicionales, funciones de utilidad.
--
--   Esto es necesario para optimización de rendimiento. Por ejemplo:
--   - Crear un índice adicional si una query es lenta
--   - Crear una vista materializada para reportes pesados
--   - Crear una función de diagnóstico temporal
--
-- IMPORTANTE: CREATE no permite modificar objetos existentes.
-- Para modificar una tabla existente se requiere ser el OWNER
-- de esa tabla, lo cual el admin NO es.

GRANT CREATE ON SCHEMA core TO role_admin;
GRANT CREATE ON SCHEMA media TO role_admin;
GRANT CREATE ON SCHEMA clasificadores TO role_admin;
GRANT CREATE ON SCHEMA hospedajes TO role_admin;
GRANT CREATE ON SCHEMA gastronomia TO role_admin;
GRANT CREATE ON SCHEMA agencias TO role_admin;
GRANT CREATE ON SCHEMA public TO role_admin;


-- ───────────────────────────────────────────────────────────────
-- Permisos sobre SEQUENCES para role_admin
-- ───────────────────────────────────────────────────────────────
-- ¿QUÉ SON LAS SEQUENCES?
--   Las sequences generan números secuenciales para IDs. Aunque
--   las tablas usan UUID, algunas operaciones internas de PostgreSQL
--   y funciones de utilidad pueden necesitar sequences.

-- ¿POR QUÉ USAGE y SELECT?
--   - USAGE permite obtener el siguiente valor (nextval)
--   - SELECT permite ver el valor actual (currval)
--   NO se dan UPDATE ni ALTER que permitirían resetear sequences
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA auth TO role_admin;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA core TO role_admin;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA media TO role_admin;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA clasificadores TO role_admin;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA hospedajes TO role_admin;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA gastronomia TO role_admin;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA agencias TO role_admin;

-- Otorgar permisos sobre la secuencia, en caso de que use una (aunque no suele ser el caso)
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO role_admin;


-- ───────────────────────────────────────────────────────────────
-- Permisos sobre FUNCIONES para role_app
-- ───────────────────────────────────────────────────────────────
-- ¿POR QUÉ EXECUTE?
--   EXECUTE permite llamar a funciones. Esto incluye:
--   - Funciones de negocio como buscar_negocios_cercanos()
--   - Funciones de utilidad como calcular_distancia()
--   - Triggers functions (aunque los triggers se ejecutan automáticamente)
--
-- IMPORTANTE: se permite EXECUTE cuando se creen las funciones en
-- migraciones posteriores. Por ahora no hay funciones que otorgar.

-- Este GRANT se aplicará a funciones futuras gracias a la migracion
-- ALTER DEFAULT PRIVILEGES configurada más adelante.
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA core TO role_admin;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO role_admin;


-- ───────────────────────────────────────────────────────────────
-- Acceso a vistas del sistema para análisis
-- ───────────────────────────────────────────────────────────────
-- ¿POR QUÉ NECESITA ACCESO A pg_stat_*?
--   Para análisis de rendimiento, el admin necesita consultar
--   estadísticas del sistema como:
--   - pg_stat_user_tables (para ver uso de índices)
--   - pg_stat_activity (para ver queries activas)
--   - pg_locks (para detectar bloqueos)
--
-- Estos permisos se otorgan automáticamente al tener acceso
-- a las tablas, pero es buena práctica documentarlo.

-- El role_admin podrá consultar estadísticas del sistema
-- sin necesidad de ser superusuario
GRANT pg_monitor TO role_admin;


-- ═══════════════════════════════════════════════════════════════
-- VERIFICACIÓN: Confirmar que el roles se creo correctamente
-- ═══════════════════════════════════════════════════════════════
DO $$
DECLARE
    role_admin_exists BOOLEAN;
BEGIN
    
    -- Verificar que role_admin existe
    SELECT EXISTS (
        SELECT 1 FROM pg_roles WHERE rolname = 'role_admin'
    ) INTO role_admin_exists;
    
    IF role_admin_exists THEN
        RAISE NOTICE '═══════════════════════════════════════════════════';
        RAISE NOTICE 'Rol creado exitosamente';
        RAISE NOTICE '═══════════════════════════════════════════════════';
        RAISE NOTICE '';
        RAISE NOTICE '   • role_admin (mantenimiento y optimización)';
        RAISE NOTICE '';
    ELSE
        RAISE EXCEPTION 'Error: No se pudo crear el rol correctamente';
    END IF;
END $$;