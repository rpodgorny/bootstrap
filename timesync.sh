#!/bin/sh
set -e
set -x

net start w32time || true
w32tm /resync
