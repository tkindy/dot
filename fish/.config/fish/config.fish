# Clear greeting
set -g fish_greeting ""

# Set environment variables
set -x VISUAL vim
set -x EDITOR $VISUAL
set -x GEM_HOME "$HOME/.gems"
set -x NVM_HOME "$HOME/.nvm"
set -x JAVA_HOME "/usr/lib/jvm/java-1.8.0-openjdk-amd64"
set -x HADOOP_HOME "/usr/local/hadoop"
set -x SPARK_HOME "/usr/local/spark"
set -x YARN_CONF_DIR "$HADOOP_HOME/etc/hadoop"
set -x SPARK_DIST_CLASSPATH (eval "$HADOOP_HOME/bin/hadoop" classpath)

set -x PATH "$GEM_HOME/bin" \
            "$HADOOP_HOME/bin" "$HADOOP_HOME/sbin" \
            "$SPARK_HOME/bin" \
            $PATH

# Use Vim keybindings
fish_vi_key_bindings

# Git Abbreviations
add-alias g   "git"
add-alias ga  "git add"
add-alias gb  "git branch"
add-alias gs  "git status"
add-alias gl  "git log"
add-alias gx  "git checkout"
add-alias gxm "git checkout master"
add-alias gc  "git commit"
add-alias gp  "git pull"
add-alias gu  "git push"
add-alias gd  "git diff"
add-alias gh  "git stash"
add-alias ghl "git stash list"
add-alias ghp "git stash pop"
add-alias ghd "git stash drop"

# NordVPN Abbreviations
add-alias nv   "nordvpn"
add-alias nvs  "nordvpn status"
add-alias nvf  "nordvpn refresh"
add-alias nvus "nordvpn c us"
add-alias nvd  "nordvpn d"

# Miscellaneous Abbreviations
add-alias clip "xclip -sel clip"

# OPAM configuration
source /home/tyler/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

