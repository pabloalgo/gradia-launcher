#!/bin/bash
# Desinstalador de Gradia Launcher GNOME Shell Extension

set -e

EXTENSION_UUID="gradia-launcher@pablo.dev"
EXTENSION_DIR="$HOME/.local/share/gnome-shell/extensions/$EXTENSION_UUID"

echo "🗑️  Desinstalando Gradia Launcher..."

# Desactivar extensión si está activa
echo "🔧 Desactivando extensión..."
dbus-send --session --dest=org.gnome.Shell --type=method_call \
  /org/gnome/Shell \
  org.gnome.Shell.Extensions.DisableExtension \
  string:"$EXTENSION_UUID" 2>/dev/null || echo "⚠️  Error desactivando vía dbus"

# Eliminar archivos
if [ -d "$EXTENSION_DIR" ]; then
    echo "📁 Eliminando archivos..."
    rm -rf "$EXTENSION_DIR"
    echo "✅ Archivos eliminados"
else
    echo "⚠️  No encontrados archivos para eliminar"
fi

# Eliminar schema si existe
SCHEMA_DIR="$HOME/.local/share/glib-2.0/schemas/org.gnome.shell.extensions.gradia-launcher.gschema.xml"
if [ -f "$SCHEMA_DIR" ]; then
    echo "🗂️  Eliminando schema..."
    rm -f "$SCHEMA_DIR"
    glib-compile-schemas "$HOME/.local/share/glib-2.0/schemas/" 2>/dev/null || true
    echo "✅ Schema eliminado"
fi

echo ""
echo "✅ Desinstalación completada!"
echo ""
echo "📋 Notas:"
echo "• Los archivos del repo en /home/pablo/dev/projects/gnome/screenshot-cut-app se mantienen"
echo "• Solo se eliminaron los archivos de instalación en ~/.local/"
echo "• Cierra sesión y vuelve a entrar para aplicar cambios"
