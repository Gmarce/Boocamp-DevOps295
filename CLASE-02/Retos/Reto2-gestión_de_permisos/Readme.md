Solución al Problema propuesto en el Ejercicio 4:

El problema que se presenta es la necesidad de Roxs de proteger un archivo confidencial llamado "Lista_Precios" en su directorio /home, ya que existe un alto riesgo de que su archivo sea vulnerado debido a que otros empleados utilizan su equipo al finalizar su turno. Roxs posee una contraseña segura, pero necesita resguardar los datos de ese archivo y no desea que nadie más que solamente él tenga acceso al mismo.

Para proveer una solución apropiada y restringir accesos no autorizados al archivo, se pueden implementar las siguientes medidas de seguridad:

1.- Cambiar los permisos del archivo: Para restringir el acceso a este archivo a todos los demás usuarios del sistema, se pueden cambiar los permisos del archivo y permitir que solo el propietario tenga acceso de lectura, escritura y ejecución. Para hacer esto, podemos utilizar el comando chmod de la siguiente manera:
$ chmod 700 Lista_Precios
Nota: Esto establecerá los permisos del archivo "Lista_Precios" para que solo el propietario tenga acceso de lectura, escritura y ejecución.

2.- Cambiar el propietario del archivo: Para garantizar que solo Roxs tenga acceso a este archivo, podemos cambiar el propietario del archivo a Roxs. Para hacer esto, podemos utilizar el comando chown de la siguiente manera:
$ chown roxs Lista_Precios
Nota: Esto cambiará el propietario del archivo "Lista_Precios" a Roxs.

3.- Encriptar el archivo: Otra medida de seguridad que se puede implementar es encriptar el archivo utilizando herramientas de cifrado. 

4.- Establecer un sistema de autenticación: También se puede establecer un sistema de autenticación para acceder al archivo.


