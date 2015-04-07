#!/bin/sh
set -e
set -x

if [ -d /cygdrive/c/atxpkg ]; then
  echo 'atxpkg already installed?'
  exit 0
fi

fn=atxpkg-1.5-1.atxpkg.zip

cd /tmp

if [ -d atxpkg.tmp ]; then
  rm -rf atxpkg.tmp
fi
mkdir atxpkg.tmp
cd atxpkg.tmp

wget http://atxpkg.asterix.cz/$fn
wget http://trac.greenstone.org/export/21884/main/trunk/release-kits/shared/windows/7za/7za.exe
chmod a+x 7za.exe
./7za.exe x $fn
cp -av atxpkg c:\\
rm -rf atxpkg
rm $fn
rm 7za.exe

cd -
rm -rf atxpkg.tmp

/cygdrive/c/atxpkg/atxpkg install atxpkg --yes --force

cd /cygdrive/c/atxpkg
./add_to_path.bat
cd -

net stop sshd || true
net start sshd || true

echo "Je nutne se odpojit (ctrl-d) a znovu se pripojit"
