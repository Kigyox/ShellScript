#!/bin/bash

#Preguntar a l'usuari el nom del usuari que vol afegir
echo "Quin és el nom de l'usuari que vols afegir: "
read usuari

#Preguntem el nom complet
echo "Nom complet de l'usuari: "
read nom

#Despres el grup
echo "A quin grup vols afegir aquest usuari: "
read grup

#Fem un grep al arxiu /etc/group per comprovar si el grup existeix si es aixi es crear normal el usuari
if grep -q "$grup" /etc/group; then
    echo "El grup ja existeix, creant l'usuari en aquest grup"
    useradd -m -c "$nom" -g "$grup" "$usuari"
else
#No existeix es creara el grup i despres s'afegira el suuari
    echo "El grup no existeix, creant el grup..."
    groupadd "$grup"
    echo "Afegint l'usuari al grup..."
    useradd -m -c "$nom" -g "$grup" "$usuari"
fi