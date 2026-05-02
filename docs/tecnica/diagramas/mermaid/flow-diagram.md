flowchart TD
    A[Inicio: Usuario registrado] --> B{Solicitar Rol de Dueño de Negocio?};
    B -- Sí --> C[Formulario de Solicitud de Rol];
    C --> D{Administrador Aprueba Solicitud?};
    D -- No --> E[Notificación: Solicitud Rechazada];
    D -- Sí --> F[Rol de Dueño Asignado];
    F --> G{Crear Nuevo Negocio?};
    G -- Sí --> H[Formulario de Registro de Negocio];
    H --> I{Negocio Enviado para Revisión};
    I --> J{Administrador Aprueba Negocio?};
    J -- No --> K[Notificación: Negocio Rechazado];
    J -- Sí --> L[Negocio Publicado];
    L --> M{Editar Información del Negocio?};
    M -- Sí --> N[Panel de Gestión de Negocio];
    N --> O[Actualizar Datos (Precios, Fotos, Promociones)];
    O --> L;
    G -- No --> Z[Fin: Dueño de Negocio Activo];
    E --> Z;
    K --> Z;