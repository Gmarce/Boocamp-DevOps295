### Parte 1: Servidor Nginx
1.- Crear un archivo Dockerfile:
- FROM nginx
COPY web /usr/share/nginx/html
EXPOSE 80

2- Construir la imagen del contenedor: 
- docker build -t bootcamp-web .
- Crea una imagen llamada "bootcamp-web"

3.- Ejecutar el contenedor:
- docker run -d -p 9999:80 --name bootcamp-web bootcamp-web
- Inicia en el contenedor: bootcamp-web
- Expondra en el puerto: 80 del contenedor puerto 9999 del host
- Nombra el contenedor: bootcamp-web

4.- Verificar que los archivos se han copiado correctamente:
- docker exec bootcamp-web ls /usr/share/nginx/html

5.- Acceder al servidor web:
- curl localhost:9999

6.- Detener y eliminar el contenedor:
- docker stop bootcamp-web && docker rm bootcamp-web

7.- Eliminar la imagen del contenedor:
- docker rmi bootcamp-web

