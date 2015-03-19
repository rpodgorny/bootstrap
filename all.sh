#!/bin/sh
set -e
set -x

wget http://rawgit.com/rpodgorny/bootstrap/master/cygwin_init.sh
chmod a+x cygwin_init.sh
./cygwin_init.sh
rm cygwin_init.sh

wget http://rawgit.com/rpodgorny/bootstrap/master/4_incoming_setup.sh
chmod a+x 4_incoming_setup.sh
./4_incoming_setup.sh
rm 4_incoming_setup.sh

wget http://rawgit.com/rpodgorny/bootstrap/master/timesync.sh
chmod a+x timesync.sh
./timesync.sh
rm timesync.sh

wget http://rawgit.com/rpodgorny/bootstrap/master/atxpkg.sh
chmod a+x atxpkg.sh
./atxpkg.sh
rm atxpkg.sh

wget http://rawgit.com/rpodgorny/bootstrap/master/openvpn.sh
chmod a+x openvpn.sh
./openvpn.sh
rm openvpn.sh

wget http://rawgit.com/rpodgorny/bootstrap/master/other.sh
chmod a+x other.sh
./other.sh
rm other.sh

wget http://rawgit.com/rpodgorny/bootstrap/master/faddnsc.sh
chmod a+x faddnsc.sh
./faddnsc.sh
rm faddnsc.sh

wget http://rawgit.com/rpodgorny/bootstrap/master/4to6utils.sh
chmod a+x 4to6utils.sh
./4to6utils.sh
rm 4to6utils.sh
