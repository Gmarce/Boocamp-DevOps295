### Parte 1:
1.- Iniciar el container de MongoDB:
- docker run -d -p 27017:27017 --name m1 mongo

2.- Instalar la librería de pymongo:
-pip install pymongo

3- Ejecutar los scripts de Python:
- python3 populate.py
- python3 find.py

4.- Detener y remover el contenedor de MongoDB:
- docker stop m1
- docker rm m1

