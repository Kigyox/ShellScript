#!/bin/bash

echo "Quin és el nom de l'usuari que vols afegir: "
read usuari

echo "Nom complet de l'usuari: "
read nom

echo "A quin grup vols afegir aquest usuari: "
read grup

if grep -q "$grup" /etc/group; then
    echo "El grup ja existeix, creant l'usuari en aquest grup"
    useradd -m -c "$nom" -g "$grup" "$usuari"
else
    echo "El grup no existeix, creant el grup..."
    groupadd "$grup"
    echo "Afegint l'usuari al grup..."
    useradd -m -c "$nom" -g "$grup" "$usuari"
fi