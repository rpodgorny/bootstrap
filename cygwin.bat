;rem wget -c http://cygwin.com/setup-x86.exe
powershell "(new-object net.webclient).downloadfile('http://cygwin.com/setup-x86.exe', 'setup-x86.exe')"

;rem http://ftp.fsn.hu/pub/cygwin

setup-x86.exe -q -D -L -s http://mirror.switch.ch/ftp/mirror/cygwin -l c:\tmp\ --no-desktop ^
-P cron ^
-P git ^
-P nano ^
-P openssh ^
-P python3 ^
-P rsync ^
-P smartmontools ^
-P tmux ^
-P vim ^
-P wget

del setup-x86.exe

;rem this is stolen from add_to_path
;rem TODO: this either adds the first or the second but not both - fix that!
;rem set p=c:\cygwin\bin

;rem Echo.%PATH% | findstr /C:"%p%">nul && (
;rem 	echo %p% already in path
;rem ) || (
;rem 	echo adding %p% to path
;rem 	setx PATH "%PATH%;%p%" -m
;rem 	set PATH=%PATH%;%p%
;rem )

;rem set p=c:\cygwin\usr\sbin

;rem Echo.%PATH% | findstr /C:"%p%">nul && (
;rem 	echo %p% already in path
;rem ) || (
;rem 	echo adding %p% to path
;rem 	setx PATH "%PATH%;%p%" -m
;rem 	set PATH=%PATH%;%p%
;rem )

Echo.%PATH% | findstr /C:"c:\cygwin\bin">nul && (
  echo cygwin already in path
) || (
  echo adding "c:\cygwin\bin;c:\cygwin\usr\sbin" to path
  setx PATH "%PATH%;c:\cygwin\bin;c:\cygwin\usr\sbin" -m
  set PATH=%PATH%;c:\cygwin\bin;c:\cygwin\usr\sbin
)
