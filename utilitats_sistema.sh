#!/bin/bash
benvinguda() {
    local nom="$1"
    echo "Hola $nom, anem a comprovar el sistema"
}
comprova_usuari() {
    local usuari="$1"

    if grep -q "^${usuari}:" /etc/passwd; then
        echo "L'usuari '$usuari' SÍ existeix al sistema."
    else
        echo "L'usuari '$usuari' NO existeix al sistema."
    fi
}
calculadora_espai() {
    local particio="/"
    echo ""
    echo "=== Espai disponible a la partició principal==="
    df -h "$particio"
    echo "============================================================"
}

read nom_alumne
benvinguda "$nom_alumne"

echo ""


echo -n "Introdueix el nom d'usuari a comprovar: "
read nom_usuari
comprova_usuari "$nom_usuari"

calculadora_espai