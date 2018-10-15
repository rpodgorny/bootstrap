#!/bin/sh
set -e -x

net start w32time || true
w32tm /resync
