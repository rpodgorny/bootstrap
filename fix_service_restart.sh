#!/bin/sh
set -e -x

sc failure "4to6server" actions= restart/600000/restart/600000/restart/600000 reset= 86400
sc failure "atxmonc" actions= restart/600000/restart/600000/restart/600000 reset= 86400
sc failure "faddnsc" actions= restart/600000/restart/600000/restart/600000 reset= 86400
sc failure "management" actions= restart/600000/restart/600000/restart/600000 reset= 86400
sc failure "sshd" actions= restart/600000/restart/600000/restart/600000 reset= 86400
sc failure "tvnserver" actions= restart/600000/restart/600000/restart/600000 reset= 86400
sc failure "OpenVPNService" actions= restart/600000/restart/600000/restart/600000 reset= 86400
