#!/bin/bash

# Install GLFW.
CW=PWD

mkdir ${HOME}/.local/opt
cd ${HOME}/.local/opt

git clone https://github.com/glfw/glfw.git
cd glfw
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${HOME}/.local ..
#cmake -DBUILD_SHARED_LIBS=ON ..
make install

cd ${CW}

