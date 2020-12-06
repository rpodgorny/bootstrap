#!/bin/sh
set -e -x
net start w32time || true
w32tm /config /manualpeerlist:"10.32.32.44" /syncfromflags:manual /reliable:yes /update
# the above command sometimes stops the service - start it again just to be sure
net start w32time || true
w32tm /resync
date
