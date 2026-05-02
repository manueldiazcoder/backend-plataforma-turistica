# Pila Tecnológica: Backend Calima Explorer

Este documento detalla la pila tecnológica actual del proyecto backend "Calima Explorer", según lo inferido del análisis del código y la documentación existente.

## Tecnologías Principales

*   **Lenguaje de Programación:** Java 21
*   **Framework:** Spring Boot 3.5.13
*   **Seguridad:** Spring Security + JWT
*   **ORM / Base de Datos:** Hibernate / JPA + PostgreSQL
*   **Documentación:** Swagger / OpenAPI 3.0
*   **Testing:** JUnit 5 + Mockito
*   **Contenedores:** Docker + Docker Compose
*   **Entorno de Desarrollo:** VS Code Dev Containers
*   **CI/CD (plan futuro):** GitHub Actions

## Principios de Arquitectura

El proyecto está diseñado siguiendo los siguientes principios arquitectónicos:

*   **Arquitectura Limpia:** Separación clara entre dominio, aplicación y adaptadores.
*   **Arquitectura Estridente (Screaming Architecture):** Organización del código por funcionalidades (features), no por capas técnicas.
*   **Diseño Guiado por el Dominio (DDD):** Enfoque en la lógica del dominio turístico.
*   **API Basada en Contrato (Contract-first API):** La API está documentada y definida con OpenAPI / Swagger.