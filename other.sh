#!/bin/sh
set -e
set -x

# disable non-native ipv6 shit
netsh interface ipv6 isatap set state disabled
netsh interface ipv6 6to4 set state disabled
netsh interface teredo set state disabled || true

# disable privacy extensions
netsh interface ipv6 set privacy state=disabled store=active
netsh interface ipv6 set privacy state=disabled store=persistent

# enable aaaa lookups even for non-native ipv6 connectivity
regtool -d add /HKLM/SYSTEM/CurrentControlSet/services/Dnscache/Parameters AddrConfigControl
regtool -d set /HKLM/SYSTEM/CurrentControlSet/services/Dnscache/Parameters/AddrConfigControl 0

# adjust firewall
#netsh advfirewall reset

netsh advfirewall firewall delete rule name=all protocol=icmpv4 || true
netsh advfirewall firewall add rule name=icmpv4 protocol=icmpv4:any,any dir=in action=allow
netsh advfirewall firewall delete rule name=all protocol=icmpv6 || true
netsh advfirewall firewall add rule name=icmpv6 protocol=icmpv6:any,any dir=in action=allow

netsh advfirewall firewall delete rule name=all protocol=tcp localport=22 || true
netsh advfirewall firewall add rule name=ssh protocol=tcp localport=22 dir=in action=allow
netsh advfirewall firewall delete rule name=all protocol=tcp localport=3389 || true
netsh advfirewall firewall add rule name=rdp protocol=tcp localport=3389 dir=in action=allow
netsh advfirewall firewall delete rule name=all protocol=tcp localport=5900 || true
netsh advfirewall firewall add rule name=vnc protocol=tcp localport=5900 dir=in action=allow
