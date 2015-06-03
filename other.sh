#!/bin/sh
set -e
set -x

# disable non-native ipv6 shit
netsh int ipv6 isatap set state disabled
netsh int ipv6 6to4 set state disabled
netsh interface teredo set state disabled

# disable privacy extensions
netsh interface ipv6 set privacy state=disabled store=active
netsh interface ipv6 set privacy state=disabled store=persistent

# enable aaaa lookups even for non-native ipv6 connectivity
regtool -d add /HKLM/SYSTEM/CurrentControlSet/services/Dnscache/Parameters AddrConfigControl
regtool -d set /HKLM/SYSTEM/CurrentControlSet/services/Dnscache/Parameters/AddrConfigControl 0

# adjust firewall
netsh advfirewall firewall delete rule name=all protocol=icmpv4
netsh advfirewall firewall delete rule name=all protocol=icmpv6
netsh advfirewall firewall add rule name=icmpv4 protocol=icmpv4:any,any dir=in action=allow
netsh advfirewall firewall add rule name=icmpv6 protocol=icmpv6:any,any dir=in action=allow
