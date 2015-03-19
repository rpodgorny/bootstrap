#!/bin/sh
set -e
set -x

#if [ -d /cygdrive/c/atx300 ]; then
#  echo 'atx300 already installed?'
#  exit 1
#fi

rm -rf /cygdrive/c/atx300/mjxxx

mkdir -p /cygdrive/c/atx300

# the cat is there only to eat the possible error when grep finds nothing
mj=`ls /cygdrive/c/atx300 | grep mj | cat`
if [ -z "$mj" ]; then
  echo
  echo "!!! ZADEJ JMENO BETONARNY (VCETNE MJ) !!! "
  read mj

  touch /cygdrive/c/atx300/$mj
fi

/cygdrive/c/atxpkg/atxpkg install --yes \
atx300-base \
consist \
control \
loader \
manager \
memview \
moistures \
mpanel \
param \
place \
router \
signalsrecorder \
simulator \
visual \
visual-data
