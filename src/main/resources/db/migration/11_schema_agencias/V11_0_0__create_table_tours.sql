-- Esquema: agencias
-- Propósito:
--   Crear la tabla agencias.tours para gestionar
--   los tours ofrecidos por las agencias de viajes.
-- Depende de:
--   V1_14_0__create_table_negocios.sql
-- Afecta a: Negocios
-- ================================================
-- TABLA: tours
-- Descripción: Tours y experiencias ofrecidas por agencias de viajes
-- ================================================
CREATE TABLE agencias.tours (
    id UUID NOT NULL DEFAULT uuid_generate_v4(),
    negocio_id UUID NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    duracion_horas DECIMAL(5,2),
    duracion_dias INT,
    precio_adulto DECIMAL(10,2) NOT NULL,
    precio_nino DECIMAL(10,2),
    precio_grupo DECIMAL(10,2),
    capacidad_minima INT DEFAULT 1,
    capacidad_maxima INT,
    nivel_dificultad VARCHAR(20),
    incluye TEXT,
    no_incluye TEXT,
    que_llevar TEXT,
    restricciones TEXT,
    punto_encuentro VARCHAR(300),
    hora_inicio TIME,
    requiere_reserva BOOLEAN NOT NULL DEFAULT TRUE,
    dias_anticipacion INT NOT NULL DEFAULT 1,
    imagen_url VARCHAR(500),
    orden INT NOT NULL DEFAULT 0,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT now(),
    fecha_actualizacion TIMESTAMP,
    fecha_eliminacion TIMESTAMP,

    CONSTRAINT pk_agencias_tours PRIMARY KEY (id)
);

COMMENT ON TABLE agencias.tours IS 'Tours y experiencias turísticas ofrecidas por agencias.';
COMMENT ON COLUMN agencias.tours.id IS 'Identificador único del tour.';
COMMENT ON COLUMN agencias.tours.negocio_id IS 'Referencia a la agencia que ofrece el tour.';
COMMENT ON COLUMN agencias.tours.nombre IS 'Nombre del tour o experiencia.';
COMMENT ON COLUMN agencias.tours.descripcion IS 'Descripción completa del tour.';
COMMENT ON COLUMN agencias.tours.duracion_horas IS 'Duración del tour en horas.';
COMMENT ON COLUMN agencias.tours.duracion_dias IS 'Duración del tour en días.';
COMMENT ON COLUMN agencias.tours.precio_adulto IS 'Precio por adulto.';
COMMENT ON COLUMN agencias.tours.precio_nino IS 'Precio por niño.';
COMMENT ON COLUMN agencias.tours.precio_grupo IS 'Precio por grupo.';
COMMENT ON COLUMN agencias.tours.capacidad_minima IS 'Número mínimo de participantes.';
COMMENT ON COLUMN agencias.tours.capacidad_maxima IS 'Número máximo de participantes.';
COMMENT ON COLUMN agencias.tours.nivel_dificultad IS 'Nivel de exigencia física (FACIL, MODERADO, DIFICIL, EXTREMO).';
COMMENT ON COLUMN agencias.tours.incluye IS 'Lista de lo que incluye el tour.';
COMMENT ON COLUMN agencias.tours.no_incluye IS 'Lista de lo que no incluye el tour.';
COMMENT ON COLUMN agencias.tours.que_llevar IS 'Recomendaciones de qué llevar.';
COMMENT ON COLUMN agencias.tours.restricciones IS 'Restricciones o requisitos especiales.';
COMMENT ON COLUMN agencias.tours.punto_encuentro IS 'Lugar de encuentro para iniciar el tour.';
COMMENT ON COLUMN agencias.tours.hora_inicio IS 'Hora de inicio del tour.';
COMMENT ON COLUMN agencias.tours.requiere_reserva IS 'Indica si requiere reserva previa.';
COMMENT ON COLUMN agencias.tours.dias_anticipacion IS 'Días mínimos de anticipación para reservar.';
COMMENT ON COLUMN agencias.tours.imagen_url IS 'URL de la imagen representativa del tour.';
COMMENT ON COLUMN agencias.tours.orden IS 'Orden de presentación en listados.';
COMMENT ON COLUMN agencias.tours.disponible IS 'Indica si el tour está disponible actualmente.';
COMMENT ON COLUMN agencias.tours.fecha_creacion IS 'Marca temporal de creación del registro.';
COMMENT ON COLUMN agencias.tours.fecha_actualizacion IS 'Marca temporal de última actualización.';
COMMENT ON COLUMN agencias.tours.fecha_eliminacion IS 'Marca temporal de eliminación lógica (soft delete).';