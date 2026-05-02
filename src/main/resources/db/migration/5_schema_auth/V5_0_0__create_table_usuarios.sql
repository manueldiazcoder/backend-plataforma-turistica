-- TABLA: usuarios
-- Descripción: Almacena información de usuarios del sistema
-- Autenticación: Local (hash) u OAuth (Google, Facebook, etc.)
CREATE TABLE auth.usuarios (
    id UUID DEFAULT uuid_generate_v4(),
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    contrasena_hash VARCHAR(60),
    proveedor_oauth VARCHAR(50),
    id_proveedor_oauth VARCHAR(255),
    correo_verificado BOOLEAN NOT NULL DEFAULT false,
    rol VARCHAR(20) NOT NULL DEFAULT 'VISITANTE',
    activo BOOLEAN NOT NULL DEFAULT true,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP,

    CONSTRAINT pk_usuarios_id PRIMARY KEY (id)
);

COMMENT ON TABLE auth.usuarios IS 'Usuarios del sistema (visitantes o encargados) con autenticación local o externa.';
COMMENT ON COLUMN auth.usuarios.id IS 'UUID único por usuario, no predecible, mejora la seguridad de datos expuestos.';
COMMENT ON COLUMN auth.usuarios.nombre IS 'Nombre completo del usuario.';
COMMENT ON COLUMN auth.usuarios.correo IS 'Correo electrónico único usado para autenticación.';
COMMENT ON COLUMN auth.usuarios.contrasena_hash IS 'Hash bcrypt de la contraseña (solo para autenticación local).';
COMMENT ON COLUMN auth.usuarios.proveedor_oauth IS 'Proveedor OAuth (Google, Facebook, etc.).';
COMMENT ON COLUMN auth.usuarios.id_proveedor_oauth IS 'ID proporcionado por el proveedor externo.';
COMMENT ON COLUMN auth.usuarios.correo_verificado IS 'Indica si el correo ha sido verificado.';
COMMENT ON COLUMN auth.usuarios.rol IS 'Define el nivel de permisos: VISITANTE o ENCARGADO.';
COMMENT ON COLUMN auth.usuarios.activo IS 'Permite desactivar usuarios sin eliminarlos físicamente.';
COMMENT ON COLUMN auth.usuarios.fecha_creacion IS 'Marca temporal de creación del registro.';
COMMENT ON COLUMN auth.usuarios.fecha_actualizacion IS 'Marca temporal de última actualización del registro.';