#!/bin/sh
set -e
set -x

if [ -d /cygdrive/c/4to6utils ]; then
  echo '4to6utils already installed?'
  exit 0
fi

/cygdrive/c/atxpkg/atxpkg install 4to6utils --yes

cd /cygdrive/c/4to6utils
./install_service.bat
cd -

net start 4to6server

schtasks /delete /tn "4to6server" /f || true
schtasks /delete /tn "ipv6listen" /f || true

echo "Po skonceni restartujte pocitac, bezi pravdepodobne dva procesy, ale nemuzeme ho vypnout, protoze bychom se odpojili. Nutno minulou instanci odinstalovat"
