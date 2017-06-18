@echo off
c:\tools\cmdow @ /hid
REM start /b /WAIT bash ~ -c "export DISPLAY=:0 ; xfce4-terminal --disable-server"
REM start /b /WAIT bash.exe ~ -c "export DISPLAY=:0 ;sakura --login"
start /b /WAIT bash.exe ~ -c "export DISPLAY=:0 ;terminator"
REM cmdow @ /cls
