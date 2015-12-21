#!/bin/bash

VERSION=24.4

# Install emacs.
mkdir ${HOME}/.local/opt
cd ${HOME}/.local/opt

wget http://mirror.team-cymru.org/gnu/emacs/emacs-${VERSION}.tar.gz
mkdir emacs-${VERSION}
cd emacs-${VERSION}

tar -xvf ../emacs-${VERSION}.tar.gz

sudo apt-get install build-essential
sudo apt-get build-dep emacs24
./configure --prefix=${HOME}/.local
make
sudo make install
