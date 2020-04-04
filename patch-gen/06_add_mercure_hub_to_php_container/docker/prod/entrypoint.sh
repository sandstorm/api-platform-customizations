#!/bin/sh
set -e

export DATABASE_URL=postgres://${DB_USER}:${DB_PASSWORD}@${DB_HOST}/${DB_NAME}

exec /usr/local/bin/docker-entrypoint "$@"
