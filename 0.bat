if not %username%==admin (
  echo '!!! NOT ADMIN !!!'
  exit
)

powershell "(new-object net.webclient).downloadfile('http://rawgit.com/rpodgorny/bootstrap/master/cygwin.bat', 'cygwin.bat')"
call cygwin.bat
del cygwin.bat

powershell "(new-object net.webclient).downloadfile('http://rawgit.com/rpodgorny/bootstrap/master/all.sh', 'all.sh')"
chmod a+x all.sh
bash all.sh
del all.sh
