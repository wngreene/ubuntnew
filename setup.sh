#!/bin/bash

# Setup a new Ubuntu machine. Needs to be run from the checkout directory.

# Update the system.
sudo apt-get update
sudo apt-get upgrade

# Add environment script to HOME/.local.
sudo cp env.sh ${HOME}/.local/env.sh

# Shell stuff.
sudo apt-get install -y zsh
chsh -s $(which zsh)
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp zshrc ${HOME}/.zshrc

sudo apt-get install -y terminator
cp -r config/terminator ${HOME}/.config/terminator

# Installing some essential tools.
echo "Installing some essential tools..."
sudo apt-get install -y deja-dup
sudo apt-get install -y gnome-disk-utility
sudo apt-get install -y gparted
sudo apt-get install -y usb-creator-gtk
sudo apt-get install -y git gitk subversion
sudo apt-get install -y keepassx
sudo apt-get install -y rsync grsync unison unison-gtk
sudo apt-get install -y trash-cli

# Install emacs.
./setup_emacs.sh




# quicktile for window tiling.
sudo apt-get install -y python python-gtk2 python-xlib python-dbus python-wnck
mkdir $HOME/git
cd $HOME/git
git clone git://github.com/ssokolow/quicktile
cd quicktile
sudo ./setup.py install
cd $HOME

# DockBarX.
sudo add-apt-repository ppa:dockbar-main/ppa
sudo apt-get update
sudo apt-get install xfce4-dockbarx-plugin

# Other tools.
echo "Installing misc. tools..."
sudo apt-get install build-essential
sudo apt-get install openjdk-7-jdk 
sudo apt-get install linux-headers-generic
sudo apt-get install terminator
sudo apt-get install gnome-system-monitor
sudo apt-get install libreoffice
sudo apt-get install vlc xubuntu-restricted-extras libavcodec-extra
sudo apt-get install okular
sudo apt-get install banshee
sudo apt-get install transmision
sudo apt-get install cmake cmake-curses-gui
sudo apt-get install libhdf5-dev hdf5-tools hdf5-helpers h5utils
sudo apt-get install liblz4-dev
sudo apt-get install openssh-client openssh-server
# Install eigen.

# Install web stuff.
echo "Installing web stuff..."
sudo apt-get install chromium-browser
sudo apt-get install pepperflashplugin-nonfree # Flash for chromium.
sudo apt-get install flashplugin-installer # Flash for firefox.
sudo apt-get install icedtea-plugin # Java plugin.
# Install quicktime plugin.
# Sync chromium and firefox.
# Import certificates.

# Set static IP and namespaces (/etc/hosts).

# Latex stuff.
echo "Installing LaTeX stuff..."
sudo apt-get install texlive

# Python stuff.
echo "Installing Python stuff..."
sudo apt-get install python-pip
sudo pip install virtualenv
sudo pip install virtualenvwrapper
sudo apt-get install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
sudo pip install visvis
# mayavi?

# Install nvidia drivers.
sudo add-apt-repository -y ppa:xorg-edgers/ppa
sudo apt-get update
sudo apt-get install nvidia-340 nvidia-settings

# Install OpenGL.
sudo apt-get install xorg-dev libglw1-mesa-dev libgl1-mesa-dev libglu1-mesa-dev mesa-common-dev mesa-utils freeglut3-dev libglew-dev

# Install boost.
sudo apt-get install libboost-all-dev 

# Install skype.
# Install dropbox.

# Install grive.
sudo add-apt-repository ppa:thefanclub/grive-tools
sudo apt-get update
sudo apt-get install grive-tools

# Install PyOpenGL.
sudo pip install PyOpenGL PyOpenGL_accelerate

# Install GLFW.
cd $HOME/git
git clone https://github.com/glfw/glfw.git
cd glfw
mkdir build
cd build
cmake ..
#cmake -DBUILD_SHARED_LIBS=ON ..
sudo make install
cd ~

# Install PyGLFW.
cd $HOME/git
git clone https://github.com/rougier/pyglfw.git

# Create install script.
cd pyglfw
echo "
from distutils.core import setup 
setup(name='glfw', 
      version='3.0.1', 
      py_modules=['glfw'],
      )
" > setup.py
python setup.py sdist
cd dist
tar -xzf glfw-3.0.1.tar.gz
cd glfw-3.0.1/
sudo python setup.py install

# Install CUDA.
# Install PyCUDA.
# Install OpenCL.
# Install PyOpenCL.

# Install OpenCV.
