#!/bin/sh
set -e -x

REPO="http://raw.githubusercontent.com/rpodgorny/bootstrap/master"

rm -f timesync.sh
wget --no-check-certificate ${REPO}/timesync.sh
chmod a+x timesync.sh
./timesync.sh
rm timesync.sh

rm -f cygwin_init.sh
wget --no-check-certificate ${REPO}/cygwin_init.sh
chmod a+x cygwin_init.sh
./cygwin_init.sh
rm cygwin_init.sh

rm -f tightvnc.sh
wget --no-check-certificate ${REPO}/tightvnc.sh
chmod a+x tightvnc.sh
./tightvnc.sh
rm tightvnc.sh

rm -f atxpkg.sh
wget --no-check-certificate ${REPO}/atxpkg.sh
chmod a+x atxpkg.sh
./atxpkg.sh
rm atxpkg.sh

# this depends on atxpkg
rm -f openvpn.sh
wget --no-check-certificate ${REPO}/openvpn.sh
chmod a+x openvpn.sh
./openvpn.sh
rm openvpn.sh

rm -f other.sh
wget --no-check-certificate ${REPO}/other.sh
chmod a+x other.sh
./other.sh
rm other.sh

rm -f 4to6utils.sh
wget --no-check-certificate ${REPO}/4to6utils.sh
chmod a+x 4to6utils.sh
./4to6utils.sh
rm 4to6utils.sh

rm -f faddnsc.sh
wget --no-check-certificate ${REPO}/faddnsc.sh
chmod a+x faddnsc.sh
./faddnsc.sh
rm faddnsc.sh

#rm -f 4_incoming_setup.sh
#wget --no-check-certificate ${REPO}/4_incoming_setup.sh
#chmod a+x 4_incoming_setup.sh
#./4_incoming_setup.sh
#rm 4_incoming_setup.sh

#rm -f atx.sh
#wget --no-check-certificate ${REPO}/atx.sh
#chmod a+x other.sh
#./atx.sh
#rm atx.sh

