#!/bin/sh
set -e
set -x

echo 'vsechno odentruj'
ssh-keygen

echo 'over identitu a vypln heslo'
ssh-copy-id incoming@incoming.asterix.cz

echo 'ted by to melo vypsat info o systemu na incoming.asterix.cz'
ssh incoming@incoming.asterix.cz 'uname -a'
