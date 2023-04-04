#!/bin/sh
set -e -x

# TODO: find out the actual name of directory
if [ -d c:/Program\ Files/TightVNC ]; then
  echo 'tightvnc already installed?'
  exit 1
fi

# vzdy aktualni verze na: https://www.tightvnc.com/download.html

VER="2.8.78"
MSI="tightvnc-${VER}-gpl-setup-64bit.msi"
URL="https://www.tightvnc.com/download/${VER}/${MSI}"

wget -c --tries=10 ${URL}

# https://www.tightvnc.com/doc/win/TightVNC_2.7_for_Windows_Installing_from_MSI_Packages.pdf
if [ -d c:/cygwin ]; then
  msiexec /i ${MSI} /quiet /norestart \
    ADDLOCAL="Server,Viewer" \
    SET_ACCEPTHTTPCONNECTIONS=1 VALUE_OF_ACCEPTHTTPCONNECTIONS=0 \
    SET_ALLOWLOOPBACK=1 VALUE_OF_ALLOWLOOPBACK=1 \
    SET_USEVNCAUTHENTICATION=1 \
    VALUE_OF_USEVNCAUTHENTICATION=1 \
    SET_PASSWORD=1 \
    VALUE_OF_PASSWORD=atx438c \
    SET_VIEWONLYPASSWORD=1 \
    VALUE_OF_VIEWONLYPASSWORD=atx438w
else
  # msys2
  msiexec //i ${MSI} //quiet //norestart \
    ADDLOCAL="Server,Viewer" \
    SET_ACCEPTHTTPCONNECTIONS=1 VALUE_OF_ACCEPTHTTPCONNECTIONS=0 \
    SET_ALLOWLOOPBACK=1 VALUE_OF_ALLOWLOOPBACK=1 \
    SET_USEVNCAUTHENTICATION=1 \
    VALUE_OF_USEVNCAUTHENTICATION=1 \
    SET_PASSWORD=1 \
    VALUE_OF_PASSWORD=atx438c \
    SET_VIEWONLYPASSWORD=1 \
    VALUE_OF_VIEWONLYPASSWORD=atx438w
fi

rm ${MSI}

sc config tvnserver start= auto
sc failure "tvnserver" actions= restart/600000/restart/600000/restart/600000 reset= 86400

net stop tvnserver || true
net start tvnserver
