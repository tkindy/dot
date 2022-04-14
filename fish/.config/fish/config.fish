# Clear greeting
set -g fish_greeting ""

# Set environment variables
set -x VISUAL vim
set -x EDITOR $VISUAL
set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home"

set -x PATH "$JAVA_HOME/bin" \
            "$HOME/bin" \
            $PATH

# Use Vim keybindings
fish_vi_key_bindings

# Added by nex: https://git.hubteam.com/HubSpot/nex
source ~/.hubspot/config.fish

set -x GPG_TTY (tty)

source ~/.config/fish/abbrs.fish
