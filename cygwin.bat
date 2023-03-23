;rem wget -c http://cygwin.com/setup-x86_64.exe
powershell "(new-object net.webclient).downloadfile('http://cygwin.com/setup-x86_64.exe', 'setup-x86_64.exe')"

;rem http://ftp.fsn.hu/pub/cygwin

setup-x86_64.exe -q -D -L -s http://ftp.acc.umu.se/mirror/cygwin -l c:\tmp\ --no-desktop --upgrade-also ^
-P cron ^
-P git ^
-P nano ^
-P openssh ^
-P python3 ^
-P rsync ^
-P smartmontools ^
-P tmux ^
-P vim ^
-P wget ^
-P zip

del setup-x86_64.exe

set p=c:\cygwin64\bin

Echo.%PATH% | findstr /I /C:"%p%">nul && (
  echo %p% already in path
) || (
  echo adding %p% to path
  setx PATH "%PATH%;%p%" -m
  set "PATH=%PATH%;%p%"
)

set p=c:\cygwin64\usr\sbin

Echo.%PATH% | findstr /I /C:"%p%">nul && (
  echo %p% already in path
) || (
  echo adding %p% to path
  setx PATH "%PATH%;%p%" -m
  set "PATH=%PATH%;%p%"
)

;rem just run anything - we want to force /home/admin creation on first login shell
bash -l 'uname -a'
