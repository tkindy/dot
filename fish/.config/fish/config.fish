# Clear greeting
set -g fish_greeting ""

# Set environment variables
set -x VISUAL vim
set -x EDITOR $VISUAL

set -x BREW_HOME "/opt/homebrew"

set -x PATH "$BREW_HOME/bin" \
            $PATH

# Use Vim keybindings
fish_vi_key_bindings

set -x GPG_TTY (tty)

source ~/.config/fish/abbrs.fish
