# Gradia Launcher — GNOME Shell Extension

Click the camera icon in the top bar to take an area screenshot with [Gradia](https://github.com/AlexxNB/Gradia).

## Install

Requires [Gradia Flatpak](https://flathub.org/apps/be.alexandervanhee.gradia):

```bash
flatpak install flathub be.alexandervanhee.gradia
```

Then:

```bash
git clone https://github.com/pabloalgo/gradia-launcher.git
cd gradia-launcher
./install.sh
```

Log out and back in, then enable **Gradia Launcher** in *Extensions*.

## Usage

Click the 📷 camera icon in the panel → Gradia opens in area-capture mode → select area → edit in Gradia.

## Uninstall

```bash
./uninstall.sh
```

## Development

```
gradia-launcher@pabloib.com/
├── extension.js
└── metadata.json
```

Edit, reinstall, and reload GNOME Shell.

Debug:

```bash
journalctl --user -u gnome-shell -f | grep -i gradia
```

## License

GPL-2.0-or-later

## Author

[@pabloalgo](https://github.com/pabloalgo) — [pabloib.com](https://pabloib.com)
