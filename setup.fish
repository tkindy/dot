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

sudo add-apt-repository ppa:plt/racket -y

set nordVpnRepoDeb "$TEMP_DIR/nordvpn.deb"

echo "Fetching NordVPN repo setup file..."
curl -o $nordVpnRepoDeb \
  "https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb"

sudo apt-get install -y "./$nordVpnRepoDeb"

# Install other general packages
echo "Installing general packages..."
sudo apt-get update
sudo apt-get install -y vim fonts-firacode lastpass-cli tree python tmux \
                        nordvpn code racket

sudo snap install spotify slack vlc

# Load terminal settings
echo "Loading terminal settings..."
dconf load /org/gnome/terminal/ < $TERMINAL_SETTINGS

# Stow dotfiles
echo "Stowing dotfiles..."

stow -v-t $HOME \
  fish \
  omf \
  vim \
  git \
  lpass \
  tmux \
  vscode

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
  vim +PlugInstall +q +q
end

# Dropbox
if test -e ~/.dropbox-dist/dropboxd
  echo "Dropbox already installed"
else
  echo "Installing Dropbox..."
  pushd temp
  wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
  mv .dropbox-dist ~

  read -P "Do you need the Dropbox password (y/N)? " response

  if test $response = 'y'
    echo "Logging into LastPass..."
    lpass login --trust tylerkindy@gmail.com
    lpass show --password --clip dropbox.com
    echo "Password copied to clipboard"
  end

  read -P "Press 'Enter' when you're ready to set up Dropbox" response
  ~/.dropbox-dist/dropboxd > /dev/null ^ /dev/null
  
  echo "Setting Dropbox to autostart at startup..."
  wget -O dropbox.py "https://www.dropbox.com/download?dl=packages/dropbox.py"
  python dropbox.py autostart y
  popd
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
sudo apt-get autoremove

echo
echo "Done! Log out and back in now to finish setting everything up"

