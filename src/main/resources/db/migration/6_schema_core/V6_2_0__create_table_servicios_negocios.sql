-- TABLA: servicios_negocios
-- Descripción: Servicios ofrecidos por negocios turísticos (WiFi, parqueadero, desayuno, etc.)
CREATE TABLE core.servicios_negocios (
    negocio_id UUID NOT NULL,
    servicio_id UUID NOT NULL,
    precio_adicional DECIMAL(10,2),
    descripcion_extra VARCHAR(500),
    fecha_agregado TIMESTAMP NOT NULL DEFAULT now(),

    CONSTRAINT pk_servicios_negocios PRIMARY KEY (negocio_id, servicio_id)
);

COMMENT ON TABLE core.servicios_negocios IS 'Servicios específicos ofrecidos por cada negocio.';
COMMENT ON COLUMN core.servicios_negocios.negocio_id IS 'Referencia al negocio.';
COMMENT ON COLUMN core.servicios_negocios.servicio_id IS 'Referencia al servicio del catálogo.';
COMMENT ON COLUMN core.servicios_negocios.precio_adicional IS 'Costo adicional del servicio (si aplica).';
COMMENT ON COLUMN core.servicios_negocios.descripcion_extra IS 'Información adicional específica del servicio en este negocio.';
COMMENT ON COLUMN core.servicios_negocios.fecha_agregado IS 'Marca temporal de cuándo se agregó el servicio al negocio.';