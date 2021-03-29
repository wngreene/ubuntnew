#!/usr/bin/env bash

# Setup a new Ubuntu machine. Needs to be run from the checkout directory.

# Update the system.
sudo apt-get update
sudo apt-get upgrade

# Add environment script to HOME/.local.
sudo cp scripts/env.sh ${HOME}/.local/env.sh
source ${HOME}/.local/env.sh

# Create a local opt directory.
mkdir -p ${HOME}/.local/bin
mkdir -p ${HOME}/.local/opt

# Install terminator.
sudo apt-get install -y terminator

# Copy config files.
cp -r .config/* ${HOME}/.config/

# Installing some essential tools.
echo "Installing some essential tools..."
# sudo apt-get install -y deja-dup
sudo apt-get install -y gnome-disk-utility
sudo apt-get install -y gparted
sudo apt-get install -y usb-creator-gtk
sudo apt-get install -y git gitk subversion
sudo apt-get install -y keepassxc
sudo apt-get install -y trash-cli
sudo apt-get install -y git
sudo apt-get install -y htop
sudo apt-get install -y silversearcher-ag

# Other tools.
echo "Installing misc. tools..."
sudo apt-get install -y build-essential
sudo apt-get install -y linux-headers-generic
sudo apt-get install -y gnome-system-monitor
sudo apt-get install -y cmake cmake-curses-gui
sudo apt-get install -y openssh-client openssh-server
#sudo apt-get install -y synergy
sudo apt-get install -y geeqie

# Load monitor.
sudo apt-get install -y indicator-multiload

# Install other packages.
./packages/quicktile.sh

# Shell stuff.
sudo apt-get install -y zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp .zshrc ${HOME}/.zshrc

# To switch default shell to zsh, execute:
# chsh -s $(which zsh)
