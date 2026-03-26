#mueve automáticamente los archivos de ~/Descargas a carpetas según su extensión (.pdf → Documentos, .jpg → Imágenes, .zip → Comprimidos...)
#!/bin/bash
# Define las rutas de las carpetas
DESCARGAS="$HOME/Descargas"
DOCUMENTOS="$HOME/Documentos"
IMAGENES="$HOME/Imágenes"
mkdir "$HOME/Comprimidos"
COMPRIMIDOS="$HOME/Comprimidos"
# Mueve los archivos según su extensión
for archivo in "$DESCARGAS"/*; do
    if [[ -f "$archivo" ]]; then
        case "${archivo##*.}" in
            pdf)
                mv "$archivo" "$DOCUMENTOS/"
                ;;
            jpg|jpeg|png|gif)
                mv "$archivo" "$IMAGENES/"
                ;;
            zip|tar|gz|rar)
                mv "$archivo" "$COMPRIMIDOS/"
                ;;
            *)
                echo "Archivo no reconocido: $archivo"
                ;;
        esac
    fi
done
echo "Organización de descargas completada."

