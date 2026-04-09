#!/bin/bash

#Script per a descarregar diverses eines per a ciberseguretat

#Declarem la variable amb diverses eines utils per a ciberseguretat
PAQUETS="nmap wfuzz john steghide sqlmap"

echo "Començant actualitzacio del sistema..."
#Aqui fem el update i upgrade si dona algun error surtira
if ! { apt update && apt upgrade -y; } ; then
    echo "error en la actualitzacio"
    exit 1
fi

echo "Instal·lant paquets de ciberseguretat"
echo "[nmap, wfuzz, john, steghide, sqlmap]"
#Aquí fem la instal·lacio de tots els paquets que hem declarat a la variable
if ! { apt install -y $PAQUETS; }; then
    echo "error al instalar"
    exit 1
fi