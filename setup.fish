#!/usr/bin/fish

source setup-functions.fish

set CONFIG_DIR "$HOME/.config"

set TEMP_DIR "temp"
rm -rf $TEMP_DIR
mkdir $TEMP_DIR

# Install the essentials
echo "Installing essential packages..."
sudo apt-get install -y vim curl stow fonts-firacode lastpass-cli tree wget

# Load terminal settings
echo "Loading terminal settings..."
dconf load /org/gnome/terminal/ < terminal-settings.txt

# Stow dotfiles
echo "Stowing dotfiles..."

stow -v-t $HOME \
  fish \
  omf \
  vim \
  git \
  lpass

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
  wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
  mv .dropbox-dist ~
  ~/.dropbox-dist/dropboxd & > /dev/null ^ /dev/null

  echo -n "Do you need the Dropbox password (y/N)? "
  read response

  if response = 'y'
    echo "Logging into LastPass..."
    lpass login --trust tylerkindy@gmail.com
    lpass show --password dropbox.com
  end

  echo "Press 'Enter' when logged into Dropbox"
  read response
end

# Install Spotify
set spotifyDesktop '/var/lib/snapd/desktop/applications/spotify_spotify.desktop'

if type -q spotify
  echo "Spotify already installed"
else
  echo "Installing Spotify..."
  sudo snap install spotify
end

if grep -qE "\-\-force-device-scale-factor" $spotifyDesktop
  echo "Spotify scale factor already set"
else
  echo "Setting Spotify scale factor..."
  sudo sed -i -E 's/^Exec=(.*) %U$/Exec=\1 --force-device-scale-factor=2.0 %U/' \
    $spotifyDesktop
end


# TODO more config
# - Dropbox
# - Slack
# - IntelliJ
# - Android Studio
# - VLC


# Clean up
echo "Deleting temp directory..."
rm -rf $TEMP_DIR

echo "Cleaning up auto installed packages..."
sudo apt-get autoremove

echo
echo "Done! Restart now to finish setting everything up"

