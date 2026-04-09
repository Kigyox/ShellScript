#!/bin/bash
# Script per  actualitzar la maquina
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
#Actualitzem la maquina 
echo "Actualitzant el sistema..."
if ! { apt update && apt upgrade -y; } ; then #2>/dev/null; then
    echo "error en la actualitzacio"
    exit 1
fi