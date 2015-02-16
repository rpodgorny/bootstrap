#!/bin/sh
set -e
set -x

wget -c http://cygwin.com/setup-x86.exe

#http://ftp.fsn.hu/pub/cygwin

chmod a+x setup-x86.exe
./setup-x86.exe -s http://mirror.switch.ch/ftp/mirror/cygwin -l c:/cygwin/tmp/ -D -q -g --no-desktop
