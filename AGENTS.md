# AGENTS.md - Calima Explorer

## Project Overview

Java 21 + Spring Boot 3.5.13 backend REST API. PostgreSQL 14 + PostGIS with Flyway migrations. Clean Architecture + DDD.

## Commands

### Build
```bash
./mvnw clean compile          # Compile
./mvnw clean package          # Build JAR (runs tests)
./mvnw clean package -DskipTests  # Build JAR, skip tests
./mvnw spring-boot:run        # Run locally
```

### Test (JUnit 5 + Mockito)
```bash
./mvnw test                              # Run all tests
./mvnw test -Dtest=ClassName             # Run single test class
./mvnw test -Dtest=ClassName#methodName  # Run single test method
./mvnw test -Dtest="*Test"               # Run tests matching pattern
```

### Docker
```bash
docker-compose up --build    # Start full environment (app + DB + Flyway + pgAdmin)
docker-compose down          # Stop all containers
```

### Lint/Format
No linting or formatting tools are currently configured in pom.xml. Follow the style conventions below manually.

## Code Style

### Formatting
- **Indentation**: Tabs (standard Spring Boot convention)
- **Braces**: K&R style — opening brace on same line
- **Line endings**: LF (enforced by .gitattributes)
- **Max line length**: 120 characters

### Naming Conventions
| Element | Convention | Example |
|---------|-----------|---------|
| Classes | PascalCase | `CalimaExplorerApplication` |
| Methods/variables | camelCase | `findBusinessById` |
| Constants | UPPER_SNAKE_CASE | `MAX_RESULTS` |
| Packages | lowercase, dot-separated | `com.calimaexplorer.auth` |
| DB migrations | `V<major>_<minor>__description.sql` | `V1_0__create_users.sql` |

### Imports
- No wildcard imports
- Order: `java.*` → `javax.*` → third-party → `org.springframework.*` → project packages
- Group imports with blank lines between groups

### Lombok
Use Lombok annotations to reduce boilerplate — do NOT write getters/setters/constructors manually:
- `@Data` for DTOs and simple entities
- `@Builder` for entities and DTOs
- `@AllArgsConstructor` / `@NoArgsConstructor` for JPA entities
- `@Slf4j` for logging (`log.info(...)`, `log.error(...)`)
- `@RequiredArgsConstructor` on controllers/services for constructor injection

### Types
- Strongly typed Java — no raw types
- Use `Optional<T>` for nullable returns
- Use `Record` types for immutable DTOs where appropriate
- DTOs at API boundaries, domain entities in the core

### Error Handling
- Use Spring `@ControllerAdvice` + `@ExceptionHandler` for global error handling
- Return appropriate HTTP status codes (400, 401, 403, 404, 500)
- Use custom exception classes extending `RuntimeException`
- Log errors with `@Slf4j` — never swallow exceptions

### Architecture
- **Clean Architecture**: domain → application → adapters
- **Screaming Architecture**: organize by feature (auth, negocios, lugares, map), not by technical layer
- **Repository Pattern**: Spring Data JPA interfaces
- **DTO Pattern**: separate request/response DTOs from domain entities

## Git Workflow

### Branching (GitFlow)
- `main` → production-ready code
- `develop` → integration branch
- `feature/<name>` → new features (branch from `develop`)
- `hotfix/<name>` → urgent fixes (branch from `main`)

### Commits (Conventional Commits)
```
type(scope): description

feat(auth): add JWT token refresh endpoint
fix(lugares): resolve coordinate validation error
docs(readme): update setup instructions
```
Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

### Pull Requests
- Target `develop` branch
- Require code review before merge
- All quality gates must pass (tests, coverage >80%, no lint errors)

## Testing

- **Coverage target**: >80% (enforced by DoD)
- Test file naming: `*Test.java` under `src/test/java/`
- Mirror main package structure in test directory
- Use `@MockBean` for Spring context testing
- Use `@DataJpaTest` for repository tests
- Use `@WebMvcTest` for controller tests
- Use `@SpringBootTest` for integration tests

## Database

- Flyway manages all schema changes — never modify existing migrations
- New migrations go in `src/main/resources/db/migration/`
- Use PostGIS types for geographic data (`geometry`, `geography`)

## Key References

| Doc | Path |
|-----|------|
| Definition of Done | `docs/tecnica/agile/DoD.md` |
| Definition of Ready | `docs/tecnica/agile/DoR.md` |
| Working Agreements | `docs/tecnica/agile/WorkingAgreements.md` |
| Architecture | `docs/tecnica/01-arquitectura.md` |
| Tech Stack | `docs/tecnica/asistenteAI/conductor/tech-stack.md` |
| Code Style Guide | `docs/tecnica/asistenteAI/conductor/code_styleguides/general.md` |
| TDD Workflow | `docs/tecnica/asistenteAI/conductor/workflow.md` |
| OpenAPI Spec | `docs/tecnica/openapi.json` |
