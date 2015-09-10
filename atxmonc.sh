#!/bin/sh
set -e -x

if [ -d /cygdrive/c/atxmonc ]; then
	echo 'atxmonc already installed?'
	exit 0
fi

/cygdrive/c/atxpkg/atxpkg install atxmonc --yes

cd /cygdrive/c/atxmonc

# the cat is there only to eat the possible error when grep finds nothing
mj=`ls /cygdrive/c/atx300 | grep mj | cat`
if [ "$mj" ]; then
	sed -i "s/example.com/asterix.cz/g" atxmonc.ini
	sed -i "s/;Host=.*/Host=$mj/g" atxmonc.ini
else
	echo
	echo "!!! NENASEL JSEM CISLO MJ, SPUSTIM EDITOR PRO RUCNI EDITACI. POKRACUJTE ENTEREM !!!"
	read

	nano -w atxmonc.ini
fi

# TODO: add check for sensible setting of Host=
cat atxmonc.ini
./install_service.bat
cd -

sc failure "atxmonc" actions= restart/600000/restart/600000/restart/600000 reset= 86400

net start atxmonc
