# A devloppement environnement on Windows

This is a howto for configuring the almost perfect developpemnt environnment. It this howto we will integrate :Windows 10 pro, Docker for Windows, WSL, CygWin64, Msys2, X window server, Hyper V, vagrant , Chocolatey, CMDer and other. I created this because each times that I come on a new Windows machine, I past at least one week only to setup my environnment.

# Chocolatey

## install Choco

Run this in a adminsitrator CMD.exe:
```
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```

## My list of Choco packages

Here a chocolatey install command to install a full buunch ot tools:

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

# *X on Windows: Cygwin, MinGW, Msys2, WSL)
Micorsoft POSIX subsystem (Windows NT and 2000),  Microsoft Services for UNIX (SFU) (since Windows XP and 2003), AT&T Uwin, OpenNT/InteriX (acquired by Microsoft in 1999) and MKS Toolkit (MS-DOS, OS/2, Windows NT/95 and up) (was used by Micosoft for SFU before they acquired Interix). PTC MKS toolkit is still avaivalbel, maintained and commercially supported. RedHat doesn't give commercial support for CygWin.
## CygWin
## Msys2
## **Windows Subsytems for Linux** __(WSL, Windows bash.exe, Ubuntu for windows)__

### Prepare your system
Update, reboot, update ... reboot
### Enable WSl and install Ubuntu
Enable WSl Windows feature. And a couple reboot after you a Linux your Windows (without a VM). Before the first run, update Ubuntu:
```
C:\Users\Michel 
λ LxRun.exe  /uninstall /full /y
This will uninstall Ubuntu on Windows.
This will remove the Ubuntu environment as well as any modifications, new applications, and user data.
Uninstalling...

C:\Users\Michel 
λ LxRun.exe  /install /y
-- Beta feature --
This will install Ubuntu on Windows, distributed by Canonical
and licensed under its terms available here:
https://aka.ms/uowterms

Downloading from the Windows Store... 100%
Extracting filesystem, this will take a few minutes...
Installation successful!

C:\Users\Michel 
λ REM the following is required only if didn't ask to set the default user. Or if you whant to change the default user name. 

C:\Users\Michel 
λ LxRun.exe /setdefaultuser
Please create a default UNIX user account. The username does not need to match your Windows username.
For more information visit: https://aka.ms/wslusers
Enter new UNIX username: mikeb
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
Default UNIX user set to: mikeb

C:\Users\Michel 
λ %windir%\system32\bash.exe -c "lsb_release -a 2>&1|grep -v 'No LSB'"
Distributor ID: Ubuntu
Description:    Ubuntu 16.04.2 LTS
Release:        16.04
Codename:       xenial
```
run `%windir%\system32\bash.exe ~` or
```
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

mikeb@boutchAtouch:~$ sudo su -
[sudo] password for mikeb:
root@boutchAtouch:~# sed -i -- 's/^%sudo.*$/%sudo   ALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers
root@boutchAtouch:~# ln -sv /mnt/* /
'/c' -> '/mnt/c'
'/d' -> '/mnt/d'
root@boutchAtouch:~#


```
`sudo do-release-upgrade`


# Connect to *X GUI
Since *X system had no Remote desktop comaptibility....
## X window on Windows (X server)
### CygWIN
```cmd
curl http://cygwin.com/setup-x86_64.exe > C:\tools\cygwin\setup-x86_64.exe
 c:\tools\cygwin\setup-x86_64.exe -q -R C:\tools\cygwin -c  GNOME Gnome KDE LXDE MATE X11 Xfce
```
### VcXsrv
## MobaXterm
## VNC

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

# Docker
## Docker for Windows
## Docker Toolbox on Windows
## docker-engine

# Hyper-V




# tricks
## mlink /j
## Show Version
### Windows
```cmd
ver
winver
```
### WSL
```bash
lsb_releases -a
```
### MSYS2
```bash
cygcheck -V
gcc -v 2>&1 |grep "gcc "
```

```bash
pacman -Syu
pacman -Syu
```
### cygwin
```
cygcheck -V
```

```cmd
cd C:\tools\cygwin
curl http://cygwin.com/setup-x86_64.exe > C:\tools\cygwin\setup-x86_64.exe
REM setup-x86_64.exe --root C:\tools\cygwin -q --upgrade-also
c:\tools\cygwin\setup-x86_64.exe -q -R C:\tools\cygwin -g
```
```bash
curl http://cygwin.com/setup-x86_64.exe > /setup-x86_64.exe
cygstart --action=runas /setup-x86_64.exe -q -R 'C:\tools\cygwin' -g

```
mount USERPROFILE as HOME....
```bash
mkdir -p /tmp/sage
cd /tmp/sage
curl  https://codeload.github.com/svnpenn/sage/zip/master > sage-master.zip
cd sage-master/
sage update
```

```bash
sage update
readonly arch=$(uname -m | sed s.i6.x.)
# from priv_setwd()
  . /etc/setup/setup.sh
  mkdir -p "$lastcache"/"$elastmirror"/"$arch"
  pushd "$lastcache"/"$elastmirror"/"$arch"
# end of from
#grep ^category: setup.ini | sort | uniq |  awk '$3=="" {$1="";print $0}'
#grep ^category: setup.ini | sort | uniq |  awk '{$1="";print $0}'
#grep ^category: setup.ini |awk '{$1="";print $0}'|sort|uniq|awk '{ for (i = 1; i <= NF; i++) print $i }'|sort|uniq -i
grep ^category: setup.ini |awk '{ for (i = 2; i <= NF; i++) print $i }'|sort|uniq
popd
```









