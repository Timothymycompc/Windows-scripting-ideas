@echo off
cd phonesinfo 
adb shell getprop ro.serialno > serial.txt
adb shell getprop ro.boot.serialno  >> serial.txt
adb shell getprop ro.product.model > model.txt
adb shell getprop ro.product.vendor.manufacturer > manuf.txt
adb shell getprop ro.carrier > carrier.txt
adb shell getprop ro.logd.size.stats > memsize.txt 
adb shell getprop ril.serialnumber > othermodel.txt
adb shell df /data > hdsize.txt
for /f "DELIMS=" %%i in ('MORE othermodel.txt') do set otmodel="%%i"
for /f "tokens=2" %%i in ('MORE hdsize.txt') do set hdsize="%%i"
for /f "DELIMS=" %%i in ('MORE manuf.txt') do set manuf="%%i"
for /f "DELIMS=" %%i in ('MORE serial.txt') do set seri="%%i"
for /f "DELIMS=" %%i in ('MORE MODEL.txt') do set model="%%i"
for /f "DELIMS=" %%i in ('MORE carrier.txt') do set carr="%%i"
for /f "DELIMS=" %%i in ('MORE memsize.txt ') do set mem="%%i"

del *.txt
md %model%.%seri%
cd %model%.%seri%
echo "" > %model%.%seri%.txt
echo hdsize= %hdsize% >> %model%.%seri%.txt
echo manufacturer= %manuf% >> %model%.%seri%.txt
echo model= %model% >> %model%.%seri%.txt
echo memory= %mem% >> %model%.%seri%.txt
echo carrier= %carr% >> %model%.%seri%.txt
echo serial= %seri% >> %model%.%seri%.txt
echo othermodel= %otmodel% >> %model%.%seri%.txt
adb shell getprop > %model%.%seri%.getprop.txt
echo "this program is ment to wipe a phone"
echo "if at any time anything dose not look right just hit ctrl + c it will ask if you wanna terminate select yes"
set /p as="in order to reboot into bootloader and wipe phone press enter to continue (you may have to still wipe manually"
adb reboot recovery
