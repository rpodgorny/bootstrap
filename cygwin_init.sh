#!/bin/sh
set -e
set -x

if [ ! -f /etc/passwd ]; then
	mkpasswd -l >/etc/passwd
fi

if [ ! -f /etc/group ]; then
	mkgroup -l >/etc/group
fi

ssh-host-config --yes --user cyg_server --pwd atx
net start sshd
