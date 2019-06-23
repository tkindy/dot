#!/usr/bin/fish

source common.fish
source setup-functions.fish

set CONFIG_DIR "$HOME/.config"

set TEMP_DIR "temp"
rm -rf $TEMP_DIR
mkdir $TEMP_DIR

# Install the essentials needed for setup
echo "Installing setup packages..."
sudo apt-get install -y curl wget stow

# Add repositories
echo "Adding apt repositories..."

if check-repo nordvpn
  echo "NordVPN repo already added"
else
  echo "Adding NordVPN repo..."
  echo "Fetching NordVPN repo setup file..."
  set nordVpnRepoDeb "$TEMP_DIR/nordvpn.deb"

  curl -o $nordVpnRepoDeb \
    "https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb"

  sudo apt-get install -y "./$nordVpnRepoDeb"
end

if check-repo signal
  echo "Signal repo already added"
else
  echo "Adding Signal repo..."
  curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
  echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | \
    sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
end

if check-repo docker
  echo "Docker repo already added"
else
  echo "Adding Docker repo..."
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu cosmic stable"
end

# Install other general packages
echo "Installing general packages..."
sudo apt-get update
sudo apt-get install -y vim-gtk fonts-firacode tree python tmux \
                        nordvpn xclip make make-doc ruby-full build-essential \
                        signal-desktop ocaml-nox opam openjdk-12-jdk xloadimage \
                        feh transmission docker-ce docker-ce-cli containerd.io

sudo snap install spotify vlc gimp bitwarden
sudo snap install --classic intellij-idea-community
sudo snap install --classic code

# Load terminal settings
echo "Loading terminal settings..."
dconf load $DCONF_TERMINAL < $TERMINAL_SETTINGS

# Load favorite apps
echo "Loading favorite apps..."
dconf write $DCONF_FAVORITE_APPS (cat $FAVORITE_APPS)

# Load keyboard options
echo "Loading keyboard options..."
dconf write $DCONF_KEYBOARD (cat $KEYBOARD_OPTIONS)

# Load dock options
echo "Loading dock options..."
dconf write $DCONF_DOCK (cat $DOCK_OPTIONS)

# Load clock format
echo "Loading clock format..."
dconf write $DCONF_CLOCK_FORMAT (cat $CLOCK_FORMAT)

# Load Night Light settings
echo "Loading Night Light settings..."
dconf load $DCONF_NIGHT_LIGHT < $NIGHT_LIGHT_SETTINGS

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
  tmux \
  vscode \
  transmission \
  gpg \
  nordvpn \
  jetbrains

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

# Dropbox
if test -e ~/.dropbox-dist/dropboxd
  echo "Dropbox already installed"
else
  echo "Installing Dropbox..."

  set dropboxDeb "$TEMP_DIR/dropbox.deb"
  curl -Lo $dropboxDeb "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb"
  sudo apt-get install -y "./$dropboxDeb"
end

# VSCode

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

# Ruby/Jekyll

gem install jekyll bundler

# OPAM
opam init
opam install merlin extlib ounit

# Docker
sudo groupadd -f docker
sudo usermod -aG docker $USER


# TODO more config
# - IntelliJ
# - Android Studio


# Clean up
echo "Deleting temp directory..."
rm -rf $TEMP_DIR

echo "Cleaning up auto installed packages..."
sudo apt-get autoremove -y

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
echo "Done! Restart now to finish setting everything up"
