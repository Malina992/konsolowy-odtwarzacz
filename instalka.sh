#!/bin/bash

# Sprawdzenie dystrybucji na podstawie /etc/os-release
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
else
    echo "Nie można ustalić dystrybucji."
    exit 1
fi

echo "Wykryto dystrybucję: $NAME ($DISTRO)"

# Instalacja pakietów w zależności od dystrybucji
case "$DISTRO" in
    fedora|rhel|centos)
        sudo dnf install -y yt-dlp ffmpeg python3-pip
        ;;
    ubuntu|debian|linuxmint|pop)
        sudo apt update && sudo apt install -y yt-dlp ffmpeg python3-pip
        ;;
    arch|manjaro)
        sudo pacman -Syu --noconfirm yt-dlp ffmpeg python-pip
        ;;
    *)
        echo "Nieobsługiwana dystrybucja automatycznie. Zainstaluj yt-dlp i ffmpeg ręcznie."
        exit 1
        ;;
esac

# Sprawdzenie wersji multimediów
ffmpeg -version
ffplay -version
ffprobe -version

# Aktualizacja pip i instalacja pakietu Pythona
python3 -m pip install --upgrade pip
python3 -m pip install terminal-ascii-art

# Testowanie działania ascii-art
ascii-art --version
ascii-art list
python3 -m terminal_ascii_art list
