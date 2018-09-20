#!/usr/bin/fish

source setup-functions.fish

set CONFIG_DIR "$HOME/.config"

# Install the essentials
echo "Installing essential packages..."
sudo apt-get install -y curl stow fonts-firacode lastpass-cli

# Stow dotfiles
echo "Stowing dotfiles..."

stow -v -t $HOME \
  fish

# Install Oh My Fish
if test -e /home/tyler/.local/share/omf
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


# TODO more config


# Clean up
echo "Cleaning up auto installed packages..."
sudo apt-get autoremove

