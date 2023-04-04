#!/bin/sh
set -e -x

if [ -d c:/faddnsc ]; then
  echo 'faddnsc already installed?'
  exit 0
fi

c:/atxpkg/atxpkg.exe install faddnsc --yes

cd c:/faddnsc

# the cat is there only to eat the possible error when grep finds nothing
mj=`ls c:/atx300 | grep mj | cat`
if [ "${mj}" ]; then
  sed -i "s/example.com/asterix.cz/g" faddnsc.ini
  sed -i "s/;Host=.*/Host=${mj}/g" faddnsc.ini
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

sc failure "faddnsc" actions= restart/600000/restart/600000/restart/600000 reset= 86400

net start faddnsc

if [ -d c:/cygwin ]; then
  schtasks /delete /tn "nsupdate" /f || true
  schtasks /delete /tn "ns update" /f || true
  schtasks /delete /tn "faddns" /f || true
  schtasks /delete /tn "faddnsc" /f || true
else
  # msys2
  schtasks //delete //tn "nsupdate" //f || true
  schtasks //delete //tn "ns update" //f || true
  schtasks //delete //tn "faddns" //f || true
  schtasks //delete //tn "faddnsc" //f || true
fi

echo "Po skonceni restartujte pocitac, bezi pravdepodobne dva procesy. Nutno minulou instanci odinstalovat"
