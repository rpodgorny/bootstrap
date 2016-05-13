#!/bin/sh
set -e -x

if [ -L /cygdrive/c/atx300/comm/cs ]; then
	echo 'already a symlink?'
	exit 0
fi

if [ -L /cygdrive/c/atx300/comm/sk ]; then
	echo 'already a symlink?'
	exit 0
fi

if [ -d /cygdrive/c/atx300/comm/cs ]; then
	cd /cygdrive/c/atx300/comm/cs
	mv -v * ..
	cd ..
	rmdir cs
fi

if [ -d /cygdrive/c/atx300/comm/sk ]; then
	cd /cygdrive/c/atx300/comm/sk
	mv -v * ..
	cd ..
	rmdir sk
fi

# we may be needing this for xp
wget --no-check-certificate https://rawgit.com/rpodgorny/bootstrap/master/mklink.exe
./mklink.exe /j cs .
./mklink.exe /j sk .
rm mklink.exe

# mklink is a subcommand of cmd - wtf???
#echo 'mklink /j cs .' | cmd
#echo 'mklink /j sk .' | cmd

