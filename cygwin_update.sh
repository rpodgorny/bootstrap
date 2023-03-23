#!/bin/sh
set -e -x

wget -c --tries=10 http://cygwin.com/setup-x86_64.exe

#http://ftp.fsn.hu/pub/cygwin

chmod a+x setup-x86_64.exe
./setup-x86_64.exe -q -D -L -s http://ftp.acc.umu.se/mirror/cygwin -l c:/cygwin/tmp/ --upgrade-also --no-shortcuts -P curl

rm setup-x86_64.exe

net stop sshd || true
net start sshd
