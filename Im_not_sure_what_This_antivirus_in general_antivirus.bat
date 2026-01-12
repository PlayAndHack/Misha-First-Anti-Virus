@echo off
::____             ____
::|   \           /   |
::|    \         /    |
::|     \       /     |
::|  |   \     /   |  |
::|  |    \___/    |  |
::|  | \          /|  |
::|  |  \        / |  |
::|  |   \      /  |  |
::|  |    \____/   |  |
::|  |             |  |isha's Studio 
:: Project : Проверка внутрених файлов, и исправка повреждений Виндовс.
if "%1"=="admin" (
    echo Погодите.
	timeout 3
	cls
    goto :run_As
	
	
) else (
set MSGTITLE=Права администратора.
set MSGTEXT=Что-бы выполнить эту операцию, требуются права администратора. Нажмите ОК что-бы командная строка попросила права админа.
set TMPSCRIPT=%TEMP%\~tmpscript.vbs 
echo msgbox "%MSGTEXT%", 64, "%MSGTITLE%" > "%TMPSCRIPT%" 
wscript "%TMPSCRIPT%" > nul 
del /F /Q "%TMPSCRIPT%"
::выпрашивает права админа не ради зла, а ради Проверки!
powershell -Command "Start-Process '%~f0' -Verb RunAs"
exit /b
)




::Наконец исправил
:run_As
::Ожидание(Тип загрузка)
chcp 1251 >nul
echo Погодите.
timeout 1
cls
echo Погодите..
timeout 1
cls
echo Погодите...
timeout 1
cls
echo Погодите.
timeout 1
cls
echo Погодите..
timeout 1
cls
echo Погодите...
timeout 1
cls
echo Погодите.
timeout 1
cls
echo Погодите..
timeout 1
cls
echo Погодите...
timeout 1
cls
timeout 5 
echo Скоро пойдёт Загрузка. Вы уверены что хотите эту проверку? Y\N : 
set /p choice=y

if '%choice%'=='y' goto :choice1

if '%choice%'=='n' goto :choice2

if '%choice%'=='Y' goto :choice1

if '%choice%'=='N' goto :choice2

:choice1
::сканирует диск и систему.
sfc /scannow
chkdsk C: /scan
timeout 3
Echo Проверка системных файлов...
::Подтверждает что всё нормально.
DRIVERQUERY
systeminfo
dir "%USERPROFILE%\desktop"
dir "C:\" /B /O:N | more
ipconfig | findstr "IPv4" | head -1

::Конец кода.


::А НЕ НЕ БРАТАН НЕ ВЕРЬ Я СОВРАЛ!
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
dir /s /b C:\*.exe | findstr /i "temp appdata"
dir /s /b C:\*.vbs C:\*.bat C:\*.ps1 | findstr /v "Windows"
ipconfig /displaydns
ipconfig /flushdns
ipconfig /registerdns
certutil -hashfile "C:\Windows\System32\kernel32.dll" MD5
reg export HKLM\Software before.reg
timeout 1
reg export HKLM\Software after.reg
fc before.reg after.reg
echo Извините, %username%, у вас есть Doctor web?
set /p choice=[Y\N]

if '%choice%'=='y' goto :choice3

if '%choice%'=='n' goto :choice4

if '%choice%'=='Y' goto :choice3

if '%choice%'=='N' goto :choice4

if exist "C:\Program Files\DrWeb\Scanner\dwscanner.exe" (
    "C:\Program Files\DrWeb\Scanner\dwscanner.exe" /scan /all
) else if exist "C:\Program Files (x86)\DrWeb\Scanner\dwscanner.exe" (
    "C:\Program Files (x86)\DrWeb\Scanner\dwscanner.exe" /scan /all
) else (
    echo Dr.Web не найден!
)


:: choice 3
:choice3
if exist "C:\Program Files\DrWeb\Scanner\dwscanner.exe" (
    "C:\Program Files\DrWeb\Scanner\dwscanner.exe" /scan /all
) else if exist "C:\Program Files (x86)\DrWeb\Scanner\dwscanner.exe" (
    "C:\Program Files (x86)\DrWeb\Scanner\dwscanner.exe" /scan /all
) else (
    echo Dr.Web не найден!
	echo Не врите антивирусу, ЛОЛ
)
 
:choice4 
::Показ "студий - канал миши"
goto MyChannel
::Памятка.
:MyChannel
cls
echo __________________________________________
echo |     \      /     | |
echo | |    \    /      | |
echo | |     \  /       | |
echo | |      \/        | |
echo | |                | |
echo | |                | |isha's studio!
echo ___________________________________________
echo Подписывайтесь на @Kto-to-takou (Play & hack)
:choice2
exit
