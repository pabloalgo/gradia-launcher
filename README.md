# Gradia Launcher - GNOME Shell Extension

## 📸 Descripción

Extensión de GNOME Shell para GNOME 50 que añade un lanzador de Gradia con menú de opciones de screenshot en el panel.

## ✨ Características

- Icono de cámara en el panel de GNOME
- Menú click izquierdo con 4 opciones:
  - 📸 **Capturar Área** - Screenshot interactivo con selección de área
  - 🖥️ **Pantalla Completa** - Captura todo el escritorio
  - 🪟 **Ventana** - Captura la ventana activa
  - 📝 **Abrir Gradia** - Abre Gradia sin screenshot

## 🚀 Instalación

### Manual

```bash
# Copiar extensión
cp -r gradia-launcher@pablo.dev ~/.local/share/gnome-shell/extensions/

# Activar vía dbus (opcional)
dbus-send --session --dest=org.gnome.Shell --type=method_call \
  /org/gnome/Shell \
  org.gnome.Shell.Extensions.EnableExtension \
  string:"gradia-launcher@pablo.dev"
```

Luego:
1. Cierra sesión y vuelve a entrar
2. Ve a **Aplicaciones → Extensiones**
3. Activa **"Gradia Launcher"**

### Desde el repo

```bash
# Clonar e instalar
git clone <repo-url>
cd screenshot-cut-app
cp -r gradia-launcher@pablo.dev ~/.local/share/gnome-shell/extensions/
```

## 📦 Dependencias

- **Gradia** (Flatpak): `flatpak install flathub be.alexandervanhee.gradia`
- **GNOME Shell 50+**
- **Flatpak runtime**

## 🛠️ Desarrollo

### Estructura

```
gradia-launcher@pablo.dev/
├── extension.js                          # Código principal
├── metadata.json                        # Metadatos de extensión
└── schemas/
    └── org.gnome.shell.extensions.gradia-launcher.gschema.xml
```

### Modificar

Edita `gradia-launcher@pablo.dev/extension.js` y recarga GNOME Shell.

### Debug

```bash
# Ver logs
journalctl --user -u gnome-shell -f | grep -i "gradia"
```

## 📄 Licencia

GPL-2.0-or-later — ver [LICENSE](LICENSE)

## 👤 Autor

Pablo Ibáñez ([@pabloalgo](https://github.com/pabloalgo))
