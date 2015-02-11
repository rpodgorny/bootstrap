#!/bin/sh
set -e
set -x

if [ -d /cygdrive/c/faddnsc ]; then
	echo 'faddnsc already installed?'
	exit 1
fi

schtasks /delete /tn "nsupdate" /f || true
schtasks /delete /tn "ns update" /f || true
schtasks /delete /tn "faddns" /f || true
schtasks /delete /tn "faddnsc" /f || true

atxpkg install faddnsc

cd c:/faddnsc
sed -i "s/example.com/asterix.cz/g" faddnsc.ini
mj=`ls c:/atx300 | grep mj`
test $mj
sed -i "s/;Host=.*/Host=$mj/g" faddnsc.ini
#nano -w faddnsc.ini
# TODO: add check for sensible setting of Host=
cat faddnsc.ini
./install_service.bat
cd -

net start faddnsc

echo "Po skonceni restartujte pocitac, bezi pravdepodobne dva procesy. Nutno minulou instanci odinstalovat"
