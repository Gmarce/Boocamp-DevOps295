# Desplegar el proyecto lamp-ecommerce en contenedores lamp-app-ecommerce

# 1.- Clonar el repositorio:

git clone https://github.com/roxsross/The-DevOps-Journey-101.git


# 2.- Crear un archivo Dockerfile en la raíz del proyecto:

# Utilizar una imagen base de PHP y Apache
FROM php:7.4-apache

# Instalar las extensiones necesarias de PHP
RUN docker-php-ext-install mysqli

# Copiar los archivos del proyecto al directorio del servidor web
COPY ./ /var/www/html/

# Configurar permisos en el directorio del servidor web
RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 755 /var/www/html/

# Exponer el puerto 80 para acceder al servidor web
EXPOSE 80

# Iniciar el servidor web Apache en segundo plano
CMD ["apache2-foreground"]

# 3.- Crear un archivo docker-compose.yml en la raíz del proyecto:

version: '3'
services:
  web:
    build: .
    ports:
      - "8080:80"
    depends_on:
      - db
  db:
    image: mariadb
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: ecomdb
      MYSQL_USER: ecomuser
      MYSQL_PASSWORD: ecompassword

# 4.- Actualizar el archivo index.php para usar la base de datos local:

[$link = mysqli_connect('localhost', 'ecomuser', 'ecompassword', 'ecomdb');]

# 5.- Construir la imagen del contenedor:

docker build -t lamp-app .

# 6.- iniciar los contenedores:

docker-compose up -d

# 7.- Para detener los contenedores:

docker-compose down












