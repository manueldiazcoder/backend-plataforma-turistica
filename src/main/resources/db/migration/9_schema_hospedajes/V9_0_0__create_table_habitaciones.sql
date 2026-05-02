-- Esquema: hospedajes
-- Propósito:
--   Crear la tabla hospedajes.habitaciones para gestionar
--   las habitaciones disponibles en los hospedajes.
-- Depende de:
--   V1_14_0__create_table_negocios.sql
-- Afecta a: Negocios

CREATE TABLE hospedajes.habitaciones (
    id UUID NOT NULL DEFAULT uuid_generate_v4(),
    negocio_id UUID NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    descripcion VARCHAR(2000),
    capacidad_personas INT NOT NULL,
    numero_camas INT NOT NULL,
    tipo_camas VARCHAR(100),
    area_metros DECIMAL(6,2),
    precio_noche DECIMAL(10,2) NOT NULL,
    precio_fin_semana DECIMAL(10,2),
    bano_privado BOOLEAN,
    aire_acondicionado BOOLEAN,
    tv BOOLEAN,
    minibar BOOLEAN,
    balcon BOOLEAN,
    vista VARCHAR(50),
    orden INT NOT NULL DEFAULT 0,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT now(),
    fecha_actualizacion TIMESTAMP,
    fecha_eliminacion TIMESTAMP,

    CONSTRAINT pk_hospedajes_habitaciones PRIMARY KEY (id)
);

COMMENT ON TABLE hospedajes.habitaciones IS 'Habitaciones ofrecidas por negocios de hospedaje.';
COMMENT ON COLUMN hospedajes.habitaciones.id IS 'Identificador único de la habitación.';
COMMENT ON COLUMN hospedajes.habitaciones.negocio_id IS 'Referencia al hospedaje que ofrece la habitación.';
COMMENT ON COLUMN hospedajes.habitaciones.nombre IS 'Nombre o tipo de habitación.';
COMMENT ON COLUMN hospedajes.habitaciones.descripcion IS 'Descripción detallada de la habitación.';
COMMENT ON COLUMN hospedajes.habitaciones.capacidad_personas IS 'Cantidad máxima de personas.';
COMMENT ON COLUMN hospedajes.habitaciones.numero_camas IS 'Número de camas en la habitación.';
COMMENT ON COLUMN hospedajes.habitaciones.tipo_camas IS 'Tipo de camas (individual, doble, queen, king).';
COMMENT ON COLUMN hospedajes.habitaciones.area_metros IS 'Área de la habitación en metros cuadrados.';
COMMENT ON COLUMN hospedajes.habitaciones.precio_noche IS 'Precio por noche entre semana.';
COMMENT ON COLUMN hospedajes.habitaciones.precio_fin_semana IS 'Precio por noche en fin de semana.';
COMMENT ON COLUMN hospedajes.habitaciones.bano_privado IS 'Indica si tiene baño privado.';
COMMENT ON COLUMN hospedajes.habitaciones.aire_acondicionado IS 'Indica si tiene aire acondicionado.';
COMMENT ON COLUMN hospedajes.habitaciones.tv IS 'Indica si tiene televisión.';
COMMENT ON COLUMN hospedajes.habitaciones.minibar IS 'Indica si tiene minibar.';
COMMENT ON COLUMN hospedajes.habitaciones.balcon IS 'Indica si tiene balcón.';
COMMENT ON COLUMN hospedajes.habitaciones.vista IS 'Tipo de vista (mar, montaña, ciudad, etc.).';
COMMENT ON COLUMN hospedajes.habitaciones.orden IS 'Orden de presentación en listados.';
COMMENT ON COLUMN hospedajes.habitaciones.disponible IS 'Indica si la habitación está disponible para reservas.';
COMMENT ON COLUMN hospedajes.habitaciones.fecha_creacion IS 'Marca temporal de creación del registro.';
COMMENT ON COLUMN hospedajes.habitaciones.fecha_actualizacion IS 'Marca temporal de última actualización.';
COMMENT ON COLUMN hospedajes.habitaciones.fecha_eliminacion IS 'Marca temporal de eliminación lógica (soft delete).';