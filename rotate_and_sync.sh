#!/bin/sh
set -e -x
touch /cygdrive/c/atx300/signalsrecorder/rotate
touch /cygdrive/c/atx300/management/sync
tail -n 0 -f /cygdrive/c/atx300/log/management.log | grep -m 1 "sync success"
