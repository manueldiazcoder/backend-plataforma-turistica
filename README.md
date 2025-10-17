

# 🏝️ Backend — Plataforma Turística  
**API REST | Spring Boot + PostgreSQL + Docker + Dev Containers**

---

## 🧭 Descripción general

Este repositorio contiene el **backend** del proyecto **Plataforma Turística**, una solución digital que busca **centralizar y organizar la oferta turística y comercial de municipios**.

El objetivo del proyecto es **mejorar la visibilidad de los negocios locales** (hoteles, restaurantes, guías turísticos, entre otros) y **facilitar a los visitantes el acceso a información confiable y actualizada** sobre lugares, actividades y servicios turísticos.

La aplicación fue diseñada bajo principios de **Clean Architecture** y **SOLID**, garantizando un código **modular, mantenible y escalable**, ideal para futuras integraciones con frontend web y móvil.

---

## 🧱 Arquitectura del sistema

### 📐 Principios aplicados
- 🧩 **Clean Architecture:** separación clara entre dominio, aplicación y adaptadores.  
- 🔊 **Screaming Architecture:** organización del código por *features*, no por capas técnicas.  
- 🧠 **Domain-Driven Design (DDD):** foco en la lógica del dominio turístico.  
- 📜 **Contract-first API:** documentación con **OpenAPI / Swagger**.  

---

### 🗂️ Estructura de carpetas
```bash
src/main/java/com/plataforma/backend/
├── core/         # Configuración global, seguridad, excepciones, utilidades
├── auth/         # Registro, login y autenticación JWT
├── business/     # Gestión de negocios locales
├── place/        # Información de lugares turísticos
├── map/          # API GeoJSON para el mapa interactivo
├── shared/       # DTOs, constantes y helpers
└── BackendApplication.java
```
---

## ⚙️ Tecnologías principales

| Categoría         | Tecnología |
|-------------------|-------------|
| 💻 Lenguaje       | **Java 17** |
| ⚙️ Framework       | **Spring Boot 3** |
| 🔐 Seguridad       | **Spring Security + JWT** |
| 🧮 ORM / BD        | **Hibernate / JPA + PostgreSQL** |
| 📘 Documentación   | **Swagger / OpenAPI 3.0** |
| 🧪 Testing         | **JUnit 5 + Mockito** |
| 🐳 Contenedores    | **Docker + Docker Compose** |
| 🧰 Entorno Dev     | **VS Code Dev Containers** |
| 🔄 CI/CD           | **GitHub Actions (plan futuro)** |

---

## 🚀 Instalación y configuración

### 🧩 Opción 1 — Usando Dev Containers (recomendada)

Este repositorio incluye configuración para **Dev Containers** de VS Code (carpeta `.devcontainer/`).

#### 📦 Requisitos previos
  - Docker Desktop o Docker Engine  
  - Visual Studio Code  
  - Extensión oficial: `Dev Containers (ms-vscode-remote.remote-containers)`

#### ▶️ Pasos

1. Clonar el repositorio
  ```bash
  git clone https://github.com/manueldiazcoder/backend-plataforma-turistica.git
  cd backend-plataforma-turistica
  ```
  
2. Abre el proyecto en VS Code.
  
3. Cuando aparezca la notificación “Reopen in Container”, haz clic en Reabrir en contenedor.
  
4. VS Code construirá automáticamente el entorno de desarrollo con:
    - JDK 17
    - Maven
    - PostgreSQL (servicio dentro del contenedor)
    - Variables de entorno configuradas para desarrollo

#### 📡 Tu API quedará disponible en:
    👉 http://localhost:8080

### 🧩 Opción 2 — Usando Docker Compose (sin Dev Containers)

#### 📦 Requisitos

  - Docker y Docker Compose instalados.

#### ▶️ Iniciar todo el entorno (API + DB)
  ```bash
  docker-compose up --build
  ```
#### 📂 Archivos relevantes
```bash
├── Dockerfile                # Imagen del backend (Spring Boot)
├── docker-compose.yml        # Orquesta API y PostgreSQL
├── .devcontainer/            # Configuración del entorno Dev Containers
└── src/                      # Código fuente Java
```
#### 🌐 Accesos por defecto
Servicio     |  URL / Host                             |  Credenciales
|------------|-----------------------------------------|--------------------------------------------|
Backend API  |  http://localhost:8080                  |  — 
Swagger UI   |  http://localhost:8080/swagger-ui.html  |  —
PostgreSQL   |  localhost:5432                         |  user: `postgres` / pass: `postgres` / db: `plataforma_turistica`

#### 🔑 Variables de entorno

Si no usas Dev Containers, crea un archivo .env en la raíz del proyecto con las siguientes variables:

```bash
SPRING_DATASOURCE_URL=jdbc:postgresql://db:5432/plataforma_turistica
SPRING_DATASOURCE_USERNAME=postgres
SPRING_DATASOURCE_PASSWORD=postgres
JWT_SECRET=mi_clave_secreta_segura
JWT_EXPIRATION=86400000
```

