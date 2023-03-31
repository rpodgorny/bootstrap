#!/bin/sh
set -e -x

net start w32time || true
w32tm /resync || true  # this fails on msys2
w32tm //resync || true  # this fails on cygwin
