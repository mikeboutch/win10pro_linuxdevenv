# win10pro_linuxdevenv

This is a howto for configuring the almost perfect developpemnt environnment. It this howto we will integrate :Windows 10 pro, Docker for Windows, WSL, CygWin64, Msys2, X window server, Hyper V, vagrant , Chocolatey, CMDer... I created this because each times that I come on a new Windows machine, I past at least one week only to setup my environnment.

# Chocolatey

## install Choco
```cmd
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```

## My list of Choco packages

`cinst -y 
7zip
adobereader
awscli
awstools.powershell
aztoolkit
beyondcompare
cccp
chocolateygui
classic-shell
clojure
cmake
cmder
cmdow
cyberduck
Cygwin
dokanany
fiddler4
flashplayerplugin
gae.sdk
gcloudsdk
git
glaryutilities-free
google-hangouts-chrome
GoogleChrome
googledrive
gradle
grails
groovy
gsutil
heroku-cli
hg
InputDirector
jdk7
jdk8
jenkins
jetbrainstoolbox
keepass
keepass-keepasshttp
keepass-plugin-keeagent
keepass-plugin-keeanywhere
keepass-plugin-rdp
kubernetes-cli
lockhunter
maven
msys2
mysql.workbench
netdrive
nmap
nodejs.install
notepadplusplus.install
openssh
P4Merge
packer
peazip
putty
python2
python3
qemu-img
rapidee
ruby
rufus
server-jre
skype
sql-server-management-studio
strawberryperl
studio3t
sysinternals
tailblazer
technicians-toolbox
terraform
vagrant
vcxsrv
velocity
visualstudio2017-workload-azure
visualstudiocode
vnc-viewer
vscode-csharp
vscode-csharpextensions
vscode-docker
vscode-markdownlint
vscode-powershell
windowsazurelibsfornet
windowsazurepowershell
windowsrepair
winfsp
winscp
wireshark
`

# Must have tools

## Clasic Shell

## CMDer

## CMDoW

## RapidEE
## SysInternals
## Velocity

# Accessing files 
## Winscp
## CyberDuck
## NetDrive
## Dokan
### WinSshFS
### CloudFS
## WinFSP
### sshFS-Win
### nfsFS-Win

# Connect to *X
## X window on Windows (X server)
## VNC
## MobaXterm

## *X on Windows: Cygwin, MinGW, Msys2, WSL)
Micorsoft POSIX subsystem (Windows NT and 2000),  Microsoft Services for UNIX (SFU) (since Windows XP and 2003), AT&T Uwin, OpenNT/InteriX (acquired by Microsoft in 1999) and MKS Toolkit (MS-DOS, OS/2, Windows NT/95 and up) (was used by Micosoft for SFU before they acquired Interix). PTC MKS toolkit is still avaivalbel, maintained and commercially supported. RedHat doesn't give commercial support for CygWin.
## CygWin
## Msys2
## WSL

# Installing **Windows Subsytems for Linux** __(WSL, Windows bash.exe, Ubuntu for windows)__

# Docker
## Docker for Windows
## Docker Toolbox on Windows
## docker-engine

# Hyper-V




# tricks
## mlink /j

