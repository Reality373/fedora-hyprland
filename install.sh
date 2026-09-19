#!/usr/bin/env bash
# =============================================================================
# Fedora-Hyprland (Material 3 Edition)
# Installer and Setup Script
# =============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTS_DIR="$SCRIPT_DIR"

echo "=================================================="
echo "      💠 Fedora Hyprland (Material 3 Setup)       "
echo "=================================================="
echo ""

# 1. Package Installation on Fedora
if command -v dnf &>/dev/null; then
    echo "--> Checking system dependencies via DNF..."
    sudo dnf install -y \
        hyprland \
        quickshell \
        qt6-qt5compat \
        qt6-qtpositioning \
        kf6-kirigami \
        kf6-syntax-highlighting \
        rofi-wayland \
        ghostty \
        grim \
        slurp \
        wl-clipboard \
        cliphist \
        hypridle \
        hyprlock \
        pamixer \
        brightnessctl \
        playerctl \
        python3-pip \
        python3-gobject \
        python3-pillow \
        python3-opencv \
        python3-numpy 2>/dev/null || true
fi

# 2. Python Material You Color Generator
echo "--> Verifying Python dependencies..."
python3 -m pip install --user --quiet materialyoucolor Pillow 2>/dev/null || true

# 3. Matugen (Material 3 Palette Generator)
if ! command -v matugen &>/dev/null; then
    echo "--> Installing Matugen binary..."
    mkdir -p "$HOME/.local/bin"
    curl -sSL "https://github.com/InioX/matugen/releases/download/v4.2.0/matugen-4.2.0-x86_64.tar.gz" | \
        tar -zx -C "$HOME/.local/bin/" matugen
    chmod +x "$HOME/.local/bin/matugen"
fi

# 4. Linking Configurations
echo "--> Linking configuration directories..."
mkdir -p "$HOME/.config/quickshell" "$HOME/.config" "$HOME/.local/bin"

# Hyprland config
if [ -d "$HOME/.config/hypr" ] && [ ! -L "$HOME/.config/hypr" ]; then
    echo "Backing up existing ~/.config/hypr to ~/.config/hypr.backup"
    mv "$HOME/.config/hypr" "$HOME/.config/hypr.backup.$(date +%s)"
fi
ln -sfn "$DOTS_DIR/config/hypr" "$HOME/.config/hypr"

# Quickshell end4-pC & ii alias
ln -sfn "$DOTS_DIR/config/quickshell/end4-pC" "$HOME/.config/quickshell/end4-pC"
ln -sfn "$DOTS_DIR/config/quickshell/end4-pC" "$HOME/.config/quickshell/ii"

# Rofi config
mkdir -p "$HOME/.config/rofi"
ln -sfn "$DOTS_DIR/config/rofi/config.rasi" "$HOME/.config/rofi/config.rasi"
ln -sfn "$DOTS_DIR/config/rofi/theme.rasi" "$HOME/.config/rofi/theme.rasi"

# Helper scripts
for script in "$DOTS_DIR"/scripts/*; do
    if [ -f "$script" ]; then
        chmod +x "$script"
        ln -sfn "$script" "$HOME/.local/bin/$(basename "$script")"
    fi
done

# 5. Initialize Material 3 Color Theme
echo "--> Generating initial Material 3 color palette..."
mkdir -p "$HOME/.local/state/quickshell/user/generated"
matugen image "$DOTS_DIR/config/quickshell/end4-pC/assets/images/default_wallpaper.png" \
    --source-color-index 0 --mode dark --json hex > "$HOME/.local/state/quickshell/user/generated/colors.json" 2>/dev/null || true

# 6. Verify Hyprland Configuration
echo "--> Validating Hyprland config..."
if command -v hyprland &>/dev/null; then
    hyprland --verify-config
fi

echo ""
echo "=================================================="
echo " ✨ Installation & Configuration Complete!        "
echo "=================================================="
echo "You can now log into Hyprland from your login manager (GDM)."
echo "Press SUPER for app search, or SUPER + / for the keybind cheatsheet."
echo ""
