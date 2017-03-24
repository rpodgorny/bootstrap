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

# no native support in xp so we need to download this
#wget -c --tries=10 --no-check-certificate https://rawgit.com/rpodgorny/bootstrap/master/mklink.exe -O /tmp/mklink.exe
wget -c --tries=10 --no-check-certificate http://admiral.podgorny.cz/~radek/mklink.exe -O /tmp/mklink.exe
chmod a+x /tmp/mklink.exe

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

# mklink is a subcommand of cmd - wtf???
#echo 'mklink /j cs .' | cmd
#echo 'mklink /j sk .' | cmd

cd /cygdrive/c/atx300/comm
/tmp/mklink.exe /j cs .
/tmp/mklink.exe /j sk .

rm /tmp/mklink.exe


