#!/bin/sh
set -e -x

net start w32time || true

if [ -d c:/cygwin ]; then
  w32tm /resync || true
else
  # msys2
  w32tm //resync || true
fi
