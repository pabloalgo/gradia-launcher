#!/bin/bash
set -e

UUID="gradia-launcher@pabloib.com"
DST="$HOME/.local/share/gnome-shell/extensions/$UUID"

echo "🗑️  Desinstalando Gradia Launcher..."

if [ -d "$DST" ]; then
    rm -rf "$DST"
    echo "✅ Eliminado $DST"
else
    echo "⚠️  No encontrado"
fi

echo "Cierra sesión y vuelve a entrar para aplicar."
