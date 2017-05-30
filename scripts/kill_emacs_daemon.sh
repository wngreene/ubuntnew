#!/usr/bin/env bash

# Kill the emacs daemon.
emacsclient -e "(save-buffers-kill-emacs)"
