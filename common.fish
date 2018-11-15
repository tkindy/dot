#!/usr/bin/fish

# Saved settings files
set SAVE_DIR save

set TERMINAL_SETTINGS    "$SAVE_DIR/terminal-settings"
set FAVORITE_APPS        "$SAVE_DIR/favorite-apps"
set KEYBOARD_OPTIONS     "$SAVE_DIR/keyboard-options"
set DOCK_OPTIONS         "$SAVE_DIR/dock-options"
set CLOCK_FORMAT         "$SAVE_DIR/clock-format"
set VSCODE_EXTENSIONS    "$SAVE_DIR/vscode-extensions"
set NIGHT_LIGHT_SETTINGS "$SAVE_DIR/night-light-settings"

# dconf keys
set DCONF_TERMINAL      "/org/gnome/terminal/"
set DCONF_FAVORITE_APPS "/org/gnome/shell/favorite-apps"
set DCONF_KEYBOARD      "/org/gnome/desktop/input-sources/xkb-options"
set DCONF_DOCK          "/org/gnome/shell/extensions/dash-to-dock/dock-fixed"
set DCONF_CLOCK_FORMAT  "/org/gnome/desktop/interface/clock-format"
set DCONF_NIGHT_LIGHT   "/org/gnome/settings-daemon/plugins/color/"

