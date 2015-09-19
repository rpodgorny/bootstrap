#!/bin/sh
set -e -x

if [ $(/cygdrive/c/atxpkg/atxpkg list_installed | grep archiver) ]; then
  echo 'archiver already installed?'
  exit 0
fi

/cygdrive/c/atxpkg/atxpkg install archiver --yes

rm -rf /cygdrive/c/atx300/management/archiver*
