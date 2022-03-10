# Clear greeting
set -g fish_greeting ""

# Set environment variables
set -x VISUAL vim
set -x EDITOR $VISUAL

set -x BREW_HOME "/opt/homebrew"
set -x CARGO_HOME "$HOME/.cargo"
set -x GEM_HOME "/opt/homebrew/lib/ruby/gems/3.0.0"
set -x RUBY_HOME "/opt/homebrew/opt/ruby"
set -x NIX_HOME "$HOME/.nix-profile"
set -x SDKROOT (xcrun --show-sdk-path)

set -x PATH "$BREW_HOME/bin" \
            "$CARGO_HOME/bin" \
            "$GEM_HOME/bin" \
            "$RUBY_HOME/bin" \
            "$NIX_HOME/bin" \
            $PATH

# Use Vim keybindings
fish_vi_key_bindings

set -x GPG_TTY (tty)

source ~/.config/fish/abbrs.fish
fish_add_path /opt/homebrew/opt/openjdk@11/bin
