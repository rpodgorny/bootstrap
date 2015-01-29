#!/bin/sh
set -e
set -x

if [ -d /cygdrive/c/4to6utils ]; then
	echo '4to6utils already installed?'
	exit 1
fi

schtasks /delete /tn "4to6server" /f || true
schtasks /delete /tn "ipv6listen" /f || true

atxpkg install 4to6utils

cd c:/4to6utils
./install_service.bat
cd -

net start 4to6server

echo "Po skonceni restartujte pocitac, bezi pravdepodobne dva procesy, ale nemuzeme ho vypnout, protoze bychom se odpojili. Nutno minulou instanci odinstalovat"
