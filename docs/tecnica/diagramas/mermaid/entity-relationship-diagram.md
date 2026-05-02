```mermaid
erDiagram
    USUARIO {
        UUID id PK
        VARCHAR email UK
        VARCHAR password
        VARCHAR nombre
        VARCHAR apellido
        BOOLEAN is_enabled
        TIMESTAMP fecha_registro
    }

    ROL {
        UUID id PK
        VARCHAR nombre UK
    }

    USUARIO ||--o{ ROL : tiene

    NEGOCIO {
        UUID id PK
        VARCHAR nombre
        VARCHAR descripcion
        VARCHAR direccion
        DECIMAL latitud
        DECIMAL longitud
        VARCHAR telefono
        VARCHAR email_contacto
        VARCHAR sitio_web
        UUID usuario_id FK
        BOOLEAN es_aprobado
        TIMESTAMP fecha_creacion
    }

    LUGAR {
        UUID id PK
        VARCHAR nombre
        VARCHAR descripcion
        DECIMAL latitud
        DECIMAL longitud
        UUID usuario_id FK
        BOOLEAN es_aprobado
        TIMESTAMP fecha_creacion
    }

    USUARIO ||--o{ NEGOCIO : posee
    USUARIO ||--o{ LUGAR : crea

    CATEGORIA {
        UUID id PK
        VARCHAR nombre UK
    }

    NEGOCIO ||--o{ CATEGORIA : pertenece_a
    LUGAR ||--o{ CATEGORIA : pertenece_a

    IMAGEN {
        UUID id PK
        VARCHAR url
        VARCHAR descripcion
        UUID negocio_id FK
        UUID lugar_id FK
    }

    NEGOCIO ||--o{ IMAGEN : tiene
    LUGAR ||--o{ IMAGEN : tiene

    PRODUCTO_SERVICIO {
        UUID id PK
        VARCHAR nombre
        VARCHAR descripcion
        DECIMAL precio
        UUID negocio_id FK
    }

    NEGOCIO ||--o{ PRODUCTO_SERVICIO : ofrece

    RESEÑA {
        UUID id PK
        INTEGER calificacion
        VARCHAR comentario
        UUID usuario_id FK
        UUID negocio_id FK
        UUID lugar_id FK
        TIMESTAMP fecha_creacion
    }

    USUARIO ||--o{ RESEÑA : escribe
    NEGOCIO ||--o{ RESEÑA : tiene
    LUGAR ||--o{ RESEÑA : tiene

    RESERVA {
        UUID id PK
        TIMESTAMP fecha_reserva
        TIMESTAMP fecha_inicio
        TIMESTAMP fecha_fin
        UUID usuario_id FK
        UUID negocio_id FK
        DECIMAL total
        VARCHAR estado
    }

    USUARIO ||--o{ RESERVA : realiza
    ```