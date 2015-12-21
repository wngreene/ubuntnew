#!/bin/bash

# Install skype
# Taken from: https://askubuntu.com/questions/488053/how-to-install-skype-4-3
CW=PWD

# Remove some deprecated stuff.
sudo apt-get remove -y skype skype-bin:i386 skype:i386
sudo apt-get install -y sni-qt:i386
rm -rf ~/.Skype

sudo dpkg --add-architecture i386
sudo apt-get update

sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo apt-get update
sudo apt-get install -y skype

cd ${CW}
