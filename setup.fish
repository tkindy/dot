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

sudo add-apt-repository -ny ppa:plt/racket

set nordVpnRepoDeb "$TEMP_DIR/nordvpn.deb"

echo "Fetching NordVPN repo setup file..."
curl -o $nordVpnRepoDeb \
  "https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb"

sudo apt-get install -y "./$nordVpnRepoDeb"

# Install other general packages
echo "Installing general packages..."
sudo apt-get update
sudo apt-get install -y vim fonts-firacode lastpass-cli tree python tmux \
                        nordvpn racket xclip pandoc

sudo snap install spotify vlc
sudo snap install --classic slack

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

# Create dotfile directories
echo "Creating dotfile directories..."

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
  transmission

# Install Oh My Fish
if type -q omf
  echo "Oh My Fish is already installed"
else
  echo "Installing Oh My Fish..."
  set installFile "$TEMP_DIR/install-omf"

  curl -fLo $installFile https://get.oh-my.fish
  fish $installFile --noninteractive --yes
end

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

  echo "Logging into LastPass for Dropbox password..."
  lpass login --trust tylerkindy@gmail.com
  lpass show --password --clip dropbox.com
  echo "Password copied to clipboard"
end

# Spotify
set spotifyDesktop '/var/lib/snapd/desktop/applications/spotify_spotify.desktop'

if grep -qE "\-\-force-device-scale-factor" $spotifyDesktop
  echo "Spotify scale factor already set"
else
  echo "Setting Spotify scale factor..."
  sudo sed -i -E 's/^Exec=(.*) %U$/Exec=\1 --force-device-scale-factor=2.0 %U/' \
    $spotifyDesktop
end

# VSCode

if type -q code
  echo "VSCode already installed"
else
  echo "Installing VSCode..."

  set codeDeb "$TEMP_DIR/code.deb"

  curl -Lo $codeDeb "https://go.microsoft.com/fwlink/?LinkID=760868"
  sudo apt-get install -y "./$codeDeb"
end

for extension in (cat $VSCODE_EXTENSIONS)
  code --install-extension $extension
end


# TODO more config
# - IntelliJ
# - Android Studio


# Clean up
echo "Deleting temp directory..."
rm -rf $TEMP_DIR

echo "Cleaning up auto installed packages..."
sudo apt-get autoremove -y

echo
echo "Done! Log out and back in now to finish setting everything up"

