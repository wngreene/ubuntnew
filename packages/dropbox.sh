#!/usr/bin/env bash

# Install dropbox.
CW=${PWD}

sudo add-apt-repository ppa:xubuntu-dev/extras
sudo apt-get update

# # Add dropbox repository key.
# sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E

# # Add dropbox repository.
# sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"
# sudo apt-get update

# Install.
sudo apt-get install nautilus-dropbox thunar-dropbox-plugin

# Make MIT dropbox.
mkdir -p ${HOME}/.dropbox-mit
HOME=${HOME}/.dropbox-mit
dropbox start -i

# Copy start scripts to .local/bin.
cp ./scripts/start* /home/wng/.local/bin

cd ${CW}
