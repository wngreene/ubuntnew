#!/bin/bash

# Install quicktile.
CW=PWD

# Install some dependencies.
sudo apt-get install -y python python-gtk2 python-xlib python-dbus python-wnck

mkdir ${HOME}/.local/opt
cd ${HOME}/.local/opt

git clone git://github.com/ssokolow/quicktile
cd quicktile

./setup.py install --prefix=${HOME}/.local

cd ${CW}
