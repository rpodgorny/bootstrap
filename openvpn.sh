#!/bin/sh
set -e
set -x

schtasks /delete /tn "OpenVPN" /f

sc config OpenVPNService start= auto
net start OpenVPNService
