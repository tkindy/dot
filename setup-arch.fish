#!/usr/bin/fish

source common.fish
source setup-functions.fish

set CONFIG_DIR "$HOME/.config"

set TEMP_DIR "temp"
rm -rf $TEMP_DIR
mkdir $TEMP_DIR

set -U fish_user_paths ~/.bin

# Install the essentials needed for setup
echo "Installing setup packages..."
sudo pacman -S --needed --noconfirm curl wget stow

# Install other general packages
echo "Installing general packages..."
sudo pacman -S --needed --noconfirm \
  vim-minimal ttf-fira-code lastpass-cli tree python tmux xclip make ocaml opam \
  jdk-openjdk xloadimage feh transmission-gtk openssh code xorg-xbacklight redshift

# TODO: nordvpn, signal, spotfy, vlc, gimp, intellij

# Create user directories
echo "Creating user directories..."
mkdir -p ~/src
mkdir -p ~/temp

# Stow dotfiles
echo "Stowing dotfiles..."

stow --no-folding -vt $HOME \
  ssh \
  fish \
  omf \
  vim \
  git \
  lpass \
  tmux \
  vscode \
  transmission \
  gpg \
  nordvpn \
  jetbrains \
  bin \
  polybar \
  x \
  i3 \
  alacritty \
  gtk

# Install Oh My Fish
if type -q omf
  echo "Oh My Fish is already installed"
else
  echo "Installing Oh My Fish..."
  set installFile "$TEMP_DIR/install-omf"

  curl -fLo $installFile https://get.oh-my.fish
  fish $installFile --noninteractive --yes
end

# SSH
ssh-copy-id login.ccs.neu.edu

# vim-plug
if test -e ~/.vim/autoload/plug.vim
  echo "vim-plug already installed"
else
  echo "Installing vim-plug..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
end

echo "Installing vim plugins..."
vim +PlugInstall +q +q

# TODO: Dropbox
if test -e ~/.dropbox-dist/dropboxd
  echo "Dropbox already installed"
else
end

echo "Installing VSCode extensions..."
set -l curExtensions "$TEMP_DIR/curExtensions"

code --list-extensions > $curExtensions
set -l missingExts (diff $curExtensions $VSCODE_EXTENSIONS | grep -oP $EXTENSION_REGEX)

if test (count $missingExts) -eq 0
  echo "All extensions already installed"
else
  for extension in $missingExts
    code --install-extension $extension
  end
end

# OPAM
if test -d ~/.opam
  echo "OPAM already initialized"
else
  opam init
end

opam install merlin extlib ounit

# TODO more config
# - IntelliJ
# - Android Studio


# Clean up
echo "Deleting temp directory..."
rm -rf $TEMP_DIR

# Abbreviations

# Git Abbreviations
abbr --add g   "git"
abbr --add ga  "git add"
abbr --add gb  "git branch"
abbr --add gs  "git status"
abbr --add gl  "git log"
abbr --add gx  "git checkout"
abbr --add gxm "git checkout master"
abbr --add gc  "git commit"
abbr --add gp  "git pull"
abbr --add gu  "git push"
abbr --add gd  "git diff"
abbr --add gh  "git stash"
abbr --add ghl "git stash list"
abbr --add ghp "git stash pop"
abbr --add ghd "git stash drop"

# NordVPN Abbreviations
abbr --add nv  "nordvpn"
abbr --add nvs "nordvpn status"
abbr --add nvc "nordvpn c us"
abbr --add nvd "nordvpn d"

# Miscellaneous Abbreviations
abbr --add clip "xclip -sel clip"

echo
echo "Done! Log out and back in now to finish setting everything up"
