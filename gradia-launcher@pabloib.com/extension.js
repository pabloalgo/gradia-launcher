import St from "gi://St";
import GLib from "gi://GLib";

import { Extension } from "resource:///org/gnome/shell/extensions/extension.js";
import * as Main from "resource:///org/gnome/shell/ui/main.js";
import * as PanelMenu from "resource:///org/gnome/shell/ui/panelMenu.js";
import { PopupMenuItem } from "resource:///org/gnome/shell/ui/popupMenu.js";

const GRADIA_FLATPAK = "be.alexandervanhee.gradia";

export default class GradiaLauncherExtension extends Extension {
	enable() {
		this._button = new PanelMenu.Button(0.5, "Gradia", false);

		this._button.add_child(
			new St.Icon({
				icon_name: "camera-photo-symbolic",
				style_class: "system-status-icon",
			}),
		);

		Main.panel.addToStatusArea(this.uuid, this._button);

		this._addMenuItem("📸 Capturar Área", "--screenshot");

		// Left-click shortcut: close menu immediately and capture
		this._menuOpenId = this._button.menu.connect(
			"open-state-changed",
			(menu, isOpen) => {
				if (isOpen) {
					menu.close();
					this._spawnGradia("--screenshot");
				}
			},
		);
	}

	_addMenuItem(label, arg) {
		const item = new PopupMenuItem(label);
		item.connect("activate", () => this._spawnGradia(arg));
		this._button.menu.addMenuItem(item);
	}

	_spawnGradia(arg) {
		try {
			const [ok] = GLib.spawn_async(
				null,
				["flatpak", "run", GRADIA_FLATPAK, arg],
				null,
				GLib.SpawnFlags.SEARCH_PATH,
				null,
			);
			if (!ok) log("Gradia Launcher: spawn failed");
		} catch (e) {
			logError(e, "Gradia Launcher");
		}
	}

	disable() {
		if (this._menuOpenId) {
			this._button.menu.disconnect(this._menuOpenId);
			this._menuOpenId = null;
		}
		this._button?.destroy();
		this._button = null;
	}
}
