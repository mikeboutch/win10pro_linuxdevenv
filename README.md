# A development environnement on Windows

This is a howto for configuring the almost perfect development environment. It this howto we will integrate :Windows 10 pro, Docker for Windows, WSL, CygWin64, Msys2, X window server, Hyper V, CMDer and other. I created this because each times that I come on a new Windows machine, I past at least one week only to setup my environment.

## Chocolatey

### install Chococolatey

Run this in a administrator CMD.exe:
```cmd
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```

### My list of Choco packages

Here a Chocolatey install command to install a full bunch ot tools:

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

## *X on Windows: Cygwin, MinGW, Msys2, WSL)

Windows had many UNIX compatibility solution over the years: Microsoft POSIX subsystem (Windows NT and 2000),  Microsoft Services for UNIX (SFU) (since Windows XP and 2003), AT&T Uwin, OpenNT/InteriX (acquired by Microsoft in 1999) and MKS Toolkit (MS-DOS, OS/2, Windows NT/95 and up) (was used by Microsoft for SFU before they acquired Interix). Today we have 3 major Open-Source solution : Cygwin, MinGW, Msys2.  All the solution we have mentioned, do not  permit to run directly *X binaries but permit  to compile *X source code natively on Windows.

PTC MKS toolkit is still available, maintained and commercially supported. RedHat doesn't give commercial support for CygWin anymore.

Here come Microsoft WSL. WSL basically emulate Linux kernel in Windows. That permit to directly run Linux binaries in Windows and that without a VM. That mean that a Linux process with be a Windows process, so we don't have to reserve memory like in a VM to run Linux binaries.

### CygWin

### Msys2

### **Windows Subsystems for Linux** __(WSL, Windows bash.exe, Ubuntu for windows)__

#### Prepare your system

Update, reboot, update ... reboot

#### Enable WSl and install Ubuntu

Enable WSl Windows feature. And a couple reboot after you a Linux your Windows (without a VM). Before the first run, update Ubuntu:

```cmd
C:\> LxRun.exe  /uninstall /full /y
This will uninstall Ubuntu on Windows.
This will remove the Ubuntu environment as well as any modifications, new applications, and user data.
Uninstalling...

```
```cmd
C:\>  LxRun.exe  /install /y
-- Beta feature --
This will install Ubuntu on Windows, distributed by Canonical
and licensed under its terms available here:
https://aka.ms/uowterms

Downloading from the Windows Store... 100%
Extracting filesystem, this will take a few minutes...
Installation successful!
```

 The following is required only if didn't ask to set the default user. Or if you want to change the default user name.

```cmd
C:\> LxRun.exe /setdefaultuser
Please create a default UNIX user account. The username does not need to match your Windows username.
For more information visit: https://aka.ms/wslusers
Enter new UNIX username: mikeb
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
Default UNIX user set to: mikeb
```

Now we can verify the version of Ubuntu on Windows.

```cmd
C:\> %windir%\system32\bash.exe -c "lsb_release -a 2>&1|grep -v 'No LSB'"
Distributor ID: Ubuntu
Description:    Ubuntu 16.04.2 LTS
Release:        16.04
Codename:       xenial
```

You can also upgrade directly in the Ubuntu prompt: `sudo do-release-upgrade`

You are now ready to go. Run bash :`%windir%\system32\bash.exe ~` or

```console
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

mikeb@boutchAtouch:~$ sudo su -
[sudo] password for mikeb:
root@boutchAtouch:~# sed -i -- 's/^%sudo.*$/%sudo   ALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers
root@boutchAtouch:~# ln -sv /mnt/* /
'/c' -> '/mnt/c'
'/d' -> '/mnt/d'
root@boutchAtouch:~# exit
mikeb@boutchAtouch:~$
```

### Install Windows Insider Preview

`sfc /scannow` `wsreset.exe` I had run the Windows Update trouble shooter, which claimed to have fixed problems, and also manually deleted the C:\$WINDOWS.~BT folder, and all folders and files in C:\WINDOWS\SoftwareDistribution\Download. I have now deferred updates. Windows repair..., Version 1703 (OS Build 15063.413)

## Connect to a *X GUI : X window on Windows (X server)

*X system has no Remote desktop natively...

### CygWIN

Install Xserver from a administrator CMD:

```cmd
curl http://cygwin.com/setup-x86_64.exe > C:\tools\cygwin\setup-x86_64.exe
 c:\tools\cygwin\setup-x86_64.exe -q -R C:\tools\cygwin -c  GNOME Gnome KDE LXDE MATE X11 Xfce
```

Fix `startxwin` so it would work with WSL since he will connect in TCP not in UDP.
```bash
sed -i.bak 's/^serverargs=""/serverargs=" -- -listen tcp "/1; s/enable_xauth=1/enable_xauth=0/1' `which startxwin`
```
The previous command also disable Xauth. For Xauth support, you should copy `~/.Xauthority` from your Cygwin's home dir to your WSL's home dir and leave `enable_xauth` to 1 in startxwin.
You can do the same thing for `startx`. 'startx' start the Xserver in single Windows window. [ See Cygwin/X documentation](https://x.cygwin.com/docs/ug/using.html)

Start the the Xserver, from CygWIN bash:
```bash
startxwin &
```

### VcXsrv
The best OSS Xserver Windows Native (compiled with Visual C++), if you don't whant to install Cygwin

### MobaXterm
I have to mention it. Because it's a nice product but the free edition is limiting session.

## Must have tools

### Classic Shell

### CMDer

### CMDoW

### Everywhere

### RapidEE

### SysInternals

### Velocity

### VNC viewer

## Accessing files

### Winscp

### CyberDuck

### NetDrive

### Dokan

#### WinSshFS

#### CloudFS

### WinFSP

#### sshFS-Win

#### nfsFS-Win

## Docker

### Docker for Windows

### Docker Toolbox on Windows

### docker-engine

## Hyper-V

## tricks

### mlink /j

### Windows

show version:

```cmd
ver
winver
```

#### WSL

show version:

```bash
uname -a
lsb_releases -a
```

#### MSYS2

show version 

```bash
uname -a
cygcheck -V
gcc -v 2>&1 |grep "gcc "
```

upgrade

```bash
pacman -Syu
pacman -Syu
```

### cygwin

show version 

```bash
uname -a
cygcheck -V
```

upgrade

From cmd.exe:

```cmd
curl http://cygwin.com/setup-x86_64.exe > C:\tools\cygwin\setup-x86_64.exe
c:\tools\cygwin\setup-x86_64.exe -q -R C:\tools\cygwin -g
```

From bash:

```bash
curl http://cygwin.com/setup-x86_64.exe > /setup-x86_64.exe
cygstart --action=runas /setup-x86_64.exe -q -R 'C:\tools\cygwin' -g
```

Install package management system. Sage is dirivate of apt-cyg, written in bash. I have to try cyg-apt which seem more powerfull and written in Python. Sage seem to be the most recent and also his code is really simple.

```bash
mkdir -p /tmp/sage
pushd /tmp/sage
curl  https://codeload.github.com/svnpenn/sage/zip/master > sage-master.zip
unzip  sage-master.zip
cd sage-master/
./install.sh
sage update
popd
rm -rf /tmp/sage
```

List package categorie

```bash
sage update # to create setup.ini and setup.sh
readonly arch=$(uname -m | sed s.i6.x.)
. /etc/setup/setup.sh
grep ^category: "$lastcache"/"$elastmirror"/"$arch"/setup.ini |awk '{ for (i = 2; i <= NF; i++) print $i }'|sort|uniq
```











