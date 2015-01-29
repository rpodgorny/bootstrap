#!/bin/sh
set -e
set -x

echo 'stahni verzi pro xp'
iexplore https://openvpn.net/index.php/open-source/downloads.html

echo 'hotovo?'
read

rm -f /cygdrive/c/Users/Public/Desktop/OpenVPN*lnk

echo 'prejmenuj adapter na asterix_openvpn'
read

echo 'nainstaluj config'
read

echo 'az to bude otravovat, zaskrtni "pro vsechny budouci site" a nastav sit v zamestnani'
./openvpn.sh

echo 'zkontroluj adresu'
netsh int ip show addresses
