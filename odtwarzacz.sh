#!/bin/bash

# Sprawdzenie czy przekazano jakikolwiek argument
if [ -z "$1" ]; then
    echo "Witaj w odtwarzaczu wideocon"
    echo "aby odtworzyć wideo użyj komendy"
    echo "odtwarzacz ' Link do wideo z youtube '"
    echo "aby wyjść użyj kombinacji klawiszy Ctrl+C"
    exit 1
fi

# Obsługa flagi --help
if [ "$1" = "--help" ]; then
   echo "Witaj w odtwarzaczu wideocon"
    echo "aby odtworzyć wideo użyj komendy"
    echo "odtwarzacz ' Link do wideo z youtube '"
    echo "aby wyjść użyj kombinacji klawiszy Ctrl+C"
    exit 0
fi

# Główna logika dla zwykłego tekstu
WIADOMOSC="$1"

    if [ -d "wideocon" ]; then
        cd ~/
        cd "wideocon"
    else
        cd ~/
        mkdir "wideocon" && cd "wideocon"
        echo "Utworzono foler na nagrania"
        echo "tutaj są przechowywane pliki po obejrzeniu wideo możesz je usunąć  " > info.txt
    fi
yt-dlp -S "ext:mp4:m4a" "$WIADOMOSC"
najnowszy=$(ls -t | head -n 1)
ascii-art video "$najnowszy" --color
cd ~/
rm -rf wideocon
