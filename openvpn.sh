#!/bin/sh
set -e -x

if [ -d /cygdrive/c/Program\ Files/OpenVPN ]; then
  echo 'openvpn already installed?'
  exit 0
fi

# vzdy aktualni verze na (stahuj verzi pro xp): https://openvpn.net/index.php/open-source/downloads.html

# TODO: pak to musime opravit, protoze to nefunguje (pozor jeste na jiny driver pro win8)
#if [ "`uname -a | grep WOW64`" ]; then
EXE='openvpn-install-2.3.11-I001-x86_64.exe'
#else
#  EXE='openvpn-install-2.3.11-I001-i686.exe'
#fi

wget -c --tries=10 http://swupdate.openvpn.org/community/releases/$EXE

chmod a+x $EXE

echo
echo '!!! TED TO ASI VYBLIJE HLASKU O DUVERYHODNOSTI - POTVRD TO! !!!'
./$EXE /S

rm $EXE

rm -f /cygdrive/c/Users/Public/Desktop/OpenVPN*lnk || true

IFACE=`/cygdrive/c/Program\ Files/OpenVPN/bin/openvpn.exe --show-adapters | tail -n 1 | cut -f 2 -d"'"`
netsh interface set interface "$IFACE" newname = "asterix_openvpn"

/cygdrive/c/atxpkg/atxpkg install openvpn-asterix --yes

sc config OpenVPNService start= auto
sc failure "OpenVPNService" actions= restart/600000/restart/600000/restart/600000 reset= 86400

net start OpenVPNService

echo
echo '!!! CEKAM 10s !!!'
sleep 10

echo
echo '!!! ZKONTROLUJ ADRESU !!!'
netsh int ip show addresses asterix_openvpn
netsh int ipv6 show addresses asterix_openvpn

schtasks /delete /tn "OpenVPN" /f || true
