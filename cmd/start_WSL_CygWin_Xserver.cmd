@ECHO off
c:\tools\cmdow.exe @ /hid
START "" "C:\Program Files\VcXsrv\vcxsrv.exe" :0 -ac -terminate -lesspointer -multiwindow -clipboard -wgl
c:\tools\cmdow /run /hid c:\tools\cygwin\bin\bash.exe --login -c "DISPLAY=:0 /bin/xwin-xdg-menu >/dev/null 2>&1 &"
start /b /WAIT bash.exe ~ -c "export DISPLAY=:0 ;sakura --login"