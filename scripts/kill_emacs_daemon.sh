#!/usr/bin/bash

# Kill the emacs daemon.
emacsclient -e "(save-buffers-kill-emacs)"
