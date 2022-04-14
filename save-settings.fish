#!/usr/bin/fish

# Save settings

source common.fish

# Terminal
dconf dump $DCONF_TERMINAL > $TERMINAL_SETTINGS

# Favorite apps
dconf read $DCONF_FAVORITE_APPS > $FAVORITE_APPS

# Keyboard options
dconf read $DCONF_KEYBOARD > $KEYBOARD_OPTIONS

# Dock options
dconf read $DCONF_DOCK > $DOCK_OPTIONS

# Clock format
dconf read $DCONF_CLOCK_FORMAT > $CLOCK_FORMAT

# Night Light settings
dconf dump $DCONF_NIGHT_LIGHT > $NIGHT_LIGHT_SETTINGS

# VSCode Extensions
code --list-extensions | rg -xP $EXTENSION_REGEX > $VSCODE_EXTENSIONS

