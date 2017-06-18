@echo off
cmdow /run /hid c:\tools\cygwin\bin\bash.exe --login -c "DISPLAY=:0 /bin/konsole >/dev/null 2>&1 &"
cmdow @ /cls