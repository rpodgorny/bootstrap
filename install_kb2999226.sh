#!/bin/sh
set -e -x

# get the shit from https://www.microsoft.com/en-us/download/confirmation.aspx?id=49093
# 32bit: https://www.microsoft.com/en-us/download/confirmation.aspx?id=49077

#FN=Windows6.1-KB2999226-x64.msu
FN=Windows6.1-KB2999226-x86.msu

function finish {
  rm $FN
}
trap finish EXIT

wget http://admiral.podgorny.cz/~radek/$FN
wusa.exe $FN /quiet
