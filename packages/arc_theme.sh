#!/usr/bin/env bash

# Install arc-theme. After installing, use set using lxappearance.
wget -nv http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
sudo apt-get install -y arc-theme

rm Release.key
