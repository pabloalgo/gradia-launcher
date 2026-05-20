#!/bin/bash
cd /home/pablo/dev/projects/gnome/screenshot-cut-app

echo "🔍 Monitor de Logs - Gradia Launcher"
echo "================================"
echo ""
echo "📋 Monitoreando logs de GNOME Shell (Ctrl+C para salir)..."
echo "   Presiona el botón de la extensión para ver logs"
echo ""

journalctl --user -u gnome-shell -f --since "now" | grep -E --line-buffered \
  "gradia|Gradia|screenshort|Screenshot|extension.js|spawn_async"
