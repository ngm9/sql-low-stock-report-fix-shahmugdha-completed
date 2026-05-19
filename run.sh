#!/usr/bin/env bash
set -e

echo "Starting PostgreSQL container..."
docker-compose up -d

echo "Waiting for PostgreSQL to be ready..."
until docker-compose exec -T db pg_isready -U utkrusht -d marketplace >/dev/null 2>&1; do
  echo "PostgreSQL is not ready yet. Waiting..."
  sleep 2
done

echo "PostgreSQL is ready and the marketplace database is initialized."
