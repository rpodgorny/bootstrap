#!/bin/sh

set -e
set -x

if [ -f /home/admin/.ssh/id_rsa.pub ]; then
  echo 'rsa ssh keys already configured?'
  exit 0
fi

ssh-keygen -t rsa -f /home/admin/.ssh/id_rsa -P ""

echo
echo '!!! OVER IDENTITU (A ZADEJ yes) A VYPLN HESLO !!!'

ssh-copy-id -i /home/admin/.ssh/id_rsa incoming@incoming.asterix.cz

rm -f /home/admin/.ssh/id_dsa.pub
rm -f /home/admin/.ssh/id_dsa

echo
echo '!!! TED BY TO MELO VYPSAT INFO O SYSTEMU NA incoming.asterix.cz !!!'

ssh -i /home/admin/.ssh/id_rsa incoming@incoming.asterix.cz 'uname -a'

