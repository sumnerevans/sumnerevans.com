#! /bin/sh
set -e

# Dependencies
apk update && apk upgrade && apk add openssh rsync

# Known Hosts
mkdir -p ${HOME}/.ssh
chmod 700 ${HOME}/.ssh
echo "$SSH_KNOWN_HOSTS" > ${HOME}/.ssh/known_hosts
chmod 644 ${HOME}/.ssh/known_hosts
