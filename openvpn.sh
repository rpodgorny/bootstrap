#!/bin/sh
set -e
set -x

if [ -d /cygdrive/c/Program\ Files/OpenVPN ]; then
  echo 'openvpn already installed?'
	exit 0
fi

# vzdy aktualni verze na (stahuj verzi pro xp): https://openvpn.net/index.php/open-source/downloads.html
wget http://swupdate.openvpn.org/community/releases/openvpn-install-2.3.6-I002-x86_64.exe

chmod a+x openvpn-install-2.3.6-I002-x86_64.exe

echo
echo '!!! TED TO ASI VYBLIJE HLASKU O DUVERYHODNOSTI - POTVRD TO! !!!'
./openvpn-install-2.3.6-I002-x86_64.exe /S

rm openvpn-install-2.3.6-I002-x86_64.exe

rm -f /cygdrive/c/Users/Public/Desktop/OpenVPN*lnk || true

IFACE=`/cygdrive/c/Program\ Files/OpenVPN/bin/openvpn.exe --show-adapters | tail -n 1 | cut -f 2 -d"'"`
netsh interface set interface "$IFACE" newname = "asterix_openvpn"

/cygdrive/c/atxpkg/atxpkg install openvpn-asterix --yes

sc config OpenVPNService start= auto
net start OpenVPNService

echo
echo '!!! CEKAM 10s !!!'
sleep 10

echo
echo '!!! ZKONTROLUJ ADRESU !!!'
netsh int ip show addresses asterix_openvpn
netsh int ipv6 show addresses asterix_openvpn

schtasks /delete /tn "OpenVPN" /f || true
