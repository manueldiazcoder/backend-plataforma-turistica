# Documento de Arquitectura de Software (SAD)

## 1. Introducción

- **Propósito:** Documentar las decisiones arquitectónicas del sistema de plataforma turística digital.
- **Alcance:** MVP orientado a un directorio digital de negocios y actividades turísticas de un municipio, con información estratégica y mapa interactivo.
- **Stakeholders:**
  - Turistas (usuarios finales).
  - Dueños de negocios (hoteles, restaurantes, guías, etc.).

---

## 2. Requisitos Arquitectónicos

- **Funcionales (corto plazo/MVP):**
  1. Registro/Login de usuarios.
  2. Visualización de información estratégica (negocios, sitios turísticos, actividades).
  3. Directorio digital simple (con buscador/filtros básicos).
  4. Mapa interactivo con puntos de interés.
  5. Dueños pueden registrar y modificar su negocio.
- **No funcionales:**
  - Escalabilidad horizontal (futuro crecimiento).
  - Seguridad (Spring Security + JWT).
  - Usabilidad (UI clara, responsive).
  - Multi-idioma (en frontend).
  - Despliegue en servicios gratuitos inicialmente, con opción de migrar a cloud grande.

---

## 3. Vista Lógica

- **Paradigma:** Orientado a Objetos.
- **Patrones principales:**
  - Clean Architecture y Screaming Architecture.
  - DTOs (Data Transfer Objects) para comunicación entre frontend y backend.
  - Repository Pattern (Hibernate + SQL).
  - Singleton (para servicios clave como configuración o seguridad).
  - Observer (para WebSockets/notificaciones en el futuro).

---

## 4. Vista de Desarrollo

- **Repositorios:**
  - `backend/` → Spring Boot + Hibernate + PostgreSQL.
  - `frontend/` → Angular + NgRx.
  - `mobile/` → React Native + Redux Toolkit.
- **IDE principal:** VS Code con perfil para cada area.

---

## 5. Vista de Procesos

- **Flujo general:**
  1. Turista se registra/login.
  2. Frontend consulta API REST (Spring Boot).
  3. Backend accede a BD (PostgreSQL vía Hibernate).
  4. Devuelve DTOs al frontend/mobile.
  5. Mapa se alimenta de datos de la API.
- **Comunicación:**
  - API REST (JSON).
  - Futuro: WebSockets para notificaciones.

---

## 6. Vista Física (Infraestructura / Despliegue)

- **Fase inicial (gratuito):**
  - Backend → Render/Railway.
  - Frontend → Vercel/Netlify.
  - Base de datos → Railway (Postgres free).
  - Mobile → Play Store (Android).
- **Fase escalamiento:**
  - Migración a AWS (EC2, RDS), GCP (Cloud Run, Cloud SQL) o Azure.
  - CI/CD con GitHub Actions.

---

## 7. Calidad y Restricciones

- **Calidad:** Testing con JUnit/Mockito (backend), Jest (frontend).
- **Restricciones:**
  - Evitar altos costos en cloud al inicio.
  - Mantener MVP simple, luego evolucionar.

---

## Arquitectura técnica — Resumen

### Principios

- Clean Architecture
- Screaming Architecture
- Domain-Driven Design (orientación al dominio)

### Stack recomendado (MVP)

-   **Backend:** Java 21 + Spring Boot 3.5.13, Hibernate/JPA, PostgreSQL
-   **Frontend:** Angular + NgRx (TypeScript)
-   **Mobile:** React Native + Redux Toolkit
-   **Infra:** Docker, Docker Compose, Railway/Render (fase inicial)

### Componentes clave

-   Autenticación (JWT)
-   Servicio de mapas (GeoJSON)
