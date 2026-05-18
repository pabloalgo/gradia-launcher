# MANIFESTO - Gradia Launcher

## 📂 Estructura del Proyecto

```
screenshot-cut-app/
├── README.md                          # Documentación usuario
├── AGENTS.md                           # Configuración agente
├── MANIFESTO.md                        # Este archivo
├── install.sh                          # Instalación local
├── uninstall.sh                        # Desinstalación local
├── .gitignore                          # Git ignore
└── gradia-launcher@pablo.dev/          # Código extensión
    ├── extension.js                   # Lógica principal
    ├── metadata.json                   # Metadatos GNOME Shell
    └── schemas/                        # Configuración
        └── org.gnome.shell.extensions.gradia-launcher.gschema.xml
```

## 🔄 Flujo de Trabajo

### Desarrollo

```bash
cd /home/pablo/dev/projects/gnome/screenshot-cut-app

# Editar extensión
vim gradia-launcher@pablo.dev/extension.js

# Probar cambios
./install.sh
# Cerrar sesión y volver a entrar
```

### Instalación

```bash
# Local
./install.sh

# Manual
cp -r gradia-launcher@pablo.dev ~/.local/share/gnome-shell/extensions/
```

### Desinstalación

```bash
# Script
./uninstall.sh

# Manual
rm -rf ~/.local/share/gnome-shell/extensions/gradia-launcher@pablo.dev/
```

## 📦 Archivos vs Instalación

| Archivo en Repo | Ubicación Instalación | ¿Enlazado? | ¿Se elimina al desinstalar? |
|-----------------|----------------------|------------|----------------------------|
| `extension.js` | `~/.local/.../gradia-launcher@pablo.dev/extension.js` | ❌ COPIA | ✅ Sí |
| `metadata.json` | `~/.local/.../gradia-launcher@pablo.dev/metadata.json` | ❌ COPIA | ✅ Sí |
| `schemas/*` | `~/.local/.../gradia-launcher@pablo.dev/schemas/*` | ❌ COPIA | ✅ Sí |
| `install.sh` | Solo en repo | — | — |
| `README.md` | Solo en repo | — | — |

## ⚠️  Importante

- **Los archivos del repo NO se modifican al instalar/desinstalar**
- **Solo se modifican las COPIAS en `~/.local/`**
- **Puedes instalar múltiples veces sin afectar el repo**
- **Para actualizar: vuelve a ejecutar `./install.sh`**

## 🎯 Commit Convention

Usar [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` - nueva funcionalidad
- `fix:` - corrección de bugs
- `chore:` - mantenimiento, docs, scripts
- `docs:` - documentación
- `refactor:` - refactorización

## 📊 Estado del Proyecto

- ✅ Extensión base funcional
- ✅ Menú con 4 opciones
- ✅ Scripts install/uninstall
- ✅ Documentación completa
- ⏳ Testing en GNOME 50 real
- ⏳ Configuración de atajos opcionales
- ⏳ Crear repo remoto (GitHub/GitLab)
