@echo off
setlocal enabledelayedexpansion 
for /f "tokens=* usebackq" %%f in (`hostname`) do (set compname=%%f) 
for /f "tokens=* usebackq" %%f in (`whoami`) do (set user=%%f)
echo ComputerName: %compname%
echo UserName: %user% 
for /f "tokens=* usebackq" %%f in (`nslookup myip.opendns.com resolver1.opendns.com`) do (set myip=%%f) 
echo PublicIP%myip%

WMIC CSPRODUCT GET NAME > MODEL.TXT
for /f "DELIMS=" %%i in ('MORE MODEL.txt') do set model="%%i"
DEL MODEL.TXT 
wmic diskdrive get size > HARDRIVESIZE.TXT
systeminfo | findstr /C:"Total Physical Memory" > MEMSIZE.TXT
WMIC CSPRODUCT GET NAME > MODEL.TXT
wmic cpu get NAME > CPU.TXT
WMIC BIOS GET SERIALNUMBER > SERIAL.TXT
for /f "eol1=" %%i in ('more HARDRIVESIZE.txt') do set hdsize=%%i
for /f "DELIMS=" %%i in ('MORE MEMSIZE.txt') do set MEM=%%i
for /f "DELIMS=" %%i in ('MORE MODEL.txt') do set MODeL=%%i
for /F "DELIMS=" %%i in ('MORE CPU.txt') do set CPU=%%i
for /F "DELIMS=" %%i in ('MORE SERIAL.txt') do set SERIAL=%%i
MD INFOBAT
CD INFOBAT 
echo Model: %model% >> INFOBAT.TXT
echo HardDrive: %hdsize% >> INFOBAT.TXT
echo MemorySize: %mem% >> INFOBAT.TXT
echo Cpu: %cpu%>> INFOBAT.TXT
echo Serial: %serial%>> INFOBAT.TXT
ECHO Ip: %myip% >> infobat.txt
echo ComputerName: %compname% >> infobat.txt
echo UserName: %user% >> infobat.txt
 
CD ..
del HARDRIVESIZE*
del MEMSIZE*
del CPU*
del SERIAL*
del MODEL*