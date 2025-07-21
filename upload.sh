#!/bin/bash

echo "$1"

#BUILD_SERVER_USER="build"
# BUILD_SERVER = "build.rgnets.com"
#BUILD_SERVER="x.x.x.x"
#BUILD_SERVER_PATH="/home/build/www/build/wlanpi/release/"
# BUILD_SERVER_PRIVATE_KEY =
#JUMP_HOST="user@host.com"
RSYNC_TARGET="$BUILD_SERVER_USER@$BUILD_SERVER:$BUILD_SERVER_PATH"


#ssh-keyscan -t rsa build.rgnets.com >> ~/.ssh/known_hosts

echo "Uploading $1 to $RSYNC_TARGET..."

rsync --verbose --stats -e "ssh -A -J $JUMP_SERVER_USER@$JUMP_SERVER" -Lpt "$1" "$RSYNC_TARGET"
