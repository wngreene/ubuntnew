#!/bin/bash

# Install quicktile.
CW=PWD

# Install some dependencies.
sudo apt-get install -y python python-gtk2 python-xlib python-dbus python-wnck

mkdir -p ${HOME}/.local/opt
cd ${HOME}/.local/opt

git clone git://github.com/ssokolow/quicktile
cd quicktile

./setup.py install --prefix=${HOME}/.local

cp ../config/quicktile.cfg ${HOME}/.config/

cd ${CW}
