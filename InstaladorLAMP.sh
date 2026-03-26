#!/bin/bash
# Script para instalar LAMP (Linux, Apache, MySQL, PHP) en una distribución basada en Debian/Ubuntu
if [ "$EUID" -ne 0 ]; then
    echo "Ejecuta el script como root"
    exit 1
fi
#Verificamos que la maquina tenga salida a internet
if ! ping -c 1 8.8.8.8 &>/dev/null; then
    echo "Sin conexión a internet"
    exit 1
fi
#revisamos el sistema
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "Sistema: $NAME"
    if [ "$ID" != "ubuntu" ] && [ "$ID" != "debian" ]; then
        echo "Este script solo funciona en Ubuntu o Debian"
        exit 1
    fi
fi

#Actualizamos la maquina 
echo "Actualizando sistema..."
if ! { apt update && apt upgrade -y; } ; then #2>/dev/null; then
    echo "error en la actualizacion"
    exit 1
fi
#instalamos las dependencias necesarias
echo "Instalando Apache"
if ! { apt install apache2 -y; } ; then #2>/dev/null; then
    echo "error en la instalacion de apache"
    exit 1
fi
echo "instalando MYSQL"
if ! { apt install mysql-server -y; } ; then #2>/dev/null; then
    echo "error en la instalacion de mysql"
    exit 1
fi
echo "Instalando PHP"
if ! { apt install php php-mysql libapache2-mod-php -y; } ; then #2>/dev/null; then
    echo "error en la instalacion de php"
    exit 1
fi
#arrancamos los servicios y verificamos que esten en marcha
echo "Arrancando los servicios necesarios"
systemctl enable --now apache2
systemctl enable --now mysql
echo "Mirando status del servicio"
systemctl status apache2
systemctl status mysql
#Probamos que todo funcione correctamente
echo "Creando el archivo para verificar que funcione todo correctamente"
echo "<?php

phpinfo( );

?>" > /var/www/html/info.php