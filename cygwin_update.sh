#!/bin/sh
set -e
set -x

wget -c http://cygwin.com/setup-x86.exe

#http://ftp.fsn.hu/pub/cygwin

chmod a+x setup-x86.exe
./setup-x86.exe -q -D -L -s http://mirror.switch.ch/ftp/mirror/cygwin -l c:/cygwin/tmp/ --upgrade-also --no-shortcuts

rm setup-x86.exe
