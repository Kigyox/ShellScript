#!/bin/bash
#inicialitzem la variable ruta
ruta=""
#Fem el bucle si la ruta es valida o possa sortir el bucle acabara
until [ -e "$ruta" ] || [ "$ruta" == "sortir" ]; do
#pregunta la ruta
    echo "Digues una ruta que estigui al sistema (possa sortir si vols tancar l'script): "
    read ruta
#si possa sortir acabara l'script amb un exit 0
    if [ "$ruta" == "sortir" ]; then
        echo "Sortint del script"
        exit 0
#si la ruta existeix fara un break i passara al while
    elif [ -e "$ruta" ]; then
        echo "La ruta $ruta existeix, sortint del bucle"
        break
#si no la troba tornara a preguntar
    else
        echo "La ruta no s'ha trobat, torna a provar"
    fi
done
echo "Digues un numero del 1 al 10: "
read numero
# Validació numèrica
if ! [[ "$numero" =~ ^[0-9]+$ ]]; then
    echo "Error: '$numero' no és un número vàlid"
    exit 1
fi
# Validació de rang (1-10)
if [ "$numero" -lt 1 ] || [ "$numero" -gt 10 ]; then
    echo "Error: el número ha d'estar entre 1 i 10"
    exit 1
fi
#bucle while
while [ "$numero" -le 10 ]; do
    echo "Processant l'element en $numero segons..."
    ((numero++))
done