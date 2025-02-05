#!/bin/bash

# Verifica que se hayan pasado los argumentos correctos
if [ "$#" -lt 3 ]; then
    echo "Uso: $0 'texto_a_reemplazar' 'nuevo_texto' archivo1 [archivo2 ...]"
    exit 1
fi

# Toma los argumentos
OLD_TEXT="$1"
NEW_TEXT="$2"
shift 2 # Desplaza los dos primeros argumentos
FILES="$@"

# Itera sobre los archivos y aplica sed
for FILE in $FILES; do
    if [ -f "$FILE" ]; then
        echo "Reemplazando en: $FILE"
        sed -i "s/${OLD_TEXT}/${NEW_TEXT}/g" "$FILE"
    else
        echo "Archivo no encontrado: $FILE"
    fi
done

echo "Reemplazo completado."

