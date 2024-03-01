#!/bin/bash

# Verificar si el usuario es root
if [ "$(id -u)" != "0" ]; then
    echo "Este script debe ejecutarse como root" 1>&2
    exit 1
fi


# Mensaje de bienvenida con enlace al repositorio de GitHub
echo "Soy slinkyz. Gracias por descargar mi herramienta"
echo "Espero te funcione y para fines practicos te sea de utilidad."
echo "Para más información y actualizaciones, visita nuestro repositorio en GitHub:"
echo "https://github.com/slinkyz/WAMDT"
echo "No me hago responsable de malos usos de la herramienta"
sleep 5
clear
echo "Iniciando el programa..."

# Actualizar el índice de paquetes
apt-get update

# Lista de paquetes a verificar e instalar si es necesario
packages=("aircrack-ng" "pixiewps" "iw" "procps" "iproute2" "curl" "php" "php-cli" "bully" "node.js" "reaver" "mdk4" "mdk3")
missing_packages=()

# Verificar si los paquetes están instalados
for package in "${packages[@]}"; do
    if ! dpkg -s "$package" >/dev/null 2>&1; then
        missing_packages+=("$package")
    fi
done

# Instalar paquetes faltantes
if [ ${#missing_packages[@]} -eq 0 ]; then
    echo "Todos los paquetes están instalados."
else
    echo "Faltan los siguientes paquetes:"
    for missing_package in "${missing_packages[@]}"; do
        echo " - $missing_package"
        apt-get install -y "$missing_package"
    done
fi

