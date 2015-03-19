#!/bin/sh

set -e
set -x

wget http://rawgit.com/rpodgorny/bootstrap/master/4_incoming_setup.sh
chmod a+x 4_incoming_setup.sh
./4_incoming_setup.sh
