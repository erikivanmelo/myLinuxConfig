#!/bin/bash

# Ruta de la carpeta donde están los plugins
plugin_dir="$HOME/.vim/plugged"

# Recorre cada subdirectorio en la carpeta de plugins
for plugin in "$plugin_dir"/*; do
  if [ -d "$plugin/.git" ]; then
    echo "Reseteando $plugin..."
    git -C "$plugin" reset --hard
  else
    echo "$plugin no es un repositorio git, omitiendo."
  fi
done

echo "Reseteo completo para todos los plugins."
