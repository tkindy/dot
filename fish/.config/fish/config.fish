# Added by nex: https://git.hubteam.com/HubSpot/nex
source ~/.hubspot/config.fish

# Clear greeting
set -g fish_greeting ""

# Set environment variables
set -x VISUAL vim
set -x EDITOR $VISUAL
set -x JAVA_HOME $JAVA17_HOME

set -x PATH "$HOME/bin" \
            "$HOME/.yarn/bin" \
            "$HOME/.rd/bin" \
            $PATH

# Use Vim keybindings
fish_vi_key_bindings

set -x GPG_TTY (tty)

source ~/.config/fish/abbrs.fish
