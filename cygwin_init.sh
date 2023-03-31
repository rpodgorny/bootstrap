#!/bin/sh
set -e -x

if [ ! -d c:/cygwin ]; then
	echo "no cygwin?"
	exit 1
fi

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

sc failure "cygsshd" actions= restart/600000/restart/600000/restart/600000 reset= 86400

net stop cygsshd || true
net start cygsshd

netsh advfirewall firewall delete rule name=all protocol=tcp localport=22 || true
netsh advfirewall firewall add rule name=ssh protocol=tcp localport=22 dir=in action=allow
