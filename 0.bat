rem if not %username%==admin (
rem   echo '!!! NOT ADMIN !!!'
rem   goto :eof
rem )

powershell "(new-object net.webclient).downloadfile('http://raw.githubusercontent.com/rpodgorny/bootstrap/master/cygwin.bat', 'cygwin.bat')"
call cygwin.bat
del cygwin.bat

powershell "(new-object net.webclient).downloadfile('http://raw.githubusercontent.com/rpodgorny/bootstrap/master/all.sh', 'all.sh')"
chmod a+x all.sh
bash all.sh
del all.sh
