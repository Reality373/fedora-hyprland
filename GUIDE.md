# 📖 Fedora Hyprland: The Complete Guide

Welcome to the comprehensive guide for **Fedora Hyprland (Material 3 Edition)**. This document covers installation, keyboard-first navigation (tailored for **75% keyboards**), shell features, customization, troubleshooting, and dual-boot/session coexistence with GNOME.

---

## 📑 Table of Contents
1. [System Architecture & Philosophy](#1-system-architecture--philosophy)
2. [Installation Guide](#2-installation-guide)
   - [Prerequisites on Fedora](#prerequisites-on-fedora)
   - [Automated Installation](#automated-installation)
   - [Manual Installation Step-by-Step](#manual-installation-step-by-step)
   - [First Login](#first-login)
3. [75% Keyboard Navigation Reference](#3-75-keyboard-navigation-reference)
   - [Interactive Live Cheatsheet (`Super + /`)](#interactive-live-cheatsheet)
   - [Applications & Launchers](#applications--launchers)
   - [Material 3 Desktop Overlays (Quickshell)](#material-3-desktop-overlays-quickshell)
   - [Window Management & Vim Navigation](#window-management--vim-navigation)
   - [Modal Submaps (Resize & Move)](#modal-submaps-resize--move)
   - [Screenshots (No PrintScreen Key Required)](#screenshots-no-printscreen-key-required)
   - [Quick System Menus](#quick-system-menus)
   - [Audio & Brightness](#audio--brightness)
4. [Using & Customizing Your Desktop](#4-using--customizing-your-desktop)
   - [Dynamic Material 3 Theming](#dynamic-material-3-theming)
   - [Wallpapers & Matugen](#wallpapers--matugen)
   - [Configuring Monitors](#configuring-monitors)
   - [Tweaking Keybindings](#tweaking-keybindings)
5. [GNOME Coexistence & Safety](#5-gnome-coexistence--safety)
6. [Troubleshooting & FAQs](#6-troubleshooting--faqs)
7. [Credits & Upstream Attribution](#7-credits--upstream-attribution)

---

## 1. System Architecture & Philosophy

This environment is built upon three pillars:
- **Compositor:** [Hyprland](https://hyprland.org/) (Wayland dynamic tiling compositor).
- **Desktop Shell:** [Quickshell](https://git.outfoxxed.me/quickshell/quickshell) running the `end4-pC` Material 3 QML shell (top bar, dynamic island, notification center, visual overview, sidebar, and app launcher).
- **Dynamic Palette Engine:** [Matugen](https://github.com/InioX/matugen) extracting real-time Material You color schemes from your active wallpaper.

### Built for 75% Keyboards
Most tiling setups assume a full-sized keyboard with a numpad, dedicated `PrintScreen`, `Insert`, `ScrollLock`, or `Pause` keys. This configuration is optimized for **75% and compact layouts**:
- **Screenshots:** 100% contained within the <kbd>Super</kbd> + <kbd>S</kbd> cluster. Zero reliance on `PrintScreen`.
- **Navigation:** Full Vim-style <kbd>H</kbd>/<kbd>J</kbd>/<kbd>K</kbd>/<kbd>L</kbd> movement without needing to reach down to the arrow keys.
- **Scratchpad:** Instantly reachable on <kbd>Super</kbd> + <kbd>`</kbd> (Tilde / Grave key right below <kbd>Esc</kbd>).
- **Previous Workspace:** Placed on <kbd>Super</kbd> + <kbd>Backspace</kbd>.
- **Volume Fallback:** Direct volume adjustment via <kbd>Super</kbd> + <kbd>-</kbd> and <kbd>Super</kbd> + <kbd>=</kbd> in case hardware <kbd>Fn</kbd> keys are locked.

---

## 2. Installation Guide

### Prerequisites on Fedora
Compatible with **Fedora 42 and Fedora 43** (Workstation, Silverblue, or custom spins).

Ensure your package repositories are up to date:
```bash
sudo dnf update -y
```

### Automated Installation
The easiest way is using the idempotent `install.sh` script included in the repository:

```bash
# 1. Clone the repository
git clone https://github.com/Reality373/fedora-hyprland.git ~/fedora-hyprland
cd ~/fedora-hyprland

# 2. Make executable and run
chmod +x install.sh
./install.sh
```

What the installer does automatically:
1. Enables required Copr repositories (`solopasha/hyprland` for Quickshell and modern Wayland tooling).
2. Installs core compositor dependencies: `hyprland`, `hyprlock`, `hypridle`, `quickshell`, `kitty`, `ghostty`, `rofi-wayland`, `grim`, `slurp`, `swappy`, `wl-clipboard`, `cliphist`, `pamixer`, `brightnessctl`, `playerctl`.
3. Installs Qt6 and KDE Kirigami dependencies for the Quickshell Material 3 engine.
4. Installs Python Material You libraries (`materialyoucolor`, `Pillow`, `opencv-python`, `numpy`).
5. Fetches the latest `matugen` binary for color scheme generation.
6. Symlinks dotfiles into `~/.config/hypr`, `~/.config/quickshell/end4-pC`, `~/.config/rofi`, and helper scripts into `~/.local/bin`.

### Manual Installation Step-by-Step
If you prefer installing components manually:

```bash
# 1. Enable Copr repository for Quickshell
sudo dnf copr enable -y solopasha/hyprland

# 2. Install compositor & shell packages
sudo dnf install -y \
  hyprland hyprlock hypridle quickshell \
  qt6-qt5compat qt6-qtpositioning kf6-kirigami kf6-syntax-highlighting \
  ghostty rofi-wayland grim slurp swappy wl-clipboard cliphist \
  pamixer brightnessctl playerctl wdisplays pavucontrol hyprpicker \
  python3-pip python3-pillow python3-opencv python3-numpy

# 3. Install Python Material You generator
pip install --user materialyoucolor

# 4. Link configurations
mkdir -p ~/.config ~/.local/bin
ln -sfn ~/fedora-hyprland/config/hypr ~/.config/hypr
ln -sfn ~/fedora-hyprland/config/quickshell/end4-pC ~/.config/quickshell/end4-pC
ln -sfn ~/fedora-hyprland/config/quickshell/end4-pC ~/.config/quickshell/ii
ln -sfn ~/fedora-hyprland/config/rofi ~/.config/rofi
for script in ~/fedora-hyprland/scripts/*; do
  ln -sfn "$script" ~/.local/bin/$(basename "$script")
done
```

### First Login
1. Save your work and log out of GNOME or your current desktop session.
2. At the GDM (or SDDM) login screen, click your user account.
3. Click the **Gear icon ⚙️** at the bottom-right of the screen and select **Hyprland**.
4. Type your password and press <kbd>Enter</kbd>.

---

## 3. 75% Keyboard Navigation Reference

### Interactive Live Cheatsheet
Press **<kbd>Super</kbd> + <kbd>/</kbd>** at any time!
An interactive, searchable Rofi overlay will pop up displaying every registered keybinding directly parsed from your live configuration. Start typing to filter commands.

---

### Applications & Launchers
| Shortcut | Action | Description |
| :--- | :--- | :--- |
| <kbd>Super</kbd> + <kbd>Space</kbd> | **Quickshell Search** | Modern Material 3 app launcher, math evaluator, and command palette |
| <kbd>Super</kbd> *(tap)* | **Quickshell Search** | Quick tap of the Super key |
| <kbd>Super</kbd> + <kbd>D</kbd> | **Quickshell Search** | Classic tiling window manager launcher shortcut |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>D</kbd> | **Rofi Launcher** | Reliable lightweight fallback app drawer |
| <kbd>Super</kbd> + <kbd>Q</kbd> | **Terminal** | Launches `ghostty` (or your preferred terminal) |
| <kbd>Super</kbd> + <kbd>B</kbd> | **Web Browser** | Launches default browser (`firefox`) |
| <kbd>Super</kbd> + <kbd>E</kbd> | **File Manager** | Opens `nautilus` |
| <kbd>Super</kbd> + <kbd>O</kbd> | **Window Finder** | Interactive fuzzy-search to jump to any window by title |

---

### Material 3 Desktop Overlays (Quickshell)
| Shortcut | Overlay | Description |
| :--- | :--- | :--- |
| <kbd>Super</kbd> + <kbd>Tab</kbd> | **Visual Overview** | Mission-Control style graphical overview of all workspaces and open windows |
| <kbd>Super</kbd> + <kbd>N</kbd> | **Sidebar Right** | Notification center, calendar, media player, and quick toggles |
| <kbd>Super</kbd> + <kbd>A</kbd> | **Sidebar Left** | AI Assistant sidebar, sticky notes, and system utilities |
| <kbd>Super</kbd> + <kbd>Escape</kbd> *(or <kbd>Super</kbd> + <kbd>,</kbd>)* | **Settings Panel** | Full Material 3 configuration panel (theming, bar modules, animations) |
| <kbd>Super</kbd> + <kbd>W</kbd> | **Wallpaper Picker** | Visual grid of wallpapers with live palette preview |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>W</kbd> | **Random Wallpaper** | Instantly pick and apply a random wallpaper from your library |
| <kbd>Super</kbd> + <kbd>X</kbd> | **Session Screen** | Lock screen, Log out, Suspend, Restart, or Shut down |

---

### Window Management & Vim Navigation
| Shortcut | Action | Description |
| :--- | :--- | :--- |
| <kbd>Super</kbd> + <kbd>C</kbd> *(or <kbd>Alt</kbd> + <kbd>F4</kbd>)* | **Close Window** | Closes the active window gracefully |
| <kbd>Super</kbd> + <kbd>V</kbd> | **Toggle Floating** | Switch active window between tiled and floating mode |
| <kbd>Super</kbd> + <kbd>F</kbd> | **Fullscreen** | Toggle borderless fullscreen |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>F</kbd> | **Fake Fullscreen** | Fullscreen within the tiled partition (great for video players) |
| <kbd>Super</kbd> + <kbd>H</kbd> / <kbd>J</kbd> / <kbd>K</kbd> / <kbd>L</kbd> | **Focus Window** | Vim-style movement: Left (<kbd>H</kbd>), Down (<kbd>J</kbd>), Up (<kbd>K</kbd>), Right (<kbd>L</kbd>) |
| <kbd>Super</kbd> + <kbd>←</kbd> / <kbd>↓</kbd> / <kbd>↑</kbd> / <kbd>→</kbd> | **Focus Window** | Arrow key fallback |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>H</kbd>/<kbd>J</kbd>/<kbd>K</kbd>/<kbd>L</kbd> | **Swap Window** | Swap active window in any direction |
| <kbd>Super</kbd> + <kbd>1</kbd> ... <kbd>0</kbd> | **Go to Workspace** | Switch to workspaces 1 through 10 |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd> ... <kbd>0</kbd> | **Move Window** | Move current window to workspace 1 through 10 |
| <kbd>Super</kbd> + <kbd>Backspace</kbd> | **Previous Workspace** | Instantly toggle back and forth between previous workspaces |
| <kbd>Super</kbd> + <kbd>`</kbd> *(Tilde)* | **Toggle Scratchpad** | Bring up / hide the dropdown scratchpad workspace |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>`</kbd> | **Send to Scratchpad** | Send the current window into the hidden scratchpad |

---

### Modal Submaps (Resize & Move)
Modal submaps allow you to adjust window dimensions without holding down multiple keys at once:

- **Resize Submap:**
  1. Press <kbd>Super</kbd> + <kbd>R</kbd> to enter Resize mode.
  2. Repeatedly press <kbd>H</kbd>, <kbd>J</kbd>, <kbd>K</kbd>, <kbd>L</kbd> (or Arrow keys) to resize by 40px steps.
  3. Press <kbd>Escape</kbd> or <kbd>Enter</kbd> to exit.

- **Move Submap:**
  1. Press <kbd>Super</kbd> + <kbd>G</kbd> to enter Move mode.
  2. Repeatedly press <kbd>H</kbd>, <kbd>J</kbd>, <kbd>K</kbd>, <kbd>L</kbd> to throw the floating window around.
  3. Press numbers <kbd>1</kbd>–<kbd>5</kbd> to dispatch it to another workspace.
  4. Press <kbd>Escape</kbd> or <kbd>Enter</kbd> to exit.

---

### Screenshots (No PrintScreen Key Required)
All screenshot workflows are clustered on the <kbd>S</kbd> key:

| Shortcut | Action | Description |
| :--- | :--- | :--- |
| <kbd>Super</kbd> + <kbd>S</kbd> | **Interactive Region** | Drag a crosshair region with your mouse; copies PNG to clipboard immediately |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>S</kbd> | **Fullscreen Snip** | Instantly captures entire monitor to clipboard |
| <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>S</kbd> | **Save Fullscreen** | Captures monitor and writes PNG to `~/Pictures/Screenshots/` |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>S</kbd> | **Annotate Snip** | Drag a region and open directly in [Swappy](https://github.com/jtheoof/swappy) for arrows, text, and blurring |

---

### Quick System Menus
Keyboard-first dialogs with built-in search and fuzzy-matching:

| Shortcut | Tool | Description |
| :--- | :--- | :--- |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>N</kbd> | **Wi-Fi Picker** | Search, connect, disconnect, and enter WPA passwords for Wi-Fi networks |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>B</kbd> | **Bluetooth Manager** | Power on/off, scan, pair, trust, and connect to Bluetooth peripherals |
| <kbd>Super</kbd> + <kbd>P</kbd> | **Power Profile** | Switch between *Performance*, *Balanced*, and *Power Saver* (Fedora `tuned-ppd`) |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>V</kbd> | **Clipboard History** | Fuzzy-search through recent copied text and images via `cliphist` |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>A</kbd> | **Audio Mixer** | Opens `pavucontrol` to route audio streams and microphones |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>M</kbd> | **Display Settings** | Opens `wdisplays` to configure multi-monitor placement, scale, and refresh rate |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>C</kbd> | **Color Picker** | Crosshair magnifier that copies the exact HEX color to your clipboard |

---

### Audio & Brightness
Works with standard multimedia keys as well as direct 75% fallback keys:

| Shortcut | Hardware Key | Action |
| :--- | :--- | :--- |
| <kbd>Super</kbd> + <kbd>=</kbd> | <kbd>XF86AudioRaiseVolume</kbd> | Volume +5% (with on-screen display) |
| <kbd>Super</kbd> + <kbd>-</kbd> | <kbd>XF86AudioLowerVolume</kbd> | Volume -5% (with on-screen display) |
| *(Hardware)* | <kbd>XF86AudioMute</kbd> | Toggle Mute |
| *(Hardware)* | <kbd>XF86AudioMicMute</kbd> | Toggle Microphone Mute |
| *(Hardware)* | <kbd>XF86MonBrightnessUp</kbd> | Screen Brightness +5% |
| *(Hardware)* | <kbd>XF86MonBrightnessDown</kbd> | Screen Brightness -5% |
| *(Hardware)* | <kbd>XF86AudioPlay</kbd> | Media Play / Pause |
| *(Hardware)* | <kbd>XF86AudioNext</kbd> | Next Track |
| *(Hardware)* | <kbd>XF86AudioPrev</kbd> | Previous Track |

---

## 4. Using & Customizing Your Desktop

### Dynamic Material 3 Theming
This desktop does not use static color schemes. Whenever you set a wallpaper:
1. Matugen analyzes the image and extracts primary, secondary, and tertiary harmonic palettes.
2. The palette is saved to `~/.local/state/quickshell/user/generated/colors.json`.
3. Quickshell and Ghostty instantly reload their UI colors without requiring a reboot or restart.

To select a new wallpaper:
- Press **<kbd>Super</kbd> + <kbd>W</kbd>** to open the visual wallpaper picker.
- Click any wallpaper or press **<kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>W</kbd>** to cycle randomly.

### Launcher Command Palette
Open search (<kbd>Super</kbd> + <kbd>Space</kbd>) and type special command prefixes:
- `/dark` — Switch system theme to dark mode.
- `/light` — Switch system theme to light mode.
- `> <command>` — Run arbitrary shell command.
- `= <math>` — Built-in calculator (e.g., `= 45 * 12`).

### Configuring Monitors
Monitor configurations reside in `~/.config/hypr/conf.d/monitors.conf`.
To discover connected displays, run in your terminal:
```bash
hyprctl monitors
```
Example syntax in `monitors.conf`:
```ini
# monitor = name, resolution@refresh, position, scale
monitor = eDP-1, 1920x1080@60, 0x0, 1
monitor = HDMI-A-1, preferred, auto, 1
```
Alternatively, launch the graphical monitor tool using **<kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>M</kbd>**.

### Tweaking Keybindings
All keybindings are neatly isolated in `~/.config/hypr/conf.d/binds.conf`.
After editing the file, reload Hyprland instantly:
```bash
hyprctl reload
```

---

## 5. GNOME Coexistence & Safety

A primary design requirement of this setup is **peaceful coexistence with GNOME**:
- **No Shared Autostarts:** Autostart commands reside strictly in `~/.config/hypr/conf.d/autostart.conf` using Hyprland's `exec-once`. Nothing is installed in `~/.config/autostart` or systemd user units that would bleed into a GNOME session.
- **Display Manager Integrity:** GDM is left completely untouched. You can freely alternate between GNOME and Hyprland at the login screen.
- **Unified Cursors:** Hyprland sets the `Adwaita` cursor to ensure visual consistency when transitioning between desktop environments.
- **Isolated State:** Quickshell stores state in `~/.local/state/quickshell/`, safely separated from GNOME's GSettings database.

---

## 6. Troubleshooting & FAQs

### Q: Quickshell is not showing up or crashed. How do I restart it?
Open a terminal (<kbd>Super</kbd> + <kbd>Q</kbd>) and run:
```bash
killall qs 2>/dev/null
qs -c end4-pC &
```

### Q: How do I change the default terminal or browser?
Open `~/.config/hypr/conf.d/binds.conf`:
- Line 7: `$terminal = ghostty` (change to `kitty`, `ptyxis`, `alacritty`, etc.)
- Line 8: `$browser = firefox` (change to `google-chrome`, `brave`, `zen-browser`, etc.)
Then run `hyprctl reload`.

### Q: How do I access GNOME again?
1. Press <kbd>Super</kbd> + <kbd>X</kbd> to bring up the Session Screen and select **Log Out** (or press <kbd>Super</kbd> + <kbd>M</kbd>).
2. At the GDM login screen, click the **Gear icon ⚙️** and select **GNOME**.
3. Log in. Your GNOME environment remains completely unaltered.

---

## 7. Credits & Upstream Attribution

This setup stands on the shoulders of remarkable open-source projects:

- **[pctrade/end4-pC](https://github.com/pctrade/end4-pC)** — The Material 3 Quickshell desktop environment fork.
- **[end-4/dots-hyprland](https://github.com/end-4/dots-hyprland)** — The original innovative Material You Hyprland configuration.
- **[Quickshell](https://git.outfoxxed.me/quickshell/quickshell)** — Flexible Qt/QML desktop shell framework for Wayland compositors.
- **[Matugen](https://github.com/InioX/matugen)** by InioX — Material You palette generator for Linux.
- **[Hyprland](https://hyprland.org/)** by Vaxry and the Hyprland team — Modern dynamic Wayland compositor.
- **[EisregenHaha](https://github.com/EisregenHaha)** — Modular packaging and translation contributions.
