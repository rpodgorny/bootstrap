#!/bin/sh
set -e -x

sc failure "sshd" actions= restart/600000/restart/600000/restart/600000 reset= 86400
