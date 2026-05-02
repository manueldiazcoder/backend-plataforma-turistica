# Diagrama de Casos de Uso

```mermaid
graph TD
    subgraph "Sistema: Plataforma Calima Explorer"
        ActorTurista[Turista]
        ActorDueño[Dueño de Negocio]
        ActorAdmin[Administrador]

        usecase1[Ver Mapa y Categorías]
        usecase2[Buscar y Filtrar Negocios]
        usecase3[Ver Detalles de Negocio/Lugar]
        usecase4[Ver Negocios Cercanos]

        usecase5[Solicitar Rol de Dueño]
        usecase6[Crear Nuevo Negocio]
        usecase7[Actualizar Información del Negocio]

        usecase8[Aprobar Solicitud de Rol]
        usecase9[Aprobar Nuevos Negocios]
        usecase10[Gestionar Contenidos]
        usecase11[Agregar Lugares de Interés]

        ActorTurista --> usecase1
        ActorTurista --> usecase2
        ActorTurista --> usecase3
        ActorTurista --> usecase4

        ActorDueño --> usecase5
        ActorDueño --> usecase6
        ActorDueño --> usecase7

        ActorAdmin --> usecase8
        ActorAdmin --> usecase9
        ActorAdmin --> usecase10
        ActorAdmin --> usecase11

        usecase5 -- incluye --> usecase8
    end
```