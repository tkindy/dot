#!/bin/bash

# Check that the script is being run as a normal user
if [ "$EUID" -eq 0 ]; then
  echo "Please run as a normal user, not as root."
  exit
fi

# Upgrade packages
echo
echo "Upgrading packages..."
sudo apt-get update > /dev/null
sudo apt-get upgrade -y /dev/null

# Install Fish
echo
echo "Installing Fish..."
sudo apt-get install -y fish > /dev/null

# Set Fish as shell
echo
echo "Enter your password to change your login shell to Fish"
chsh -s /usr/bin/fish

