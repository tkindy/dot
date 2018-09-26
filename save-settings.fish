#!/usr/bin/fish

# Save settings

source common.fish

# Terminal
dconf dump /org/gnome/terminal/ > $TERMINAL_SETTINGS

# Favorite apps
dconf read /org/gnome/shell/favorite-apps > $FAVORITE_APPS

# Keyboard options
dconf read /org/gnome/desktop/input-sources/xkb-options > $KEYBOARD_OPTIONS

# VSCode Extensions
code --list-extensions | grep -xP '[^\s]+\.[^\s]+' > $VSCODE_EXTENSIONS

