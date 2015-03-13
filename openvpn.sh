#!/bin/sh
set -e
set -x

wget http://swupdate.openvpn.org/community/releases/openvpn-install-2.3.6-I002-x86_64.exe

./openvpn-install-2.3.6-I002-x86_64.exe /S

sc config OpenVPNService start= auto
net start OpenVPNService

schtasks /delete /tn "OpenVPN" /f
