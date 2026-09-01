FROM python:3.11-slim

# Instalar Git y dependencias mínimas limpiando la caché de apt
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
 && rm -rf /var/lib/apt/lists/*

# Instalar dependencias de Python sin guardar caché de pip
RUN pip install --no-cache-dir pyYAML

# Copiar scripts
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Asegurar permisos de ejecución en el script de entrada
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
