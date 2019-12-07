#!/bin/sh
set -e -x
wget https://aka.ms/vs/16/release/vc_redist.x64.exe
chmod a+x vc_redist.x64.exe
./vc_redist.x64.exe /install /passive
rm vc_redist.x64.exe
