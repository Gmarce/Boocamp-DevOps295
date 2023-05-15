# desplegar PostgreSQL y PgAdmin utilizando Docker Compose:

# 1.- Crear docker-compose.yml para desplegar un contenedor de PostgreSQL y pgAdmin:

version: '3'

services:
  db:
    image: postgres
    restart: always
    environment:
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: secret123
      POSTGRES_DB: mydatabase

  pgadmin:
    image: dpage/pgadmin4
    restart: always
    ports:
      - 8080:80
    environment:
      PGADMIN_DEFAULT_EMAIL: admin@example.com
      PGADMIN_DEFAULT_PASSWORD: secret123

# 2.- Ejecutar el comando para levantar los contenedores:

docker-compose up -d --build

# 3.- Visitar pgAdmin en el navegador utilizando la URL:

 http://localhost:8080

# 4.- Iniciar sesión con las siguientes credenciales:

Correo electrónico (Email): admin@example.com
Contraseña (Password): secret123

# 5.- Crear un nuevo servidor en pgAdmin para el servicio de PostgreSQL:

1.- Add New Server
2.- En la pestaña "General" campo "Name" (ejercicio-10)
3.- En la pestaña "Connection" utiliza la siguiente configuración:
Host name/address (Nombre/Dirección del host): db
Port (Puerto): 5432
Maintenance database (Base de datos de mantenimiento): postgres
Username (Nombre de usuario): admin
Password (Contraseña): secret123
4.- Guardar la configuración y continuar.

# 6.- Esto eliminará los contenedores en ejecución, los volúmenes creados para cada servicio y las imágenes descargadas del registro de Docker:

docker-compose down -v --rmi all









