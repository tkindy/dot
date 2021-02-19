# Clear greeting
set -g fish_greeting ""

# Set environment variables
set -x VISUAL vim
set -x EDITOR $VISUAL
set -x GEM_HOME "$HOME/.gems"
set -x NVM_HOME "$HOME/.nvm"
set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/"
set -x JDK_HOME $JAVA_HOME
set -x CARGO_HOME "$HOME/.cargo"
set -x ANACONDA_HOME "/usr/local/anaconda3"

set -x PATH $PATH \
            "$GEM_HOME/bin" \
            "$CARGO_HOME/bin" \
            "$ANACONDA_HOME/bin"

# Use Vim keybindings
fish_vi_key_bindings

# OPAM configuration
source /home/tyler/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

if status --is-login; and test (tty) = "/dev/tty1"
  exec startx
end

# Added by nex: https://git.hubteam.com/HubSpot/nex
source ~/.hubspot/config.fish

set -x GPG_TTY (tty)

source ~/.config/fish/abbrs.fish
