#!/bin/sh
set -e
set -x

if [ -d /cygdrive/c/atx300 ]; then
  echo 'atx300 already installed?'
  exit 0
fi

mkdir -p /cygdrive/c/atx300

icacls c:\\atx300 /grant admin:\(OI\)\(CI\)F
icacls c:\\atx300 /grant dispatcher:\(OI\)\(CI\)F || true
icacls c:\\atx300 /grant dispecer:\(OI\)\(CI\)F || true
icacls c:\\atx300 /grant operator:\(OI\)\(CI\)F
icacls c:\\atx300 /grant remoteadmin:\(OI\)\(CI\)F
icacls c:\\atx300 /grant remotebackup:\(OI\)\(CI\)R
icacls c:\\atx300 /remove everyone

net share atx300=c:\\atx300 \
/grant:admin,full \
/grant:dispatcher,full \
/grant:dispecer,full \
/grant:operator,full \
/grant:remoteadmin,full \
/grant:remotebackup,read

# the cat is there only to eat the possible error when grep finds nothing
mj=`ls /cygdrive/c/atx300 | grep mj | cat`
if [ -z "$mj" ]; then
  echo
  echo "!!! ZADEJ JMENO BETONARNY (VCETNE MJ) !!! "
  read mj

  touch /cygdrive/c/atx300/$mj
fi

/cygdrive/c/atxpkg/atxpkg install --yes \
atx300-base \
consist \
control \
loader \
manager \
memview \
moistures \
mpanel \
param \
place \
router \
signalsrecorder \
simulator \
visual \
visual-data \
interiorbus

set p=c:\atx300
Echo.%PATH% | findstr /C:"%p%">nul && (
  echo %p% already in path
) || (
  echo adding to %p% to path
  setx PATH "%PATH%;%p%" -m
  set "PATH=%PATH%;%p%"
)
