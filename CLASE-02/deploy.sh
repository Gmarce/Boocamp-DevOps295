#!/bin/bash

# Variables
WEB_URL="https://github.com/roxsross/devops-static-web/archive/devops-memory.zip"
WEB_DIR="/var/www/html"

# Instalar Apache
apt-get update
apt-get install -y apache2

# Descargar y extraer la página web
curl -L $WEB_URL -o web.zip
unzip web.zip -d $WEB_DIR
rm web.zip

# Iniciar el servicio de Apache
service apache2 start

echo "Página web instalada en $WEB_DIR"
