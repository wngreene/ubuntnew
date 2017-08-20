#!/usr/bin/env bash

# Backup files to remote destination. Will only copy files one direction, from
# SOURCE to REMOTE.

OPTIONS=-avhP
SOURCE_ROOT=/home/wng
REMOTE_ROOT=${1-/media/wng/wng4tbraid1}

if mount | grep "on $REMOTE_ROOT type" > /dev/null
then
  # NOTE THE TRAILING SLASH!
  rsync $OPTIONS $SOURCE_ROOT/Documents/ $REMOTE_ROOT/Documents/
  # rsync $OPTIONS $SOURCE_ROOT/Downloads/ $REMOTE_ROOT/Downloads/
  # rsync $OPTIONS $SOURCE_ROOT/Music/ $REMOTE_ROOT/Music/
  # rsync $OPTIONS $SOURCE_ROOT/Pictures/ $REMOTE_ROOT/Pictures/
  # rsync $OPTIONS $SOURCE_ROOT/Videos/ $REMOTE_ROOT/Videos/
else
    echo "Remote root $REMOTE_ROOT is not mounted!"
fi
