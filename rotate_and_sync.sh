#!/bin/sh
set -e -x
touch c:/atx300/signalsrecorder/rotate
touch c:/atx300/management/sync
tail -n 0 -f c:/atx300/log/management.log | grep -m 1 "sync success"
