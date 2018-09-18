#!/bin/bash

function check-exit() {
  if [ $? -ne 0 ]; then
    exit
  fi
}

# Check that the script is being run as a normal user
if [ "$EUID" -eq 0 ]; then
  echo "Please run as a normal user, not as root."
  exit
fi

# Upgrade packages
echo
echo "Upgrading packages..."
sudo apt-get update > /dev/null
check-exit
sudo apt-get upgrade -y > /dev/null
check-exit

# Install Fish
echo

fishPath=$(which fish)
if [ -z "$fishPath" ]; then
  echo "Installing Fish..."
  sudo apt-get install -y fish > /dev/null
  check-exit
else
  echo "Fish is already installed"
fi

# Set Fish as shell
echo

if [ "$SHELL" != "/usr/bin/fish" ]; then
  echo "Enter your password to change your login shell to Fish"
  chsh -s /usr/bin/fish
  check-exit
else
  echo "Fish is already your login shell"
fi

# Run the rest of the setup in Fish
./setup.fish

