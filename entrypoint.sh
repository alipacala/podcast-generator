#!/bin/bash
set -e

echo "==================================="
echo "Starting Podcast Feed Generator..."
echo "==================================="

# 1. Configurar directorio seguro para evitar bloqueos en contenedores montados
git config --global --add safe.directory /github/workspace

# 2. Configurar usuario y email (usa variables dinámicas o valores por defecto)
ACTOR_NAME="${INPUT_NAME:-$GITHUB_ACTOR}"
ACTOR_EMAIL="${INPUT_EMAIL:-${GITHUB_ACTOR}@users.noreply.github.com}"

git config user.name "$ACTOR_NAME"
git config user.email "$ACTOR_EMAIL"

# 3. Ejecutar el generador en Python
python3 /usr/bin/feed.py

# 4. Comprobar si hay cambios antes de commitear y pushear
git add podcast.xml

if git diff --staged --quiet; then
  echo "No changes detected in podcast.xml. Skipping commit and push."
else
  echo "Changes detected. Committing and pushing..."
  git commit -m "Update podcast feed [skip ci]"
  git push origin main
fi

echo "==================================="
echo "Feed generation complete!"
echo "==================================="
