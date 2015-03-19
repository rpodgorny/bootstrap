#!/bin/sh
set -e
set -x

if [ -d /cygdrive/c/faddnsc ]; then
	echo 'faddnsc already installed?'
	exit 1
fi

/cygdrive/c/atxpkg/atxpkg install faddnsc --yes

cd /cygdrive/c/faddnsc

mj=`ls /cygdrive/c/atx300 | grep mj`
if [ "$mj" ]; then
	sed -i "s/example.com/asterix.cz/g" faddnsc.ini
	sed -i "s/;Host=.*/Host=$mj/g" faddnsc.ini
else
	echo
	echo "!!! NENASEL JSEM CISLO MJ, SPUSTIM EDITOR PRO RUCNI EDITACI. POKRACUJTE ENTEREM !!!"
	read

	nano -w faddnsc.ini
fi

# TODO: add check for sensible setting of Host=
cat faddnsc.ini
./install_service.bat
cd -

net start faddnsc

schtasks /delete /tn "nsupdate" /f || true
schtasks /delete /tn "ns update" /f || true
schtasks /delete /tn "faddns" /f || true
schtasks /delete /tn "faddnsc" /f || true

echo "Po skonceni restartujte pocitac, bezi pravdepodobne dva procesy. Nutno minulou instanci odinstalovat"
