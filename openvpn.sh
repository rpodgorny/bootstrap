#!/bin/sh
set -e -x

if [ -d c:/Program\ Files/OpenVPN ]; then
  echo 'openvpn already installed? uninstall first? [y/n]'
  read YESNO
  if [ "${YESNO}" = "y" ]; then
    PROD=`wmic product get name | grep OpenVPN`
    wmic product where name="'${PROD}'" call uninstall
  fi
  exit 0
fi

# vzdy aktualni verze na: https://openvpn.net/index.php/open-source/downloads.html

MSI="OpenVPN-2.5.8-I604-amd64.msi"
URL="https://swupdate.openvpn.org/community/releases/${MSI}"

wget -c --tries=10 ${URL}

# https://community.openvpn.net/openvpn/wiki/OpenVPN2.5_Windows_MSI_Unattended_Install
if [ -d c:/cygwin ]; then
  msiexec /i ${MSI} ADDLOCAL=OpenVPN.GUI,OpenVPN.GUI.OnLogon,OpenVPN.Service,OpenVPN,Drivers,Drivers.TAPWindows6,Drivers.Wintun /passive
else
  # msys2
  msiexec //i ${MSI} ADDLOCAL=OpenVPN.GUI,OpenVPN.GUI.OnLogon,OpenVPN.Service,OpenVPN,Drivers,Drivers.TAPWindows6,Drivers.Wintun //passive
fi

rm ${MSI}

rm -f c:/Users/Public/Desktop/OpenVPN*lnk || true

IFACE=`c:/Program\ Files/OpenVPN/bin/openvpn.exe --show-adapters | tail -n 1 | cut -f 2 -d"'"`
netsh interface set interface "$IFACE" newname = "asterix_openvpn"

c:/atxpkg/atxpkg install openvpn-asterix --yes

sc config OpenVPNService start= auto
sc failure "OpenVPNService" actions= restart/600000/restart/600000/restart/600000 reset= 86400

net stop OpenVPNService || true
net start OpenVPNService

echo
echo '!!! CEKAM 10s !!!'
sleep 10

echo
echo '!!! ZKONTROLUJ ADRESU !!!'
netsh int ip show addresses asterix_openvpn
netsh int ipv6 show addresses asterix_openvpn

if [ -d c:/cygwin ]; then
  schtasks /delete /tn "OpenVPN" /f || true
else
  # msys2
  schtasks //delete //tn "OpenVPN" //f || true
fi
