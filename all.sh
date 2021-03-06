#!/bin/sh
set -e -x

rm -f timesync.sh
wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/timesync.sh
chmod a+x timesync.sh
./timesync.sh
rm timesync.sh

rm -f cygwin_init.sh
wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/cygwin_init.sh
chmod a+x cygwin_init.sh
./cygwin_init.sh
rm cygwin_init.sh

rm -f atxpkg.sh
wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/atxpkg.sh
chmod a+x atxpkg.sh
./atxpkg.sh
rm atxpkg.sh

rm -f openvpn.sh
wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/openvpn.sh
chmod a+x openvpn.sh
./openvpn.sh
rm openvpn.sh

rm -f 4_incoming_setup.sh
wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/4_incoming_setup.sh
chmod a+x 4_incoming_setup.sh
./4_incoming_setup.sh
rm 4_incoming_setup.sh

rm -f other.sh
wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/other.sh
chmod a+x other.sh
./other.sh
rm other.sh

rm -f atx300.sh
wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/atx300.sh
chmod a+x atx300.sh
./atx300.sh
rm atx300.sh

rm -f fix_language_symlink.sh
wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/fix_language_symlink.sh
chmod a+x fix_language_symlink.sh
./fix_language_symlink.sh
rm fix_language_symlink.sh

rm -f management.sh
wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/management.sh
chmod a+x management.sh
./management.sh
rm management.sh

#rm -f archiver.sh
#wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/archiver.sh
#chmod a+x archiver.sh
#./archiver.sh
#rm archiver.sh

rm -f faddnsc.sh
wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/faddnsc.sh
chmod a+x faddnsc.sh
./faddnsc.sh
rm faddnsc.sh

rm -f atxmonc.sh
wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/atxmonc.sh
chmod a+x atxmonc.sh
./atxmonc.sh
rm atxmonc.sh

rm -f 4to6utils.sh
wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/4to6utils.sh
chmod a+x 4to6utils.sh
./4to6utils.sh
rm 4to6utils.sh
