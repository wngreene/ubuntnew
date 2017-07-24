#!/usr/bin/env bash

# Install GLFW.
CW=${PWD}

mkdir -p ${HOME}/.local/opt
cd ${HOME}/.local/opt

git clone https://github.com/glfw/glfw.git
cd glfw
mkdir -p build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${HOME}/.local ..
#cmake -DBUILD_SHARED_LIBS=ON ..
make install

cd ${CW}

