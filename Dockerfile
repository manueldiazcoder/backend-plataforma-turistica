# 1. IMAGEN BASE: Maven 3.9 + JDK 21 (Requerido por la extensión de VS Code)
# Usamos una etiqueta oficial y estable que incluye Maven 3.9, JDK 21 y la base Alpine (ligera)
FROM maven:3.9.14-eclipse-temurin-21

# Crear la misma estructura de carpetas que en tu PC real
RUN mkdir -p /home/manueld1az/Projects/CalimaExplorer/backend

# Establecemos el nuevo directorio de trabajo
WORKDIR /home/manueld1az/Projects/CalimaExplorer/backend

# 2. INSTALAR UTILIDADES (Usando 'apt-get' para Debian/Ubuntu basado en la imagen)
# Instalamos curl, git y 'uuidgen' (paquete util-linux)
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    util-linux \
    && curl -fsSL https://opencode.ai/install | bash \
    && rm -rf /var/lib/apt/lists/*

# 3. CONFIGURACIÓN
# Configuración de zona horaria (opcional, pero buena práctica)
ENV TZ=UTC

# Ejecutar el comando para mantener el contenedor vivo
CMD ["sleep", "infinity"]