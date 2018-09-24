#!/usr/bin/fish

source setup-functions.fish

set CONFIG_DIR "$HOME/.config"

set TEMP_DIR "temp"
rm -rf $TEMP_DIR
mkdir $TEMP_DIR

# Install the essentials
echo "Installing essential packages..."
sudo apt-get install -y vim curl stow fonts-firacode lastpass-cli tree wget \
                        python tmux

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
  lpass \
  tmux

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

