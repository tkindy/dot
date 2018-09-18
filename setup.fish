#!/usr/bin/fish

# Install the essentials
sudo apt-get install -y curl fonts-firacode > /dev/null

# Install Oh My Fish
if string match $OMF_CONFIG ""
  echo "Installing Oh My Fish..."
  curl -L https://get.oh-my.fish | fish > /dev/null
else
  echo "Oh My Fish is already installed"
end

# Set agnoster theme
# TODO: make incremental
echo "Setting Fish theme to agnoster..."
omf theme agnoster > /dev/null

