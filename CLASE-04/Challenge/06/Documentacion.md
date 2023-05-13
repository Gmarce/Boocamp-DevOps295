# 1.- Crea un archivo llamado "Dockerfile" en el directorio:

FROM python:3.9
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD [ "python", "app.py" ]

# 2.- Construir la nueva imagen de Docker basada en el Dockerfile:

docker build -t gmarce23/coinpy:1.0 .

# 3.- Verificar que la imagen se haya construido correctamente:

docker images

# 4.- Instanciar un contenedor basado en la nueva imagen:

docker run -d -p 5000:5000 gmarce23/coinpy:1.0

# 5.- Verificar que el contenedor esté corriendo correctamente accediendo a http://localhost:5000/ en el navegador.

# 6.- Subir la imagen a la cuenta de DockerHub:

docker push gmarce23/coinpy:1.0

# 7.- Eliminar la imagen en la máquina local:

docker rmi gmarce23/coinpy:1.0








