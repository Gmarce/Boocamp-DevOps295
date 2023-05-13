# 1.- Crear la estructura de archivos del proyecto con la siguiente jerarquía:

src
├── app
│   ├── app.py
│   └── templates
│       └── index.html
└── consumer
    └── consumer.py

# 2.- Crear un archivo Dockerfile para la API Flask:

FROM python:3.8

*** Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

*** Copia el archivo requirements.txt al directorio de trabajo
COPY requirements.txt .

*** Instala las dependencias del proyecto
RUN pip install --no-cache-dir -r requirements.txt

*** Copia el contenido de la carpeta "app" al directorio de trabajo en el contenedor
COPY app.py /app/
COPY templates/ /app/templates/
COPY requirements.txt /app/

*** Expone el puerto en el que se ejecutará la aplicación Flask
EXPOSE 8000

*** Comando para iniciar la aplicación Flask
CMD ["python", "app.py"]

# 3.- Crear un archivo Dockerfile para el consumidor:

*** Utiliza la imagen base de Python
FROM python:3.8

*** Establece el directorio de trabajo
WORKDIR /app

*** Copia los archivos del consumidor
COPY consumer.py /app/
COPY consumer.sh /app/

*** Establece los permisos de ejecución para el script del consumidor
RUN chmod +x consumer.sh

*** Comando para ejecutar el script del consumidor
CMD ["./consumer.sh"]

# 4.- Crear un archivo docker-compose.yml en la raíz del proyecto:

*** Define dos servicios: service-flask-app y service-consumer
version: '3'
services:
  service-flask-app:
    build:
      context: ./app
      dockerfile: dockerfile
    ports:
      - 8000:8000
    depends_on:
      - service-consumer

  service-consumer:
    build:
      context: ./consumer
      dockerfile: dockerfile
*** define las variables de entorno       
    environment:
      - LOCAL=true
      - PYTHONUNBUFFERED=1

# 5.- Ejecutar el comando docker-compose up en la terminal para construir y ejecutar los servicios definidos en el archivo docker-compose.yml.

# 6.- Verificar que la API Flask esté funcionando correctamente accediendo a http://localhost:8000 en un navegador web.

# 7.- Resultados de los logs del consumidor service-consumer:

*** Ejecuta el siguiente comando para iniciar los servicios:
docker-compose up

*** En otra terminal, ejecuta el siguiente comando para verificar los registros del servicio service-consumer:
docker-compose logs service-consumer
*** Ver los registros en tiempo real
docker-compose logs -f service-consumer 

# 8.- Subir las imágenes a Docker Hub:
*** Iniciar sesión en Docker Hub desde la línea de comandos usando el siguiente comando:
 docker login
  
 (pedirá ingresar credenciales de Docker Hub (nombre de usuario y contraseña)).
  
*** Buscar las imágenes construidas localmente:   
docker images

*** Etiquetar las imágenes con el nombre de usuario en Docker Hub y la versión:
docker tag flask-app gmarce23/flask-app:v1.0.0
docker tag consumer gmarce23/consumer-app:v1.0.0

*** Subir las imágenes etiquetadas a Docker Hub:
docker push gmarce23/flask-app:v1.0.0
docker push gmarce23/service-consumer-app:v1.0.0








