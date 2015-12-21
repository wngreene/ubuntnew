#!/bin/bash

# Install PyGLFW.
CW=PWD

mkdir ${HOME}/.local/opt
cd ${HOME}/.local/opt

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
python setup.py install --prefix=${HOME}/.local

cd ${CW}
