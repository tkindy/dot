# Clear greeting
set -g fish_greeting ""

# Set environment variables
set -x VISUAL vim
set -x EDITOR $VISUAL
set -x GEM_HOME "$HOME/.gems"
set -x NVM_HOME "$HOME/.nvm"
set -x JAVA_HOME "/usr/lib/jvm/java-1.8.0-openjdk-amd64"
set -x JDK_HOME $JAVA_HOME
set -x SPARK_HOME "/usr/local/spark"

set -x PATH "$GEM_HOME/bin" \
            "$SPARK_HOME/bin" \
            $PATH

# Use Vim keybindings
fish_vi_key_bindings

# OPAM configuration
source /home/tyler/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true
