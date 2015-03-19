#!/bin/sh
set -e
set -x

if [ ! -f /etc/sshd_config ]; then
	ssh-host-config --yes --pwd atx
fi

if [ grep "^AllowUsers remoteadmin remotebackup" /etc/sshd_config ]; then
	sed -e "s/^AllowUsers.*/AllowUsers remoteadmin remotebackup/g" -i /etc/sshd_config
fi

net stop sshd
net start sshd
