#!/bin/bash

echo "Running entrypoint.sh..."

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback
USER_ID=${LOCAL_USER_ID:-9001}
USER=docker
UPWD=Docker!

echo "Starting with USER: $USER and UID : $USER_ID"
usermod -u $USER_ID "$USER"
#useradd --shell /bin/bash -u  -o -c "docker user" -m "$USER"
export HOME=/home/$USER

# Add user to sudoers
echo "docker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/10-installer
# Add root password
echo "root":$UPWD | chpasswd
# Add user password
echo "$USER:$UPWD" | chpasswd

# Startup user
exec gosu "$USER" "$@"
