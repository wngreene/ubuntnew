#!/bin/bash

# Install emacs.

CW=PWD

VERSION=24.4

mkdir -p ${HOME}/.local/opt
cd ${HOME}/.local/opt

wget http://mirror.team-cymru.org/gnu/emacs/emacs-${VERSION}.tar.gz
mkdir -p emacs-${VERSION}
cd emacs-${VERSION}

tar -xvf ../emacs-${VERSION}.tar.gz

sudo apt-get install -y build-essential
sudo apt-get build-dep -y emacs24
./configure --prefix=${HOME}/.local
make
make install

# Checkout my emacs.d.
cd
rm -rf .emacs*
git clone --recursive https://github.com/wngreene/emacs.d.git .emacs.d

cd ${CW}
