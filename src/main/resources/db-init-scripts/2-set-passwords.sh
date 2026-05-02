#!/bin/bash
set -e

# Este script usa la variable de entorno BOOTSTRAP_ADMIN_USER_PASSWORD del docker-compose
# para actualizar la contraseña del usuario creado en el paso anterior.
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    ALTER ROLE bootstrap_admin WITH PASSWORD '$BOOTSTRAP_ADMIN_USER_PASSWORD';
EOSQL