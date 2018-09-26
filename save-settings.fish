#!/usr/bin/fish

# Save settings

source common.fish

# Terminal
dconf dump /org/gnome/terminal/ > $TERMINAL_SETTINGS

# VSCode Extensions
code --list-extensions | grep -xP '[^\s]+\.[^\s]+' > $VSCODE_EXTENSIONS

