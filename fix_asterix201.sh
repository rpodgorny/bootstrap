#!/bin/sh
set -e
set -x

if [ ! -f /cygdrive/c/Program\ Files/OpenVPN/config/asterix201.ovpn ]; then
  echo 'asterix201.conf not found'
  exit 0
fi

IFACE=`/cygdrive/c/Program\ Files/OpenVPN/bin/openvpn.exe --show-adapters | tail -n 1 | cut -f 2 -d"'"`
netsh interface set interface "$IFACE" newname = "asterix_openvpn" || true

/cygdrive/c/atxpkg/atxpkg install openvpn-asterix --force --yes

rm -rf /cygdrive/c/Program\ Files/OpenVPN/config/asterix201*

sc config OpenVPNService start= auto
net start OpenVPNService || true

echo
echo '!!! CEKAM 10s !!!'
sleep 10

echo
echo '!!! ZKONTROLUJ ADRESU !!!'
netsh int ip show addresses asterix_openvpn
netsh int ipv6 show addresses asterix_openvpn

schtasks /delete /tn "OpenVPN" /f || true
