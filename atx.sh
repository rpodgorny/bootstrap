rm -f atx300.sh
wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/atx300.sh
chmod a+x atx300.sh
./atx300.sh
rm atx300.sh

rm -f fix_language_symlink.sh
wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/fix_language_symlink.sh
chmod a+x fix_language_symlink.sh
./fix_language_symlink.sh
rm fix_language_symlink.sh

rm -f management.sh
wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/management.sh
chmod a+x management.sh
./management.sh
rm management.sh

#rm -f archiver.sh
#wget --no-check-certificate http://raw.githubusercontent.com/rpodgorny/bootstrap/master/archiver.sh
#chmod a+x archiver.sh
#./archiver.sh
#rm archiver.sh

