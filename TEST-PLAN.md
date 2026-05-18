# Plan de Pruebas - Gradia Launcher Extension

## 🎯 Objetivo

Verificar que la extensión Gradia Launcher funciona correctamente en GNOME 50 Wayland.

## 📋 Checklist de Instalación

- [ ] 1. Extensión copiada en `~/.local/.../extensions/`
- [ ] 2. Gradia Flatpak instalado
- [ ] 3. Repo intacto en `/home/pablo/dev/projects/...`
- [ ] 4. Cerrar sesión y volver a entrar
- [ ] 5. Extensión visible en "Aplicaciones → Extensiones"
- [ ] 6. Extensión habilitada
- [ ] 7. Icono de cámara visible en panel

## 🖱️ Pruebas Funcionales

### Test 1: Click izquierdo - Menú aparece
- [ ] Click izquierdo en icono cámara
- [ ] Menú se abre con 4 opciones
- [ ] Opciones visibles:
  - [ ] 📸 Capturar Área
  - [ ] 🖥️ Pantalla Completa
  - [ ] 🪟 Ventana
  - [ ] 📝 Abrir Gradia

### Test 2: Opción "Capturar Área"
- [ ] Click en "📸 Capturar Área"
- [ ] Gradia se abre
- [ ] Gradia muestra UI de selección
- [ ] Usuario puede seleccionar área
- [ ] Editor se abre después de selección

### Test 3: Opción "Pantalla Completa"
- [ ] Click en "🖥️ Pantalla Completa"
- [ ] Gradia se abre
- [ ] Captura pantalla completa automáticamente
- [ ] Editor se abre con screenshot

### Test 4: Opción "Ventana"
- [ ] Click en "🪟 Ventana"
- [ ] Gradia se abre
- [ ] Captura ventana activa
- [ ] Editor se abre con screenshot

### Test 5: Opción "Abrir Gradia"
- [ ] Click en "📝 Abrir Gradia"
- [ ] Gradia se abre sin screenshot
- [ ] Modo edición de imagen

## 🔍 Pruebas de Debug

### Test 6: Logs de GNOME Shell
- [ ] Abrir terminal
- [ ] Ejecutar: `journalctl --user -u gnome-shell -f`
- [ ] Click en extensión
- [ ] Ver logs con "Gradia Launcher"
- [ ] Ver logs con "launched with PID"
- [ ] Ver logs de errores (si hay)

### Test 7: Logs de Gradia
- [ ] Ejecutar: `flatpak run --command=gradia be.alexandervanhee.gradia --new-window`
- [ ] Ver logs en terminal

## 🚨 Pruebas de Error Handling

### Test 8: Gradia no instalado
- [ ] Desinstalar Gradia: `flatpak remove be.alexandervanhee.gradia`
- [ ] Click en extensión
- [ ] Verificar comportamiento esperado (error o silencioso)
- [ ] Reinstalar Gradia: `flatpak install flathub be.alexandervanhee.gradia`

## 🔄 Pruebas de Desinstalación

### Test 9: Desinstalación limpia
- [ ] Ejecutar `./uninstall.sh`
- [ ] Verificar que `~/.local/.../extensions/gradia-launcher@pablo.dev` se borró
- [ ] Verificar que repo `/home/pablo/dev/projects/...` SE MANTIENE
- [ ] Verificar que icono desapareció del panel
- [ ] Cerrar sesión y volver a entrar
- [ ] Extensión ya no visible en "Aplicaciones → Extensiones"

## 📊 Resultados Esperados

- ✅ Menú funciona con 4 opciones
- ✅ Gradia se lanza correctamente
- ✅ Logs confirman ejecución
- ✅ Desinstalación es limpia y no afecta repo
- ❌ Esperado: Falla si Gradia no instalado

## 📝 Notas

- GNOME 50 puede requerir recargar la shell después de instalar
- Extensión usa `GLib.spawn_async` con `SEARCH_PATH`
- Logs en `journalctl --user -u gnome-shell`
