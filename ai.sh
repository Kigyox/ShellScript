#!/bin/bash
echo "Nom de l'script: $0"
echo "Has passat un total de $# paràmetres."

#$EUID: Variable de entorno que contiene el UID efectivo del proceso actual si no es igual a 0 que es el root dara error
if [ "$EUID" -ne 0 ]; then
    echo "Executa l'script com a root"
    exit 1
fi
#Verifiquem que la maquina tingui sortida a internet
if ! ping -c 1 8.8.8.8 &>/dev/null; then
    echo "Sense conexio a internet"
    exit 1
fi

echo "Actualitzant el sistema..."
#Actualitzem el sistema amb un control de errors si no funciona surt error i surt del script
if ! { apt update && apt upgrade -y; } ; then #2>/dev/null; then
    echo "error en la actualitzacio"
    exit 1
fi
echo "Instal·lant $1 y $2..."
#Instalem els dos parametres que doni el usuari
if ! { apt install -y $1 $2; } ; then
    echo "Error en la instalacion"
    exit 1
fi

