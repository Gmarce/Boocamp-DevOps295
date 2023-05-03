#!/bin/bash

# Establecer el valor por defecto del texto de file1.txt
TEXT=${1:-"Que me gusta bash!!!!"}

# Crear la jerarquia de ficheros y directorios
mkdir foo
mkdir foo/dummy
echo $TEXT > foo/dummy/file1.txt
touch foo/dummy/file2.txt
mkdir foo/empty

# Volcar el contenido del "file1.txt" a "file2.txt"
cat foo/dummy/file1.txt > foo/dummy/file2.txt

# Mover "file2.txt" a la carpeta "empty"
mv foo/dummy/file2.txt foo/empty/
