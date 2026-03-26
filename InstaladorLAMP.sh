#!/bin/bash
# Script para instalar LAMP (Linux, Apache, MySQL, PHP) en una distribución basada en Debian/Ubuntu
if [ "$EUID" -ne 0 ]; then
    echo "Ejecuta el script como root"
    exit 1
fi
if ! ping -c 1 8.8.8.8 &>/dev/null; then
    echo "Sin conexión a internet"
    exit 1
fi
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "Sistema: $NAME"
fi
echo "Actualizando sistema..."
apt update && apt upgrade -y
echo "Instalando Apache"
apt install apache2 -y
echo instalando MYSQL
apt install mysql -y
echo "Instalando PHP"
apt install php && apt install php-mysql && apt install libapache2-mod-php
echo "Arrancando los servicios necesarios"
systemctl start apache2
systemctl start mysql
systemctl enable apache2
systemctl enable mysql
echo "Mirando status del servicio"
systemctl status apache2
systemctl status mysql
echo "Creando el archivo para verificar que funcione todo correctamente"
echo "print 'hola mundo'" > /var/www/html/info.php
ip a