### 🧪 Testing

Ejecuta las pruebas unitarias con:
```bash
mvn test
```

🧠 Las pruebas utilizan JUnit 5 y Mockito, siguiendo buenas prácticas de aislamiento de capas y testing de casos de uso críticos.
En futuras versiones se añadirán pruebas de integración automatizadas dentro del pipeline CI/CD.

### 📚 Documentación de la API

Una vez ejecutada la aplicación, accede a:

- Swagger UI: 👉 http://localhost:8080/swagger-ui.html
- OpenAPI JSON: 👉 http://localhost:8080/v3/api-docs

### 🗺️ Endpoints principales (MVP)
Método   | Endpoint          | Descripción
----------|------------------|-------------------------------------------------------
POST      | /auth/register   | Registro de usuarios (dueños o turistas)
POST      | /auth/login      | Autenticación con JWT
GET       | /negocios        | Listar negocios con filtros y paginación
GET       | /lugares         | Listar lugares turísticos registrados
GET       | /map             | Obtener datos GeoJSON para el mapa interactivo
GET       | /health          | Verificar el estado general de la API

---

## 🔄 Flujo de trabajo con Git (GitFlow Simplificado)

Este proyecto utiliza un flujo de trabajo basado en **GitFlow simplificado**, una práctica estándar en proyectos profesionales para mantener el código limpio, organizado y escalable a futuro.

### 🧱 Estructura de ramas principal
```bash
main
│
├── develop
│ ├── feature/<nombre-de-la-funcionalidad>
│ ├── bugfix/<nombre-del-fix>
│ ├── release/<versión>
│ └── hotfix/<nombre-del-hotfix>
```

- **`main`** → Contiene el código estable en producción.  
- **`develop`** → Rama base para integrar nuevas funcionalidades.  
- **`feature/*`** → Cada nueva funcionalidad o módulo se desarrolla aquí.  
- **`bugfix/*`** → Correcciones de errores antes de una versión estable.  
- **`release/*`** → Preparación y pruebas previas al lanzamiento.  
- **`hotfix/*`** → Correcciones urgentes en producción.

---

### 💡 Convención de nombres de ramas

| Tipo de rama | Ejemplo |
|---------------|----------|
| Feature | `feature/auth-jwt` |
| Bugfix | `bugfix/fix-login-endpoint` |
| Release | `release/v1.0.0` |
| Hotfix | `hotfix/fix-db-connection` |

---

### 🧠 Convención de commits (Conventional Commits)

Usa prefijos estándar en los mensajes de commit para mantener un historial claro y legible:

| Tipo | Descripción | Ejemplo |
|------|--------------|----------|
| `feat:` | Nueva funcionalidad | `feat: add JWT authentication` |
| `fix:` | Corrección de error | `fix: handle null pointer in AuthService` |
| `chore:` | Tareas de mantenimiento | `chore: update dependencies` |
| `docs:` | Cambios en documentación | `docs: add Git workflow section` |
| `refactor:` | Refactorización de código | `refactor: improve service layer structure` |
| `test:` | Añadir o actualizar tests | `test: add unit test for login flow` |

---

### 🧭 Flujo de trabajo básico

#### 1️⃣ Crear una nueva rama para una funcionalidad
```bash
git checkout develop
git pull origin develop
git checkout -b feature/<nombre-de-la-funcionalidad>
```

#### 2️⃣ Trabajar y guardar cambios
```bash
git add .
git commit -m "feat: descripción corta de la nueva funcionalidad"
git push origin feature/<nombre-de-la-funcionalidad>
```

#### 3️⃣ Fusionar la funcionalidad en develop
```bash
git checkout develop
git merge --no-ff feature/<nombre-de-la-funcionalidad>
git push origin develop
```

⚙️ Cuando el proyecto sea estable, se generará una rama release/vX.X.X para preparar el lanzamiento, y luego se integrará en main.

### ☁️ Despliegue
#### 🌍 Fase inicial

- Despliegue en Render o Railway (entornos gratuitos).
- Uso de Docker como método de despliegue unificado.

#### 🚀 Fase de escalamiento

- Migración a AWS (EC2 + RDS) o GCP (Cloud Run + Cloud SQL).
- Preparación de infraestructura como código con Terraform.
- Contenedorización avanzada con Kubernetes (K3s / GKE).

### 👨‍💻 Autor

Juan Manuel Díaz
Desarrollador Full Stack | Java – Spring Boot – Angular – React Native

📧 manuelcoder@hotmail.com

🌐 https://linkedin.com/in/manuelcoder

💻 https://github.com/manueldiazcoder

### 📝 Licencia

Este proyecto se distribuye bajo la licencia **COMMUNITY LICENSE**.  
Consulta el archivo [`LICENSE`](./LICENSE) para más información.

### 💬 “La mejor arquitectura es la que permite evolucionar sin miedo a romper lo que ya funciona.”
