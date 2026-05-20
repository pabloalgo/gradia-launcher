#!/bin/bash
set -e

UUID="gradia-launcher@pabloib.com"
SRC="gradia-launcher@pabloib.com"
DST="$HOME/.local/share/gnome-shell/extensions/$UUID"

echo "🔧 Instalando Gradia Launcher..."

if ! flatpak list | grep -q "be.alexandervanhee.gradia"; then
    echo "⚠️  Gradia no está instalado. Instalando..."
    flatpak install flathub be.alexandervanhee.gradia --noninteractive
fi

mkdir -p "$DST"
cp -r "$SRC"/* "$DST/"

echo "✅ Instalado en $DST"
echo "Cierra sesión y vuelve a entrar, luego activa en Extensiones."
