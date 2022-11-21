#!/bin/bash

CWD=$(pwd)
# First we figure out the UID owner of the current directory
OWNER_UID=$(stat -c "%u" $CWD)
# Now we create a user with that UID
useradd -u $OWNER_UID -o -m watcom_user

# Now we run whatever command we want as that user
sudo -E -u watcom_user "PATH=$PATH" "$@"
