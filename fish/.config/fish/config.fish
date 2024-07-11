# Clear greeting
set -g fish_greeting ""

# Set environment variables
set -x VISUAL vim
set -x EDITOR $VISUAL
set -x JAVA_HOME $JAVA21_HOME

set -x PATH "$HOME/bin" \
            "$HOME/.rd/bin" \
            "/opt/homebrew/opt/curl/bin"  \
            $PATH

# Use Vim keybindings
fish_vi_key_bindings

set -x GPG_TTY (tty)

source ~/.config/fish/abbrs.fish
starship init fish | source
