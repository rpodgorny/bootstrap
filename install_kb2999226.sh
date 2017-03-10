#!/bin/sh
set -e -x

# get the shit from https://www.microsoft.com/en-us/download/confirmation.aspx?id=49093

function finish {
  rm Windows6.1-KB2999226-x64.msu
}
trap finish EXIT

wget http://admiral.podgorny.cz/~radek/Windows6.1-KB2999226-x64.msu
wusa.exe Windows6.1-KB2999226-x64.msu /quiet
