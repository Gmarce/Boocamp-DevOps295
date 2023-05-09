### Parte 1: 
1.- Crear un archivo Dockerfile:
- #Imagen que voy a utilizar como base
FROM httpd:2.4

#Etiquetado
LABEL project="bootcamp"

#Como metadato, indicamos que el contenedor utiliza el puerto 80
EXPOSE 80

#Modificaciones sobre la imagen que he utilizado como base
COPY content/ /usr/local/apache2/htdocs/

2.- Construir la imagen a partir del Dockerfile:
- docker build . -t simple-apache:new

3.-  Ejecutar un contenedor:
- docker run -d --name myapache -p 5050:80 simple-apache:new

4.- Verificar cuantas capas tiene la imagen creada:
- docker history simple-apache:new





