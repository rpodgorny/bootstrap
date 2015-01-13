set p=c:\cygwin\bin

Echo.%PATH% | findstr /C:"%p%">nul && (
	echo %p% already in path
) || (
	echo adding to %p% to path
	setx PATH "%PATH%;%p%" -m
)

set p=c:\cygwin\usr\sbin

Echo.%PATH% | findstr /C:"%p%">nul && (
	echo %p% already in path
) || (
	echo adding to %p% to path
	setx PATH "%PATH%;%p%" -m
)
