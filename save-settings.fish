#!/usr/bin/fish

# Save settings

source common.fish

# Terminal
dconf dump /org/gnome/terminal/ > $TERMINAL_SETTINGS

# Favorite apps
dconf read /org/gnome/shell/favorite-apps > $FAVORITE_APPS

# VSCode Extensions
code --list-extensions | grep -xP '[^\s]+\.[^\s]+' > $VSCODE_EXTENSIONS

