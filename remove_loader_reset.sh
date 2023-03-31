#!/bin/sh
set -e -x

# if you want to detect the shit: schtasks /query|grep loader

schtasks /delete /tn "reset loader" /f
