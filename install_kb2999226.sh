#!/bin/sh
set -e -x

wget http://admiral.podgorny.cz/~radek/Windows6.1-KB2999226-x64.msu
wusa.exe Windows6.1-KB2999226-x64.msu /quiet
rm Windows6.1-KB2999226-x64.msu
