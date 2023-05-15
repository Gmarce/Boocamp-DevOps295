# 1.- Crea los Dockerfiles:

*** Para el backend archivo dockerfile en el directorio 'backend-pokemon-app':

FROM python:3.8

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

*** Para el frontend archivo dockerfile en el directorio 'frontend-pokemon-app':

FROM node:14

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

CMD ["npm", "start"]


# 2.- Construir y ejecutar el contenedor del backend: (En la raíz del directorio backend-pokemon-app)

docker build -t backend_pokemon:1.0.0 .

# 3.- Verificar que la imagen se haya construido correctamente:

docker images

# 4.- Instanciar un contenedor basado en la nueva imagen:

docker run -d -p 8000:8000 backend_pokemon:1.0.0

# 5.- Acceder a la API del backend:

*** Abrir en el navegador web la siguiente URL: http://localhost:8000. Verificar si la API esta funcionando.

*** Para obtener la documentación de la API, ir a la siguiente URL: http://localhost:8000/docs.

# 6.- Construir y ejecutar el contenedor del frontend: (En la raíz del directorio frontend-pokemon-app)

docker build -t frontend_pokemon:1.0.0 .

# 7.- Verificar que la imagen se haya construido correctamente:

docker images 

# 8.- Instanciar un contenedor basado en la nueva imagen:

docker run -d -p 3000:3000 frontend_pokemon:1.0.0

# 9.- Acceder a la API del frontend:

*** Abrir en el navegador web la siguiente URL: http://localhost:3000. Verificar si la API esta funcionando.

# 7.- Subir las imágenes al Docker Hub:

*** Etiquetar las imágenes del backend y frontend

docker tag backend_pokemon:1.0.0 gmarce23/backend_pokemon:1.0.0
docker tag frontend_pokemon:1.0.0 gmarce23/frontend_pokemon:1.0.0

*** Subir las imágenes etiquetadas al Docker Hub:

docker push gmarce23/backend_pokemon:1.0.0
docker push gmarce23/frontend_pokemon:1.0.0

# 8.- Crear Docker-compose: docker-compose.yml

version: '3'
services:
  backend:
    image: gmarce23/backend_pokemon:1.0.0
    ports:
      - 8000:8000

  frontend:
    image: gmarce23/frontend_pokemon:1.0.0
    ports:
      - 3000:3000

# Ejecutarlo

docker-compose up

# Acceder a la API en http://localhost:8000 y al sitio web frontend en http://localhost:3000







