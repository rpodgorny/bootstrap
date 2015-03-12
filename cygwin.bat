;rem wget -c http://cygwin.com/setup-x86.exe

;rem http://ftp.fsn.hu/pub/cygwin

setup-x86.exe -q -D -s http://mirror.switch.ch/ftp/mirror/cygwin -l c:\tmp\ --no-desktop ^
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
