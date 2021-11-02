#!/bin/sh
set -e -x
net start w32time || true
w32tm /config /manualpeerlist:"10.32.32.44" /syncfromflags:manual /reliable:yes /update
# give it some time to stop the service (why does it even stop it?)
sleep 5
# the above command sometimes stops the service - start it again just to be sure
net start w32time || true
# also, force the resync just to be sure (sometimes this actaully updates the time)
w32tm /resync
date
