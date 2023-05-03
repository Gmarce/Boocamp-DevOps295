#!/bin/bash

# Obtener la url de la página web como primer argumento
URL=$1

# Obtener la palabra a buscar como segundo argumento
PALABRA=$2

# Descargar el contenido de la página web a un fichero
curl -s $URL > web.html

# Buscar la palabra dada en el fichero y mostrar el número de linea
grep -n $PALABRA web.html
