#!/bin/sh
set -e -x

if [ ! -f /etc/sshd_config ]; then
	# this is a hack to force ssh-host-config to follow the non-domain code path
	export LOGONSERVER=\\\\$COMPUTERNAME

	ssh-host-config --yes --pwd atx
fi

if ! grep "AllowUsers remoteadmin remotebackup" /etc/sshd_config; then
	echo "" >>/etc/sshd_config
	echo "AllowUsers remoteadmin remotebackup" >>/etc/sshd_config

	sed -e "s/^AllowUsers.*/AllowUsers remoteadmin remotebackup/g" -i /etc/sshd_config
fi

sc failure "sshd" actions= restart/600000/restart/600000/restart/600000 reset= 86400

net stop sshd || true
net start sshd
