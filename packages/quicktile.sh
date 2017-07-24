#!/usr/bin/env bash

# Install quicktile.
CW=${PWD}

# Install some dependencies.
sudo apt-get install -y python python-gtk2 python-xlib python-dbus python-wnck

cp ./.config/quicktile.cfg ${HOME}/.config/

mkdir -p ${HOME}/.local/opt
cd ${HOME}/.local/opt

mkdir -p ${HOME}/.local/lib/python2.7/site-packages
mkdir -p ${HOME}/.local/lib/python2.7/dist-packages

git clone git://github.com/ssokolow/quicktile
cd quicktile

sudo ./setup.py install --prefix=${HOME}/.local

cd ${CW}
