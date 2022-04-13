# Clear greeting
set -g fish_greeting ""

# Set environment variables
set -x VISUAL vim
set -x EDITOR $VISUAL
set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home"
set -x GEM_HOME "$HOME/.gems"
set -x NVM_HOME "$HOME/.nvm"
set -x CARGO_HOME "$HOME/.cargo"
set -x ANACONDA_HOME "/usr/local/anaconda3"

set -x PATH "$JAVA_HOME/bin" \
            "$GEM_HOME/bin" \
            "$CARGO_HOME/bin" \
            "$ANACONDA_HOME/bin" \
            $PATH

# Use Vim keybindings
fish_vi_key_bindings

# Added by nex: https://git.hubteam.com/HubSpot/nex
source ~/.hubspot/config.fish

set -x GPG_TTY (tty)

source ~/.config/fish/abbrs.fish
