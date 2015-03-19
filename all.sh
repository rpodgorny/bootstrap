#!/bin/sh
set -e
set -x

wget http://rawgit.com/rpodgorny/bootstrap/master/cygwin_init.sh
chmod a+x cygwin_init.sh
./cygwin_init.sh

wget http://rawgit.com/rpodgorny/bootstrap/master/4_incoming_setup.sh
chmod a+x 4_incoming_setup.sh
./4_incoming_setup.sh

wget http://rawgit.com/rpodgorny/bootstrap/master/atxpkg.sh
chmod a+x atxpkg.sh
./atxpkg.sh
