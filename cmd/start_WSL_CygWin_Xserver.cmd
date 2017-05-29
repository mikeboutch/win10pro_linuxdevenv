@echo off
cmdow @ /hid
REM c:\tools\cmdow /run 
start "" "C:\Program Files\VcXsrv\vcxsrv.exe" :0 -ac -terminate -lesspointer -multiwindow -clipboard -wgl
c:\tools\cmdow /run /hid c:\tools\cygwin\bin\bash.exe --login -c "DISPLAY=:0 /bin/xwin-xdg-menu >/dev/null 2>&1 &"
start /b outbash ~ -c "export DISPLAY=:0 ; xfce4-terminal &"
cmdow @ /cls