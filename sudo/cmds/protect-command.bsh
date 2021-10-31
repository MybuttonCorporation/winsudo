if "%~1"=="" (
    colorful -s "[protect-command] No arguements provided.\n      type sudo protect-command help for info." -f 4 -n -e  
    exit /b
)
if "%1"=="help" (
    colorful -s "[protect] -> Usage: 'sudo protect-command <command name>'" -f 2
exit /b
)
for %%i in ("%~dp0..") do set "folder=%%~fi"
echo %folder%
echo %1=protected >> %folder%\cmds\_protected.ini