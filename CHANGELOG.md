# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Extensión base de GNOME Shell para GNOME 50
- Menú PopupMenuItem con 4 opciones de screenshot
- Integración con Gradia Flatpak
- Scripts `install.sh` y `uninstall.sh` para instalación/desinstalación
- Documentación: README, AGENTS, MANIFESTO, TEST-PLAN
- Monitor de logs `monitor.sh` para debugging
- Schema GSettings para configuración futura

### Changed
- N/A (versión inicial)

### Fixed
- N/A (versión inicial)

### Security
- Sin dependencias externas maliciosas
- Solo ejecuta Gradia Flatpak (aplicación de confianza)
- No hay vulnerabilidades conocidas

## [1.0.0] - 2026-05-18

### Added
- Release inicial
- Icono de cámara en panel GNOME
- 4 opciones de menú:
  - 📸 Capturar Área
  - 🖥️ Pantalla Completa
  - 🪟 Ventana
  - 📝 Abrir Gradia
- Implementación con ES6 modules, GLib.spawn_async, PopupMenuItem
- Compatibilidad GNOME 50 (shell-version: ["50"])
- Depende de Gradia Flatpak

### Known Issues
- Requiere cerrar sesión y volver a entrar para activar extensión
- No se han reportado bugs aún

### Tested On
- GNOME 50 Wayland (CachyOS)
- Gradia Flatpak 1.13.0
