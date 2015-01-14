#!/bin/sh
set -e
set -x

if [ -d /cygdrive/c/atxpkg ]; then
	echo 'atxpkg already installed?'
	exit 1
fi

fn=atxpkg-0.10.atxpkg.zip

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
cp -av atxpkg c:/
rm -rf atxpkg
rm $fn
rm 7za.exe

cd -
rm -rf atxpkg.tmp
cd -

c:/atxpkg/atxpkg install atxpkg --force

cd c:/atxpkg
./add_to_path.bat
cd -

net stop sshd
net start sshd

echo "Je nutne se odpojit (ctrl-d) a znovu se pripojit"
