:: Check privileges 
net file 1>NUL 2>NUL
if not '%errorlevel%' == '0' (
    powershell Start-Process -FilePath "%0" -ArgumentList "%cd%" -verb runas >NUL 2>&1
    exit /b
)

:: Change directory with passed argument. Processes started with
:: "runas" start with forced C:\Windows\System32 workdir
cd /d %1

:: Actual work
@echo off
cls
colorful -s "---------------------" -f 2 -n
colorful -s "SUDO Installer | v1.0" -f 3 -n
colorful -s "---------------------" -f 2 -n
colorful -s "\nInstall Type: @user" -e -f 13 -n 
 
colorful -s "[sudo] -> Welcome to to the Sudo Installer." -f 13 -n
colorful -s "[sudo] -> Sudo will now install itself to the envoirement and register its file types." -f 13 -n
colorful -s "[sudo] -> Installing: File Types" -f 13 -n
ASSOC .bsh=bshfile >nul
FTYPE bshfile=cmd /c %~dp0sudo\helper\register.bat "%%1" >nul
colorful -s "[sudo] -> Installing: Envoirement Variables" -f 13 -n
setx /M path "%path%;%~dp0"
colorful -s "[sudo] -> Installing: Sudo Path" -f 13 -n
Setx sudopath "%~dp0
colorful -s "[sudo] -> Installation complete; sudo is now usable." -f 13 -n
echo :hi > %~dp0!.bat
exit /b