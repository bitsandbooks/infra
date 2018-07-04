#!/bin/bash

VMNAME='vm-machine'
VMDOMAIN='domain.dev'
VMUSER='vagrant'
VMGROUP='vagrant'

# If `~vagrant/.ssh/id_rsa` doesn't already exist, generate
# a new SSH key for the VM...
if [ ! -f "/home/$VMUSER/.ssh/id_rsa" ]; then
  /usr/bin/ssh-keygen -t rsa -N "" -f /home/$VMUSER/.ssh/id_rsa
fi
# ...then copy the public and private keys to the ansible folder.
/bin/cp /home/$VMUSER/.ssh/id_rsa /srv/ansible/keys/$VMNAME_rsa
/bin/cp /home/$VMUSER/.ssh/id_rsa.pub /srv/ansible/keys/$VMNAME_rsa.pub

# Turn off Strict Host Key Checking and don't bother with a
# Known Hosts file.
/bin/cat << 'SSHEOF' > /home/$VMUSER/.ssh/config
Host *
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
SSHEOF

# Set up a basic `/etc/hosts` file.
/bin/cat << EOF >> /etc/hosts
127.0.0.1   localhost
::1         localhost ip6-localhost ip6-loopback
ff02::1     ip6-allnodes
ff02::2     ip6-allrouters
127.0.1.1   $VMNAME.$VMDOMAIN $VMNAME
EOF

# For some reason, ubuntu's vagrant boxes don't include these two groups
# by default. What's up with that?
/usr/sbin/groupadd lpadmin
/usr/sbin/groupadd sambashare

/bin/chown -R $VMUSER:$VMGROUP /home/$VMUSER/.ssh/
/usr/bin/apt-get -qq update
