# 1.- Crear un archivo docker-compose.yml:

version: '3'
services:
  web:
    build: .
    ports:
      - 5000:5000
    depends_on:
      - redis
  redis:
    image: redis

# 2.- Construir la imagen de Docker:

docker build -t ejercicio-8:1.0.0 .

# 3.- Ejecutar docker-compose.yml: Esto iniciará la construcción de los contenedores y los ejecutará.

docker-compose up

# 4.- Verificar que la aplicacion este corriendo en el navegador:

Running on http://172.20.0.3:80








