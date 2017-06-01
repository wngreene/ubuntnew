#!/usr/bin/env bash

# Setup a new Ubuntu machine. Needs to be run from the checkout directory.

# Update the system.
sudo apt-get update
sudo apt-get upgrade

# Add environment script to HOME/.local.
sudo cp scripts/env.sh ${HOME}/.local/env.sh
source ${HOME}/.local/env.sh

# Create a local opt directory.
mkdir -p ${HOME}/.local/opt

# Setup i3wm.
sudo apt-get install -y i3 i3blocks feh xautolock lxappearance
cp -r .config/i3/config ${HOME}/.config/i3/config
cp scripts/i3blocksmemory.sh ${HOME}/.local/bin/

# Shell stuff.
sudo apt-get install -y zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp .zshrc ${HOME}/.zshrc

# To switch default shell to zsh, execute:
# chsh -s $(which zsh)

# sudo apt-get install -y terminator
# cp -r config/terminator ${HOME}/.config/terminator

# After installing, set theme and font in xfce4-terminal.
sudo apt-get install -y xfonts-terminus
mkdir -p ${HOME}/.local/share/xfce4/terminal/colorschemes
cp .config/monokai-dark.theme ${HOME}/.local/share/xfce4/terminal/colorschemes/
cp .config/xfce4/terminal/terminalrc ${HOME}/.config/xfce4/terminal/terminalrc

# Installing some essential tools.
echo "Installing some essential tools..."
# sudo apt-get install -y deja-dup
sudo apt-get install -y gnome-disk-utility
sudo apt-get install -y gparted
sudo apt-get install -y usb-creator-gtk
sudo apt-get install -y git gitk subversion
sudo apt-get install -y keepassx
sudo apt-get install -y rsync grsync #unison unison-gtk
sudo apt-get install -y trash-cli
sudo apt-get install -y git
sudo apt-get install -y htop
sudo apt-get install -y silversearcher-ag

# Other tools.
echo "Installing misc. tools..."
sudo apt-get install -y build-essential
sudo apt-get install -y openjdk-7-jdk 
sudo apt-get install -y linux-headers-generic
sudo apt-get install -y gnome-system-monitor
sudo apt-get install -y libreoffice
sudo apt-get install -y vlc xubuntu-restricted-extras libavcodec-extra
# sudo apt-get install -y okular
# sudo apt-get install -y banshee
sudo apt-get install -y transmision
sudo apt-get install -y cmake cmake-curses-gui
sudo apt-get install -y libhdf5-dev hdf5-tools hdf5-helpers h5utils
sudo apt-get install -y liblz4-dev
sudo apt-get install -y openssh-client openssh-server
sudo apt-get install -y synergy
sudo apt-get install -y geeqie

# Install web stuff.
echo "Installing web stuff..."
sudo apt-get install -y chromium-browser
sudo apt-get install -y pepperflashplugin-nonfree # Flash for chromium.
sudo apt-get install -y flashplugin-installer # Flash for firefox.
sudo apt-get install -y icedtea-plugin # Java plugin.

# Latex stuff.
echo "Installing LaTeX stuff..."
sudo apt-get install -y texlive

# Python stuff.
echo "Installing Python stuff..."
sudo apt-get install -y python-pip
sudo pip install virtualenv
sudo pip install virtualenvwrapper
sudo apt-get install -y python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
sudo pip install visvis
sudo pip install pylint cpplint
# mayavi?

# DockBarX.
sudo add-apt-repository ppa:dockbar-main/ppa
sudo apt-get update
sudo apt-get install -y xfce4-dockbarx-plugin

# Load monitor.
sudo add-apt-repository ppa:indicator-multiload/stable-daily
sudo apt-get update
sudo apt-get install indicator-multiload

# Install nvidia drivers.
sudo add-apt-repository -y ppa:xorg-edgers/ppa
sudo apt-get update
sudo apt-get install -y nvidia-375 nvidia-settings

# Install OpenGL.
sudo apt-get install -y xorg-dev libglw1-mesa-dev libgl1-mesa-dev libglu1-mesa-dev mesa-common-dev mesa-utils freeglut3-dev libglew-dev

# Install boost.
sudo apt-get install -y libboost-all-dev 

# Install grive.
# sudo add-apt-repository ppa:thefanclub/grive-tools
# sudo apt-get update
# sudo apt-get install -y grive-tools

# Install PyOpenGL.
# sudo pip install PyOpenGL PyOpenGL_accelerate

# Install some research stuff.
# sudo apt-get install -y libeigen3-dev
# sudo apt-get install -y libopencv-dev

# sudo add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl
# sudo apt-get update
# sudo apt-get install -y libpcl-all-dev

# Install other packages.
./packages/emacs.sh
./packages/dropbox.sh
./packages/skype.sh
# ./packages/quicktile.sh
./package/arc_theme.sh
./package/simplescreenrecorder.sh

# TODO:
# Sync chromium and firefox.
# Import certificates.

# Set static IP and namespaces (/etc/hosts).

# Install CUDA.
# Install OpenCL.
