#!/bin/sh
set -e -x

if [ -d /cygdrive/c/atx300 ]; then
  echo 'atx300 already installed?'
  exit 0
fi

mkdir -p c:\\atx300

icacls c:\\atx300 /grant admin:\(OI\)\(CI\)F
icacls c:\\atx300 /grant dispatcher:\(OI\)\(CI\)F || true
icacls c:\\atx300 /grant dispecer:\(OI\)\(CI\)F || true
icacls c:\\atx300 /grant operator:\(OI\)\(CI\)F
icacls c:\\atx300 /grant remoteadmin:\(OI\)\(CI\)F
icacls c:\\atx300 /grant remotebackup:\(OI\)\(CI\)R
icacls c:\\atx300 /remove everyone

mkdir -p c:\\atx300\\archive

icacls c:\\atx300\\archive /deny operator:\(OI\)\(CI\)F

net share atx300=c:\\atx300 \
/grant:admin,full \
/grant:dispatcher,full \
/grant:dispecer,full \
/grant:operator,full \
/grant:remoteadmin,full \
/grant:remotebackup,read

# the cat is there only to eat the possible error when grep finds nothing
mj=`ls /cygdrive/c/atx300 | grep mj | cat` || true
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
mpanel \
param \
place \
router \
signalsrecorder \
simulator \
visual \
visual-data \
interiorbus

cd /cygdrive/c/atx300
./add_to_path.bat
cd -
