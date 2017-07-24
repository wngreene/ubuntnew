#!/usr/bin/env bash

# Start the dropbox daemon.
HOME="$HOME/.dropbox-mit"
#/home/$USER/.dropbox-dist/dropboxd
dbus-launch /usr/bin/dropbox start -i
