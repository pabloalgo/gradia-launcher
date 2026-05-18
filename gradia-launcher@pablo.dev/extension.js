import St from 'gi://St';
import GLib from 'gi://GLib';

import { Extension } from 'resource:///org/gnome/shell/extensions/extension.js';
import * as Main from 'resource:///org/gnome/shell/ui/main.js';
import * as PanelMenu from 'resource:///org/gnome/shell/ui/panelMenu.js';
import { PopupMenuItem, PopupSeparatorMenuItem } from 'resource:///org/gnome/shell/ui/popupMenu.js';

export default class extends Extension {
  enable() {
    this._panelMenuButton = new PanelMenu.Button(0.5, 'Gradia', false);

    const icon = new St.Icon({
      icon_name: 'camera-photo-symbolic',
      style_class: 'system-status-icon',
    });

    this._panelMenuButton.add_child(icon);
    Main.panel.addToStatusArea(this.uuid, this._panelMenuButton);

    this._buildMenu();
  }

  _buildMenu() {
    const menu = this._panelMenuButton.menu;

    // Título
    const titleItem = new PopupMenuItem('Gradia Screenshot');
    titleItem.setSensitive(false);
    menu.addMenuItem(titleItem);

    menu.addMenuItem(new PopupSeparatorMenuItem());

    // Screenshot interactivo (área)
    const areaItem = new PopupMenuItem('📸 Capturar Área');
    areaItem.connect('activate', () => this._launchGradia('--screenshot'));
    menu.addMenuItem(areaItem);

    // Capturar pantalla completa
    const fullItem = new PopupMenuItem('🖥️  Pantalla Completa');
    fullItem.connect('activate', () => this._launchGradia('--screenshot=full'));
    menu.addMenuItem(fullItem);

    // Capturar ventana
    const windowItem = new PopupMenuItem('🪟 Ventana');
    windowItem.connect('activate', () => this._launchGradia('--screenshot=window'));
    menu.addMenuItem(windowItem);

    menu.addMenuItem(new PopupSeparatorMenuItem());

    // Abrir Gradia sin screenshot
    const openItem = new PopupMenuItem('📝 Abrir Gradia');
    openItem.connect('activate', () => this._launchGradia('--new-window'));
    menu.addMenuItem(openItem);
  }

  _launchGradia(args) {
    log(`Gradia Launcher: launching with args: ${args}`);
    
    try {
      const argv = ['flatpak', 'run', 'be.alexandervanhee.gradia', ...args.split(' ').filter(a => a)];
      
      const [success, pid] = GLib.spawn_async(
        null,
        argv,
        null,
        GLib.SpawnFlags.SEARCH_PATH,
        null
      );
      
      if (success) {
        log(`Gradia Launcher: launched with PID ${pid}`);
      } else {
        log('Gradia Launcher: failed to launch');
      }
    } catch (e) {
      logError(e, 'Gradia Launcher error');
    }
  }

  disable() {
    if (this._panelMenuButton) {
      this._panelMenuButton.destroy();
      this._panelMenuButton = null;
    }
  }
}
