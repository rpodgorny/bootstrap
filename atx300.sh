#!/bin/sh
set -e
set -x

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
