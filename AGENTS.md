# Gradia Launcher - Agent Configuration

## Identity

- **Agent id:** `gradia-launcher-lead`
- **Display name:** Gradia Launcher Lead
- **Role:** project-lead
- **Scope:** project
- **Managed by:** `creator`

## Purpose

Desarrollar y mantener la extensión de GNOME Shell "Gradia Launcher" para GNOME 50, que proporciona un lanzador de Gradia con menú de opciones de screenshot en el panel.

## Stack

- **GNOME Shell Extensions** (JavaScript/ES6)
- **GJS** (GNOME JavaScript runtime)
- **GLib** (funciones de sistema)
- **Flatpak** (para ejecutar Gradia)
- **Gradia** (screenshot editor)

## Commands

### Desarrollo

```bash
# Copiar cambios al sistema
cp -r gradia-launcher@pablo.dev ~/.local/share/gnome-shell/extensions/

# Recargar GNOME Shell (Ctrl+Alt+F2, r, Enter)

# Ver logs
journalctl --user -u gnome-shell -f | grep -i "gradia"
```

### Instalación

```bash
# Instalar Gradia
flatpak install flathub be.alexandervanhee.gradia

# Instalar extensión
cp -r gradia-launcher@pablo.dev ~/.local/share/gnome-shell/extensions/
```

## Code Style

- **ES6 modules**: `import`/`export default`
- **GNOME Shell conventions**: `this._panelMenuButton`, `this._buildMenu()`
- **Logging**: `log()`, `logError()` para debug
- **GLib.spawn_async**: Para ejecutar comandos externos
- **PopupMenuItem**: Para elementos de menú

## Conventions

- Usar emojis para identificar visualmente las acciones
- Nombres de métodos con `_` para privados: `_launchGradia()`, `_buildMenu()`
- Cleanup en `disable()`: destruir elementos UI

## Current Status

- ✅ Extensión base creada
- ✅ Menú con 4 opciones implementado
- ✅ Integración con Gradia Flatpak
- ⏳ Pendiente: testing en GNOME 50 real
- ⏳ Pendiente: configuración de atajos de teclado opcionales

## Files

- `gradia-launcher@pablo.dev/extension.js` - Código principal
- `gradia-launcher@pablo.dev/metadata.json` - Metadatos
- `gradia-launcher@pablo.dev/schemas/` - Configuración GSettings
