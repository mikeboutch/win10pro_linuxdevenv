@echo off
c:\tools\cmdow @ /hid
REM start /b /WAIT bash ~ -c "export DISPLAY=:0 ; xfce4-terminal --disable-server"
start /b /WAIT bash.exe ~ -c "export DISPLAY=:0 ;sakura --login"
REM start /b /WAIT bash.exe ~ -c "export DISPLAY=:0 ;terminator"
REM start /b /WAIT bash.exe ~ -c "export DISPLAY=:0 ;terminator"
REM c:\tools\cmdow @ /cls
