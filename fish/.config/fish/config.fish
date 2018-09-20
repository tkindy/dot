# Clear greeting
set -g fish_greeting ""

# Set environment variables
set -x VISUAL vim
set -x EDITOR $VISUAL

# Git Abbreviations
add-alias g   "git"
add-alias ga  "git add"
add-alias gb  "git branch"
add-alias gx  "git checkout"
add-alias gxm "git checkout master"
add-alias gp  "git pull"
add-alias gu  "git push"
add-alias gd  "git diff"
add-alias gh  "git stash"
add-alias ghl "git stash list"
add-alias ghp "git stash pop"
add-alias ghd "git stash drop"

