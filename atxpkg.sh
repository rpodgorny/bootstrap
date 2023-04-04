#!/bin/sh
set -e -x

#if [ -d c:/atxpkg ]; then
#  echo 'atxpkg already installed?'
#  exit 0
#fi

urlbase=https://atxpkg.asterix.cz
pkg=atxpkg
ver=4.1-1
fn=$pkg-$ver.atxpkg.zip
#urlbase=https://atxpkg-dev.asterix.cz
#pkg=atxpkg.dev
#fn=atxpkg.dev-20220203181342-1.atxpkg.zip

mkdir -p c:/tmp
cd c:/tmp

rm -rf atxpkg.tmp
mkdir atxpkg.tmp
cd atxpkg.tmp

#wget $urlbase/$fn
wget --no-check-certificate $urlbase/$fn

#wget https://atxpkg.asterix.cz/7za.exe
wget --no-check-certificate https://atxpkg.asterix.cz/7za.exe

cp c:/atxpkg/installed.json ./ || true
chmod a+r installed.json || true

chmod a+x 7za.exe
./7za.exe x $fn
rm -rf c:/atxpkg/* || true
cp -rv atxpkg c:/
#rm -rf atxpkg
mkdir -p c:/atxpkg/cache
cp $fn c:/atxpkg/cache/
#rm $fn
#rm 7za.exe

cp installed.json c:/atxpkg/ || true
#rm installed.json || true

cd -
rm -rf atxpkg.tmp

c:/atxpkg/atxpkg install $pkg-$ver --yes --force

cd c:/atxpkg
./add_to_path.bat
cd -

# TODO: disabled now because of msys2
# so that the new path is applied
#net stop cygsshd || true
#net start cygsshd || true

echo "Je nutne se odpojit (ctrl-d) a znovu se pripojit"
