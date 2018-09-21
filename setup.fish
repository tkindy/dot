#!/usr/bin/fish

source setup-functions.fish

set CONFIG_DIR "$HOME/.config"

# Install the essentials
echo "Installing essential packages..."
sudo apt-get install -y vim curl stow fonts-firacode lastpass-cli tree

# Stow dotfiles
echo "Stowing dotfiles..."

stow -v-t $HOME \
  fish \
  vim \
  git

# Install Oh My Fish
if type -q omf
  echo "Oh My Fish is already installed"
else
  echo "Installing Oh My Fish..."
  curl -L https://get.oh-my.fish | fish
end

# Set agnoster theme
if grep -q agnoster "$CONFIG_DIR/omf/theme"
  echo "Agnoster theme already set"
else
  echo "Setting Fish theme to agnoster..."
  omf install agnoster
  omf theme agnoster
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


# TODO more config


# Clean up
echo "Cleaning up auto installed packages..."
sudo apt-get autoremove

echo
echo "Done! Restart now to finish setting everything up"

