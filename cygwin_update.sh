#!/bin/sh
set -e
set -x

wget -c http://cygwin.com/setup-x86.exe

#http://ftp.fsn.hu/pub/cygwin

./setup-x86.exe -s http://mirror.switch.ch/ftp/mirror/cygwin -l c:/tmp/ -q -g
