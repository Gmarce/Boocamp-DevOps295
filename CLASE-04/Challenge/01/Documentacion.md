### Parte 1:
1.- Descarga la imagen:
docker pull nginx:1.22.1

2.- Crea un script con el nombre: 1-nginx.sh
- código del script:
#!/bin/bash
docker pull nginx:1.22.1

3.- Darle permisos de ejecución:
- chmod +x 1-nginx.sh

### Parte 2:
Inicializar MYSQL
- Verificar el servicio MYSQL:
sudo service mysql status
- Iniciar servicio de MYSQL: 
sudo service mysql start

1.- Inicializar el contenedor de MySQL:
docker run --name=db -p 3306:3306 -e MYSQL_ROOT_PASSWORD=secret-pw -d mysql:8
- Se inicializa el contenedor MYSQL con el nombre: db
- Expone el puerto: 3306 del cotenedor al puerto 3306
- Establecer una contraseña de root : secret-pw
- Imagen MYSQL version 8.

2.- Revision de los logs del contenedor de MySQL:
docker logs db

3.- Conéctarse al contenedor de MySQL:
docker exec -it db bash

4.- Dentro del contenedor de MySQL conectarse e iniciar sesión como usuario root:
mysql -u root -p

5.- Iniciar el contenedor de PHPMyAdmin:
docker run --name=my-admin -p 82:80 --link db:db -d phpmyadmin
- Nombre: my-admin
- Expone en el puerto 80 del contenedor al puerto 82
- Establece el enlace: --link db:db
- Imagen PHPMyAdmin.

6.- Abrir en el navegador http://localhost:82/

7.- Introducir las credenciales para acceder a PHPMyAdmin y comenzar a trabajar con tus contenedores:
- Usuario: root
- Clave: secret-pw

8. Al terminar con los contenedores, detenerlos y eliminarlos:
- docker stop db my-admin
- docker rm db my-admin