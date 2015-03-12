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

;rem this is stolen from add_to_path
set p=c:\cygwin\bin

Echo.%PATH% | findstr /C:"%p%">nul && (
	echo %p% already in path
) || (
	echo adding to %p% to path
	setx PATH "%PATH%;%p%" -m
	set PATH=%PATH%;%p%
)

set p=c:\cygwin\usr\sbin

Echo.%PATH% | findstr /C:"%p%">nul && (
	echo %p% already in path
) || (
	echo adding to %p% to path
	setx PATH "%PATH%;%p%" -m
	set PATH=%PATH%;%p%
)
