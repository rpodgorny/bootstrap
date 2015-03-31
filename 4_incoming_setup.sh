#!/bin/sh
set -e
set -x

if [ -f /home/admin/.ssh/id_rsa.pub ]; then
  echo 'incoming already configured?'
  exit 0
fi

echo
echo '!!! VSECHNO ODENTRUJ !!!'
ssh-keygen

echo
echo '!!! OVER IDENTITU (A ZADEJ yes) A VYPLN HESLO !!!'
ssh-copy-id incoming@incoming.asterix.cz

echo
echo '!!! TED BY TO MELO VYPSAT INFO O SYSTEMU NA incoming.asterix.cz !!!'
ssh incoming@incoming.asterix.cz 'uname -a'
