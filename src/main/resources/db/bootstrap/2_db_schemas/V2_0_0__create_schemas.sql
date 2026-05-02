-- PROPÓSITO:
--   Crear los esquemas principales del sistema:
--   - auth: autenticación y usuarios
--   - core: entidades de negocio principales (lugares, negocios)
--   - media: gestión de imágenes y recursos
--   - clasificadores: listas maestras y catálogos globales


-- RESPONSABILIDAD: crear el esquema "auth" (usuarios, roles, tokens).
CREATE SCHEMA IF NOT EXISTS auth;
COMMENT ON SCHEMA auth IS 'Gestión de usuarios, autenticación y roles (datos sensibles).';

-- RESPONSABILIDAD: crear el esquema "core" (entidades principales: negocios/lugares)
CREATE SCHEMA IF NOT EXISTS core;
COMMENT ON SCHEMA core IS 'Dominio principal: negocios, lugares, categorías y relaciones principales.';

-- RESPONSABILIDAD: crear el esquema "media" (imágenes)
CREATE SCHEMA IF NOT EXISTS media;
COMMENT ON SCHEMA media IS 'Tablas y objetos relacionados con imágenes, galerías y recursos multimedia.';

-- RESPONSABILIDAD: crear el esquema "clasificadores" (categorias de referencia)
CREATE SCHEMA IF NOT EXISTS clasificadores;
COMMENT ON SCHEMA clasificadores IS 'Clasificadores de referencia para organizacion y separacion de privilegios para tablas que no seran modificables por los usuarios de la plataforma.';

-- RESPONSABILIDAD: crear el esquema "hospedajes" (habitaciones)
CREATE SCHEMA IF NOT EXISTS hospedajes;
COMMENT ON SCHEMA hospedajes IS 'Datos específicos de habitaciones.';

-- RESPONSABILIDAD: crear el esquema "gastronomia" (menús o productos)
CREATE SCHEMA IF NOT EXISTS gastronomia;
COMMENT ON SCHEMA gastronomia IS 'productos, menús.';

-- RESPONSABILIDAD: crear el esquema "agencias" (agencias y tours)
CREATE SCHEMA IF NOT EXISTS agencias;
COMMENT ON SCHEMA agencias IS 'tours, experiencias.';