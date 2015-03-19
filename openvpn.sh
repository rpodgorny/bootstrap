#!/bin/sh
set -e
set -x

# vzdy aktualni verze na (stahuj verzi pro xp): https://openvpn.net/index.php/open-source/downloads.html
wget http://swupdate.openvpn.org/community/releases/openvpn-install-2.3.6-I002-x86_64.exe

echo
echo '!!! TED TO ASI VYBLIJE HLASKU O DUVERYHODNOSTI - POTVRD TO! !!!'
./openvpn-install-2.3.6-I002-x86_64.exe /S

rm -f /cygdrive/c/Users/Public/Desktop/OpenVPN*lnk || true

IFACE=`/cygdrive/c/Program\ Files/OpenVPN/bin/openvpn.exe --show-adapters | tail -n 1 | cut -f 2 -d"'"`
netsh interface set interface "$IFACE" newname = "asterix_openvpn"

/cygdrive/c/atxpkg/atxpkg install openvpn-asterix --yes

sc config OpenVPNService start= auto
net start OpenVPNService

echo
echo '!!! ZKONTROLUJ ADRESU !!!'
netsh int ip show addresses asterix_openvpn

schtasks /delete /tn "OpenVPN" /f || true
