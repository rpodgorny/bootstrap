#!/bin/sh
set -e -x

fns=( \
  '/cygdrive/c/atx300/set/base/base.ini' \
  '/cygdrive/c/atx300/set/parameters/parameters.ini' \
  '/cygdrive/c/atx300/set/settings/settings.ini' \
  '/cygdrive/c/atx300/set/settings/tuning.ini' \
  '/cygdrive/c/atx300/set/settings/tuning.ctr' \
  '/cygdrive/c/atx300/set/settings/tuning.ior' \
  '/cygdrive/c/atx300/set/settings/tuning.sim' \
  '/cygdrive/c/atx300/comm/cs/material/material.ini' \
  '/cygdrive/c/atx300/comm/cs/placemnt/placemnt.ini' \
  '/cygdrive/c/atx300/comm/sk/material/material.ini' \
  '/cygdrive/c/atx300/comm/sk/placemnt/placemnt.ini' \
  '/cygdrive/c/atx300/lingual/data/language.ini' \
)

for fn in ${fns[*]}; do
  cp -rv ${fn} ${fn}_ || true
done

/cygdrive/c/atxpkg/atxpkg update atx300-base --yes --force

for fn in ${fns[*]}; do
  cp -rv ${fn}_ ${fn} || true
  rm -f ${fn}_
done
