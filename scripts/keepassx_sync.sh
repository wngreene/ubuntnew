#!/usr/bin/env bash

# Synchronizes keepassx files with remote. Uses the -e ssh option with rsync. In
# order to automate this process (i.e. not require a password for the remote),
# the public key of the local machine should be in the ~/.ssh/authorized_keys
# file of the remote.

# NOTE: -u is necessary for a proper sync! This option will skip files that are
# newer on the destination.
OPTIONS=-avhPu

USER=`whoami`
KEEPASSX=/home/$USER/Documents/KeePassX
REMOTE=${1}
LOG_FILE=$KEEPASSX/sync.log

# Create log file.
echo -e "Synchronized on:" > $LOG_FILE
date "+%Y.%m.%d - %H:%M:%S" >> $LOG_FILE

# Perform two-way copy. The -u option ensures that the newer file is propagated.
# NOTE: The trailing slash is required!
rsync $OPTIONS -e ssh $KEEPASSX/ $USER@$REMOTE:$KEEPASSX/
rsync $OPTIONS -e ssh $USER@$REMOTE:$KEEPASSX/ $KEEPASSX/
