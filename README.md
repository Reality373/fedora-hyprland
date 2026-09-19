<div align="center">

# 💠 Fedora Hyprland (Material 3 Edition)

A keyboard-first, aesthetically pleasing **Hyprland** desktop environment tailored for **Fedora**, featuring dynamic Material 3 theming powered by **Quickshell** and **Matugen**.

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Fedora](https://img.shields.io/badge/Fedora-42%2B-blue?logo=fedora)](https://fedoraproject.org/)
[![Hyprland](https://img.shields.io/badge/Hyprland-v0.53%2B-cyan?logo=wayland)](https://hyprland.org/)

</div>

---

## ✨ Features

- **Material 3 Desktop Shell:** Powered by [Quickshell](https://git.outfoxxed.me/quickshell/quickshell) with a customizable bar, dock, dynamic widgets, lyrics support, and quick toggles.
- **Dynamic Theming:** Wallpapers generate real-time Material You palettes using [Matugen](https://github.com/InioX/matugen) and `materialyoucolor`.
- **Keyboard-First Workflow:** Vim-style window navigation (<kbd>H</kbd>/<kbd>J</kbd>/<kbd>K</kbd>/<kbd>L</kbd>), modal resize/move submaps, and instant cheatsheet overlay (<kbd>Super</kbd> + <kbd>/</kbd>).
- **GNOME Coexistence:** Completely isolated so it will **never damage or interfere with your GNOME desktop environment**.
- **Modern Hyprland Syntax:** Fully updated for Hyprland 0.53+ (unified `windowrule` engine, explicit booleans, zero legacy syntax errors).

---

## ⚡ Quick Installation

Clone this repository and run the automated installer:

```bash
git clone https://github.com/Reality373/fedora-hyprland.git ~/fedora-hyprland
cd ~/fedora-hyprland
chmod +x install.sh
./install.sh
```

After installation:
1. Log out of your current desktop session.
2. Select **Hyprland** from the display manager (GDM) session gear icon.
3. Log in.

---

## ⌨️ Keyboard Shortcuts Cheat Sheet

Press **<kbd>Super</kbd> + <kbd>/</kbd>** anytime inside Hyprland to bring up the live, searchable cheatsheet overlay!

### 💠 Shell Overlays
| Shortcut | Action |
| :--- | :--- |
| <kbd>Super</kbd> *(tap)* or <kbd>Super</kbd> + <kbd>D</kbd> | **App Launcher & Command Search** *(Type `<` for keybinds, `/dark`, `/light`)* |
| <kbd>Super</kbd> + <kbd>Tab</kbd> | **Window & Workspace Overview** |
| <kbd>Super</kbd> + <kbd>Escape</kbd> *(or <kbd>Super</kbd> + <kbd>,</kbd>)* | **Material 3 Settings Panel** |
| <kbd>Super</kbd> + <kbd>N</kbd> | **Notification Center & Quick Toggles** |
| <kbd>Super</kbd> + <kbd>A</kbd> | **Left Sidebar** *(AI Assistant, Notes, Tools)* |
| <kbd>Super</kbd> + <kbd>W</kbd> | **Wallpaper Selector** |
| <kbd>Super</kbd> + <kbd>X</kbd> | **Session & Power Screen** *(Lock, Reboot, Shutdown)* |

### 🪟 Window Management
| Shortcut | Action |
| :--- | :--- |
| <kbd>Super</kbd> + <kbd>Q</kbd> | Launch Terminal (`ghostty`) |
| <kbd>Super</kbd> + <kbd>E</kbd> | Open File Manager (`nautilus`) |
| <kbd>Super</kbd> + <kbd>C</kbd> | Close Focused Window |
| <kbd>Super</kbd> + <kbd>V</kbd> | Toggle Floating / Tiled Window |
| <kbd>Super</kbd> + <kbd>F</kbd> | Toggle Fullscreen |
| <kbd>Alt</kbd> + <kbd>Tab</kbd> | Cycle Windows in Workspace |

### 🧭 Focus & Movement
| Shortcut | Action |
| :--- | :--- |
| <kbd>Super</kbd> + <kbd>H</kbd>/<kbd>J</kbd>/<kbd>K</kbd>/<kbd>L</kbd> *(or Arrows)* | Move focus Left / Down / Up / Right |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>H</kbd>/<kbd>J</kbd>/<kbd>K</kbd>/<kbd>L</kbd> | Swap window Left / Down / Up / Right |
| <kbd>Super</kbd> + <kbd>1</kbd> ... <kbd>0</kbd> | Switch to Workspace 1–10 |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd> ... <kbd>0</kbd> | Move active window to Workspace 1–10 |
| <kbd>Super</kbd> + <kbd>`</kbd> | Toggle Scratchpad Workspace |

### 📐 Modal Submaps
- **Resize Mode:** Press <kbd>Super</kbd> + <kbd>R</kbd>, then resize with <kbd>H</kbd>/<kbd>J</kbd>/<kbd>K</kbd>/<kbd>L</kbd>. Exit with <kbd>Escape</kbd>.
- **Move Mode:** Press <kbd>Super</kbd> + <kbd>G</kbd>, then move with <kbd>H</kbd>/<kbd>J</kbd>/<kbd>K</kbd>/<kbd>L</kbd>. Exit with <kbd>Escape</kbd>.

### 📸 Screenshots & System
| Shortcut | Action |
| :--- | :--- |
| <kbd>Super</kbd> + <kbd>S</kbd> | Interactive Region Screenshot *(Clipboard)* |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>S</kbd> | Fullscreen Screenshot *(Clipboard)* |
| <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>S</kbd> | Fullscreen Screenshot *(Saved to `~/Pictures/Screenshots`)* |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>L</kbd> | Lock Screen (`hyprlock`) |

---

## 📁 Repository Structure

```
fedora-hyprland/
├── config/
│   ├── hypr/               # Hyprland modular configuration
│   │   ├── conf.d/         # Sub-configs (autostart, binds, rules, looks, etc.)
│   │   ├── hyprland.conf   # Master Hyprland config
│   │   ├── hypridle.conf   # Idle manager config
│   │   ├── hyprlock.conf   # Lock screen config
│   │   └── hyprpaper.conf  # Wallpaper engine fallback
│   ├── quickshell/         # Material 3 Quickshell desktop shell (end4-pC)
│   │   └── end4-pC/        # Shell components, modules, and widgets
│   └── rofi/               # Rofi launcher configs and themes
├── scripts/                # Helper scripts (cheatsheet, wifi, bluetooth, etc.)
├── install.sh              # Automated setup script
└── README.md
```

---

## 🙏 Credits & Acknowledgments

This configuration builds upon the extraordinary work of the Linux rice and Wayland open-source community:

- **[@pctrade](https://github.com/pctrade)** — for creating and maintaining the [end4-pC](https://github.com/pctrade/end4-pC) fork with custom bar, widgets, online wallpapers, and lyrics support.
- **[@end-4](https://github.com/end-4)** — for creating the legendary [dots-hyprland / illogical-impulse](https://github.com/end-4/dots-hyprland) Material 3 shell.
- **[@vaxerski](https://github.com/vaxerski)** and the **Hyprland Team** — for the state-of-the-art [Hyprland](https://hyprland.org) Wayland compositor.
- **[@outfoxxed](https://git.outfoxxed.me/outfoxxed)** — for [Quickshell](https://git.outfoxxed.me/quickshell/quickshell), the QtQuick/QML desktop shell toolkit.
- **[@InioX](https://github.com/InioX)** — for [Matugen](https://github.com/InioX/matugen), the cross-platform Material You palette generator.
- **[@gh0stzk](https://github.com/gh0stzk)** — for the weather API integration.
- **[@EisregenHaha](https://github.com/EisregenHaha)** — for Fedora community insights and adaptations.

---

<div align="center">
Maintained by <a href="https://github.com/Reality373">Reality373</a>
</div>
