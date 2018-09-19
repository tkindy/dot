#!/usr/bin/fish

source setup-functions.fish

set CONFIG_DIR "$HOME/.config"

# Install the essentials
echo "Installing essential packages..."
sudo apt-get install -y curl fonts-firacode lastpass-cli > /dev/null

# Link Fish config
echo "Linking Fish config..."
set fishDir "$CONFIG_DIR/fish"

rm -rf $fishDir
ln -s fish $fishDir

# Install Oh My Fish
if string match $OMF_CONFIG ""
  echo "Installing Oh My Fish..."
  curl -L https://get.oh-my.fish | fish > /dev/null
else
  echo "Oh My Fish is already installed"
end

# Set agnoster theme
if grep -q Agnoster "$CONFIG_DIR/fish/functions/fish_prompt.fish"
  echo "Agnoster theme already set"
else
  echo "Setting Fish theme to agnoster..."
  omf theme agnoster > /dev/null
end


# TODO more config


# Clean up
echo "Cleaning up auto installed packages..."
sudo apt-get autoremove > /dev/null

