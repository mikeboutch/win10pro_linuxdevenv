@echo off
c:\tools\cmdow @ /hid
REM c:\tools\cmdow /run 
start "" "C:\Program Files\VcXsrv\vcxsrv.exe" :0 -ac -terminate -lesspointer -multiwindow -clipboard -wgl
c:\tools\cmdow /run /hid c:\tools\cygwin\bin\bash.exe --login -c "DISPLAY=:0 /bin/xwin-xdg-menu >/dev/null 2>&1 &"
REM start a WSL bash in background, so xfce4-terminal will not close
c:\tools\cmdow /run /hid outbash ~
# I dont know, why cmdow /run /hid don't work?
start /b outbash ~ -c "export DISPLAY=:0 ; xfce4-terminal"
c:\tools\cmdow @ /cls