#!/bin/sh
set -e
set -x

# vzdy aktualni verze na (stahuj verzi pro xp): https://openvpn.net/index.php/open-source/downloads.html
wget http://swupdate.openvpn.org/community/releases/openvpn-install-2.3.6-I002-x86_64.exe

echo 'ted to asi vyblije hlasku o duveryhodnosti - potvrd to!'
./openvpn-install-2.3.6-I002-x86_64.exe /S

rm -f /cygdrive/c/Users/Public/Desktop/OpenVPN*lnk || true

echo 'prejmenuj adapter na asterix_openvpn'
read

atxpkg install --yes openvpn-asterix

sc config OpenVPNService start= auto
net start OpenVPNService

echo 'zkontroluj adresu'
netsh int ip show addresses

schtasks /delete /tn "OpenVPN" /f || true
