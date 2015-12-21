#!/bin/bash

# Start the dropbox daemon.
HOME="$HOME/.dropbox-mit"
#/home/$USER/.dropbox-dist/dropboxd
/usr/bin/dropbox start -i
