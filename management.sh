#!/bin/sh
set -e
set -x

/cygdrive/c/atxpkg/atxpkg install management --yes --force

cd /cygdrive/c/atx300/management
./install_service.bat
cd -

taskkill /f /im management.exe || true

net start management

schtasks /delete /tn "management" /f || true