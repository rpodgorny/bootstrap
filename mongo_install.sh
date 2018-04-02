#!/bin/sh
set -e -x

rm -f *.msi
#FN=mongodb-win32-x86_64-2008plus-ssl-3.6.3-signed.msi
#wget https://fastdl.mongodb.org/win32/${FN}
#echo "msiexec.exe /q /i ${FN}" | cmd
#rm ${FN}

mkdir -p /cygdrive/c/data/db
mkdir -p /cygdrive/c/data/log

echo "systemLog:
  destination: file
  path: c:\\data\\log\\mongod.log
storage:
  dbPath: c:\\data\\db
" > C:\\Program\ Files\\MongoDB\\Server\\3.6\\mongod.cfg

#echo '"c:\Program Files\MongoDB\Server\3.6\bin\mongod.exe" --config "C:\Program Files\MongoDB\Server\3.6\mongod.cfg" --install' | cmd
sc.exe create MongoDB binPath= "\"C:\Program Files\MongoDB\Server\3.6\bin\mongod.exe\" --service --config=\"C:\Program Files\MongoDB\Server\3.6\mongod.cfg\"" DisplayName= "MongoDB" start= "auto"

net start MongoDB
