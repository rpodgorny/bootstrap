#!/bin/sh
set -e
set -x

netsh int ipv6 isatap set state disabled
netsh int ipv6 6to4 set state disabled
netsh interface teredo set state disabled

# enable aaaa lookups even for non-native ipv6 connectivity
regtool -d add /HKLM/SYSTEM/CurrentControlSet/services/Dnscache/Parameters AddrConfigControl
regtool -d set /HKLM/SYSTEM/CurrentControlSet/services/Dnscache/Parameters/AddrConfigControl 0
