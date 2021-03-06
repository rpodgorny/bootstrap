#!/bin/sh
set -e -x

#if [ -d /cygdrive/c/atxpkg ]; then
#  echo 'atxpkg already installed?'
#  exit 0
#fi

fn=atxpkg-2.15-1.atxpkg.zip

mkdir -p /cygdrive/c/tmp
cd /cygdrive/c/tmp

rm -rf atxpkg.tmp
mkdir atxpkg.tmp
cd atxpkg.tmp

wget http://atxpkg.asterix.cz/$fn

#wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/7za.exe
wget http://atxpkg.asterix.cz/7za.exe

cp /cygdrive/c/atxpkg/installed.json ./ || true
chmod a+r installed.json || true

chmod a+x 7za.exe
./7za.exe x $fn
rm -rf /cygdrive/c/atxpkg/* || true
cp -rv atxpkg c:\\
#rm -rf atxpkg
mkdir -p /cygdrive/c/atxpkg/cache
cp $fn /cygdrive/c/atxpkg/cache/
#rm $fn
#rm 7za.exe

cp installed.json /cygdrive/c/atxpkg/ || true
#rm installed.json || true

cd -
rm -rf atxpkg.tmp

/cygdrive/c/atxpkg/atxpkg install atxpkg --yes --force

cd /cygdrive/c/atxpkg
./add_to_path.bat
cd -

net stop cygsshd || true
net start cygsshd || true

echo "Je nutne se odpojit (ctrl-d) a znovu se pripojit"
