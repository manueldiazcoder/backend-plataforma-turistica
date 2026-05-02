-- RESPONSABILIDAD: Crear el role-group (plantilla de permisos) que define
--   el nivel de acceso en la base de datos.
-- NOTA:  Este role NO tienen LOGIN (no es cuenta de usuario).
--   Es plantilla de permisos que se asignará a un usuario real de la base de datos
--   mediante GRANT role_name TO user_name.



-- ───────────────────────────────────────────────────────────────
-- ROLE_APP (Web + Móvil)
-- ───────────────────────────────────────────────────────────────
-- DESCRIPCIÓN:
--   Define los permisos que necesita la aplicación Spring Boot (web) y React Native (móvil)
--   para funcionar normalmente.
--
-- PERMISOS QUE TENDRÁ:
--   ✓ SELECT, INSERT, UPDATE, DELETE en todas las tablas que se modifiquen 
--     desde el sitio web y la app móvil. 
--   ✓ USAGE y SELECT en secuencias (para IDs autogenerados)
--   ✓ EXECUTE en funciones y utilidades que se ejecuten en el sitio web y la app.
--   ✗ NO puede crear ni eliminar tablas (DDL prohibido)
--   ✗ NO puede modificar la estructura de la BD
--
-- USO ESPERADO:
--   - Conexiones desde Spring Boot (backend web)
--   - Conexiones desde React Native (app móvil)
--   - Uso 24/7 en producción

CREATE ROLE role_app NOLOGIN;
COMMENT ON ROLE role_app IS 
'Role-group para aplicaciones operativas (web y móvil). 
Define permisos de lectura/escritura sobre datos sin acceso a DDL.';


-- ═══════════════════════════════════════════════════════════════
-- ASIGNACIÓN DE PERMISOS Al ROLE-GROUP role_app
-- ═══════════════════════════════════════════════════════════════

-- IMPORTANTE: Esta sección asigna permisos al role-group.
-- Cuando más adelante se creen usuarios reales y se les otorgue
-- GRANT role_app TO app_user, ese usuario heredará
-- automáticamente todos estos permisos.

-- Esto sigue el principio de DRY (Don't Repeat Yourself):
-- se definen permisos una sola vez aquí, y luego se asignan
-- membresías a los usuarios.

-- ───────────────────────────────────────────────────────────────
--  Otorgar USAGE en todos los esquemas
-- ───────────────────────────────────────────────────────────────

-- role_app necesita USAGE en todos los esquemas porque
-- la aplicación lee y escribe datos en todos ellos
GRANT USAGE ON SCHEMA auth TO role_app;
GRANT USAGE ON SCHEMA core TO role_app;
GRANT USAGE ON SCHEMA media TO role_app;
GRANT USAGE ON SCHEMA clasificadores TO role_app;
GRANT USAGE ON SCHEMA hospedajes TO role_app;
GRANT USAGE ON SCHEMA gastronomia TO role_app;
GRANT USAGE ON SCHEMA agencias TO role_app;
GRANT USAGE ON SCHEMA public TO role_app;


-- ───────────────────────────────────────────────────────────────
--  Permisos de TABLAS para role_app
-- ───────────────────────────────────────────────────────────────
-- ¿POR QUÉ ALL TABLES EN CADA SCHEMA?
--   Este comando otorga permisos sobre TODAS las tablas que ya
--   existen en el esquema al momento de ejecutar esta migración.
--
--   Más adelante, en V1_11_0__default_privileges.sql, se configura
--   que las tablas FUTURAS también reciban estos permisos
--   automáticamente.
--
-- ¿POR QUÉ SELECT, INSERT, UPDATE, DELETE?
--   Estos son los permisos CRUD básicos que cualquier aplicación
--   necesita. NO se incluyen TRUNCATE ni REFERENCES porque son
--   operaciones que solo un administrador debería hacer.

-- Esquemas principales: la aplicación necesita acceso completo
-- para gestionar usuarios, negocios, lugares, imágenes, productos, etc.
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA auth TO role_app;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA core TO role_app;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA media TO role_app;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA hospedajes TO role_app;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA gastronomia TO role_app;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA agencias TO role_app;

-- Esquema clasificadores: Estos clasificadores maestros (categorías).
-- La aplicación necesita leerlos pero NO modificarlos.
-- Las categorias se modifican solo por admins.
GRANT SELECT ON ALL TABLES IN SCHEMA clasificadores TO role_app;


-- ───────────────────────────────────────────────────────────────
-- Permisos sobre SEQUENCES para role_app
-- ───────────────────────────────────────────────────────────────
-- ¿QUÉ SON LAS SEQUENCES?
--   Las sequences generan números secuenciales para IDs. Aunque
--   las tablas usan UUID, algunas operaciones internas de PostgreSQL
--   y funciones de utilidad pueden necesitar sequences.

-- ¿POR QUÉ USAGE y SELECT?
--   - USAGE permite obtener el siguiente valor (nextval)
--   - SELECT permite ver el valor actual (currval)
--   NO se dan UPDATE ni ALTER que permitirían resetear sequences

GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA auth TO role_app;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA core TO role_app;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA media TO role_app;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA clasificadores TO role_app;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA hospedajes TO role_app;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA gastronomia TO role_app;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA agencias TO role_app;


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
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA core TO role_app;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO role_app;


-- Revocar la capacidad de crear objetos en el esquema 'public'
REVOKE CREATE ON SCHEMA public FROM role_app;


-- ═══════════════════════════════════════════════════════════════
-- VERIFICACIÓN: Confirmar que el roles se creo correctamente
-- ═══════════════════════════════════════════════════════════════
DO $$
DECLARE
    role_app_exists BOOLEAN;
BEGIN
    -- Verificar que role_app existe
    SELECT EXISTS (
        SELECT 1 FROM pg_roles WHERE rolname = 'role_app'
    ) INTO role_app_exists;
    
    IF role_app_exists THEN
        RAISE NOTICE '═══════════════════════════════════════════════════';
        RAISE NOTICE '✅ Rol creado exitosamente';
        RAISE NOTICE '═══════════════════════════════════════════════════';
        RAISE NOTICE '';
        RAISE NOTICE '📋 Roles disponibles:';
        RAISE NOTICE '   • role_app (operativo para web + móvil)';
    ELSE
        RAISE EXCEPTION 'Error: No se pudo crear el rol correctamente';
    END IF;
END $$;