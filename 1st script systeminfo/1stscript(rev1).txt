@echo off
WMIC CSPRODUCT GET NAME > MODEL.TXT


for /f "DELIMS=" %%i in ('MORE MODEL.txt') do set model="%%i"

DEL MODEL.TXT 

md %Model%
cd %model%

wmic diskdrive get size > HARDRIVESIZE.TXT
systeminfo | findstr /C:"Total Physical Memory" > MEMSIZE.TXT
WMIC CSPRODUCT GET NAME > MODEL.TXT
wmic cpu get NAME > CPU.TXT
WMIC BIOS GET SERIALNUMBER > SERIAL.TXT



for /f "delims=" %%i in ('more HARDRIVESIZE.txt') do set hdsize=%%i
for /f "DELIMS=" %%i in ('MORE MEMSIZE.txt') do set MEM=%%i
for /f "DELIMS=" %%i in ('MORE MODEL.txt') do set MODeL=%%i
for /F "DELIMS=" %%i in ('MORE CPU.txt') do set CPU=%%i
for /F "DELIMS=" %%i in ('MORE SERIAL.txt') do set SERIAL=%%i


setlocal enabledelayedexpansion 
set obj[0].desc=model
set obj[0].size=%model%
set obj[1].desc=serial
set obj[1].size=%SERIAL%
set obj[2].desc=cpu
set obj[2].size=%CPU%
set obj[3].desc=memory
set obj[3].size=%MEM%
set obj[4].desc=hardrive
set obj[4].size=%HDSIZE%

for /l %%i in (0 1 4) do (
call echo %%obj[%%i].desc%%
call echo %%obj[%%i].size%%
) >> info.txt
 

ECHO " <!DOCTYPE html>" >> info.HTML
ECHO " <html>" >> info.HTML
ECHO " <body>" >> info.HTML

ECHO " <h2>%model% info</h2>" >> info.HTML
ECHO " <table style="width:100%">" >> info.HTML

ECHO " <td></td>" >> info.HTML
ECHO " <tr>" >> info.HTML
ECHO " </tr>" >> info.HTML
ECHO " <td></td>" >> info.HTML

ECHO "   <tr>" >> info.HTML
ECHO "     <th></th>" >> info.HTML
ECHO "     <th></th>" >> info.HTML
ECHO "   </tr>" >> info.HTML

ECHO " <td></td>" >> info.HTML
ECHO " <tr>" >> info.HTML
ECHO " </tr>" >> info.HTML
ECHO " <td></td>" >> info.HTML

ECHO "<tr>" >> info.HTML
ECHO "<td>Serial:</td>" >> info.HTML
ECHO "<td>%serial%</td>" >> info.HTML
ECHO "<td></td>" >> info.HTML
ECHO "</tr>" >> info.HTML

ECHO " <td></td>" >> info.HTML
ECHO " <tr>" >> info.HTML
ECHO " </tr>" >> info.HTML
ECHO " <td></td>" >> info.HTML

ECHO "<tr>" >> info.HTML
ECHO "<td>HardDriveSize:</td>" >> info.HTML
ECHO "<td>%HDSIZE%</td>" >> info.HTML
ECHO "<td></td>" >> info.HTML
ECHO "</tr>" >> info.HTML

ECHO " <td></td>" >> info.HTML
ECHO " <tr>" >> info.HTML
ECHO " </tr>" >> info.HTML
ECHO " <td></td>" >> info.HTML

ECHO "<tr>" >> info.HTML
ECHO "<td>Cpu:</td>" >> info.HTML
ECHO "<td>%cpu%</td>" >> info.HTML
ECHO "<td></td>" >> info.HTML
ECHO "</tr>" >> info.HTML

ECHO " <td></td>" >> info.HTML
ECHO " <tr>" >> info.HTML
ECHO " </tr>" >> info.HTML
ECHO " <td></td>" >> info.HTML

ECHO "<tr>" >> info.HTML
ECHO "<td>Model:</td>" >> info.HTML
ECHO "<td>%model%</td>" >> info.HTML
ECHO "<td></td>" >> info.HTML
ECHO "</tr>" >> info.HTML

ECHO " <td></td>" >> info.HTML
ECHO " <tr>" >> info.HTML
ECHO " </tr>" >> info.HTML
ECHO " <td></td>" >> info.HTML

ECHO "<tr>" >> info.HTML
ECHO "<td>Memory:</td>" >> info.HTML
ECHO "<td>%mem%</td>" >> info.HTML
ECHO "<td></td>" >> info.HTML
ECHO "</tr>" >> info.HTML

ECHO " <td></td>" >> info.HTML
ECHO " <tr>" >> info.HTML
ECHO " </tr>" >> info.HTML
ECHO " <td></td>" >> info.HTML

ECHO " <td></td>" >> info.HTML
ECHO " <tr>" >> info.HTML
ECHO " </tr>" >> info.HTML
ECHO " <td></td>" >> info.HTML

ECHO " </table>" >> info.HTML
ECHO " </body>" >> info.HTML
ECHO " </html>" >> info.HTML


DEL MEMSIZE*
DEL MODEL*
DEL CPU*
DEL SERIAL*
del HARDR*

cd ..

