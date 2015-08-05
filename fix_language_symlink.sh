#!/bin/sh
set -e -x

if [ -L /cygdrive/c/atx300/comm/cs ]; then
	echo 'already a symlink?'
	exit 0
fi

cd /cygdrive/c/atx300/comm/cs
mv -v * ..
cd ..
# mklink is a subcommand of cmd - wtf???
echo 'mklink /d cs .' | cmd
