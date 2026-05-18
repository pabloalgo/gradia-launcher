#!/bin/bash
# Instalador de Gradia Launcher GNOME Shell Extension

set -e

EXTENSION_DIR="gradia-launcher@pablo.dev"
TARGET_DIR="$HOME/.local/share/gnome-shell/extensions/$EXTENSION_DIR"

echo "🔧 Instalando Gradia Launcher..."

# Verificar Gradia instalado
if ! flatpak list | grep -q "be.alexandervanhee.gradia"; then
    echo "⚠️  Gradia no está instalado. Instalando..."
    flatpak install flathub be.alexandervanhee.gradia --noninteractive
fi

# Crear directorio destino
mkdir -p "$TARGET_DIR"

# Copiar archivos
echo "📁 Copiando archivos..."
cp -r "$EXTENSION_DIR"/* "$TARGET_DIR/"

# Activar extensión
echo "🔧 Activando extensión..."
dbus-send --session --dest=org.gnome.Shell --type=method_call \
  /org/gnome/Shell \
  org.gnome.Shell.Extensions.EnableExtension \
  string:"gradia-launcher@pablo.dev" 2>/dev/null || echo "⚠️  Error activando vía dbus, activa manualmente en Extensions"

echo ""
echo "✅ Instalación completada!"
echo ""
echo "📋 Próximos pasos:"
echo "1. Cierra sesión y vuelve a entrar"
echo "2. Ve a Aplicaciones → Extensiones"
echo "3. Activa 'Gradia Launcher'"
echo "4. Deberías ver el icono de cámara en el panel"
echo ""
echo "🎯 Opciones del menú:"
echo "   📸 Capturar Área"
echo "   🖥️  Pantalla Completa"
echo "   🪟 Ventana"
echo "   📝 Abrir Gradia"
