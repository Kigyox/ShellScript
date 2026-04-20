#!/bin/bash
echo "Di la ruta a la cual quieres acceder: "
read ruta
# Comprovem si la variable es buida
if [ -z "$ruta" ]; then
    echo "Error: No has introduït cap ruta"
    exit 1
fi  # <- fi que faltava

# Comprovem si es fitxer
if [ -f "$ruta" ]; then
    echo "L'element $ruta existeix i és un fitxer"
    if [ -r "$ruta" ]; then
        echo "Tens permisos per llegir aquest element"
    else
        echo "No tens permís de lectura"
    fi  # <- fi del if -r

# Comprovem si es directori
elif [ -d "$ruta" ]; then
    echo "L'element $ruta existeix i és un directori"
    if [ -r "$ruta" ]; then
        echo "Tens permisos per llegir aquest element"
    else
        echo "No tens permís de lectura"
    fi  # <- fi del if -r

# Si no existeix
else
    echo "Error: La ruta $ruta no es troba en el sistema"
fi  # <- fi del if principal