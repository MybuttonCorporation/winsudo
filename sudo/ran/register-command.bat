if "%~1"=="" (
colorful -s "[register] -> invalid syntax." -f 4
exit /b
) 

for %%i in ("%~dp0..") do set "folder=%%~fi"

copy "%1" "%folder%/cmds/%~n1.bsh" >nul
colorful -s "[register] -> registered command as '%~n1'" -f 13