#! /bin/sh
set -e

# SSH KEY
eval $(ssh-agent -s)
echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null

# Send everything up to sumnerevans.com
rsync -vr --delete-after output/ root@sumnerevans.com:/usr/share/nginx/sites/sumnerevans.com