-- Vista: Lugares activos
CREATE OR REPLACE VIEW v_lugares_activos AS
SELECT 
    l.id,
    l.nombre,
    l.descripcion_corta,
    l.descripcion,
    l.direccion,
    l.ubicacion,
    l.precio_entrada,
    l.horario_acceso,
    l.url_imagen_principal,
    c.nombre AS categoria_nombre,
    u.nombre AS creador_nombre,
    (SELECT COUNT(*) FROM media.imagenes_lugares WHERE lugar_id = l.id) AS total_imagenes
FROM core.lugares l
INNER JOIN clasificadores.categorias c ON l.categoria_id = c.id
INNER JOIN auth.usuarios u ON l.creador_id = u.id
WHERE l.activo = TRUE 
  AND l.fecha_eliminacion IS NULL
  AND c.activa = TRUE;


-- Vista: Negocios activos con información completa
CREATE OR REPLACE VIEW v_negocios_activos AS
SELECT 
    n.id,
    n.nombre,
    n.descripcion_corta,
    n.descripcion,
    n.direccion,
    n.ubicacion,
    n.telefono_principal,
    n.whatsapp,
    n.email_contacto,
    n.url_imagen_principal,
    n.rango_precios,
    n.horario_atencion,
    n.abierto_ahora,
    c.nombre AS categoria_nombre,
    u.nombre AS encargado_nombre,
    u.correo AS encargado_correo,
    (SELECT COUNT(*) FROM media.imagenes_negocios WHERE negocio_id = n.id) AS total_imagenes,
    (SELECT COUNT(*) FROM core.servicios_negocios WHERE negocio_id = n.id) AS total_servicios
FROM core.negocios n
INNER JOIN clasificadores.categorias c ON n.categoria_id = c.id
INNER JOIN auth.usuarios u ON n.encargado_id = u.id
WHERE n.activo = TRUE 
  AND n.fecha_eliminacion IS NULL
  AND c.activa = TRUE;