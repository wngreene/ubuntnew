#!/usr/bin/env bash

# Backup files to remote destination. Will only copy files one direction, from
# SOURCE to REMOTE.

OPTIONS=-avhP
SOURCE_ROOT=/home/wng
REMOTE_ROOT=${1-/media/wng/wng4tbraid1}
LOG_FILE=$REMOTE_ROOT/backup.log

if mount | grep "on $REMOTE_ROOT type" > /dev/null; then
  # Create a backup log. Note the single >, which will erase the previous log.
  echo -e "Starting backup...\n" > $LOG_FILE

  # NOTE THE TRAILING SLASH!
  rsync $OPTIONS $SOURCE_ROOT/Documents/ $REMOTE_ROOT/Documents/ >> $LOG_FILE
  rsync $OPTIONS $SOURCE_ROOT/Downloads/ $REMOTE_ROOT/Downloads/ >> $LOG_FILE
  rsync $OPTIONS $SOURCE_ROOT/Music/ $REMOTE_ROOT/Music/ >> $LOG_FILE
  rsync $OPTIONS $SOURCE_ROOT/Pictures/ $REMOTE_ROOT/Pictures/ >> $LOG_FILE
  rsync $OPTIONS $SOURCE_ROOT/Videos/ $REMOTE_ROOT/Videos/ >> $LOG_FILE

  echo -e "\n" >> $LOG_FILE
  echo -e "Backup completed on:" >> $LOG_FILE
  date "+%Y.%m.%d - %H:%M:%S" >> $LOG_FILE
else
    echo "Remote root $REMOTE_ROOT is not mounted!"
fi
