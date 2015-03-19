#!/bin/sh
set -e
set -x

#if [ -d /cygdrive/c/atx300 ]; then
#  echo 'atx300 already installed?'
#  exit 1
#fi

rm -rf /cygdrive/c/atx300/mjxxx

mj=`ls /cygdrive/c/atx300 | grep mj`
if [ -z "$mj" ]; then
  echo
  echo "!!! ZADEJ JMENO BETONARNY (VCETNE MJ) !!! "
  read mj

  mkdir -p /cygdrive/c/atx300
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
