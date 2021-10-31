@echo off
setlocal enabledelayedexpansion

for %%i in ("%~dp0..") do set "folder=%%~fi"
if NOT exist "%folder%\cmds" (
   if NOT exist "%1" (
colorful -s "[register] Both the command registry and %1 could not be found." -f 4 -n
exit /b
)
colorful -s "[register] ERR! command registry folder could not be found." -f 4 -n
exit /b
)
if NOT exist "%1" (
      if NOT exist "%folder%\cmds" (
colorful -s "[register] Both the command registry and %1 could not be found." -f 4 -n
exit /b
)
colorful -s "[register] ERR! %1 could not be found." -f 4 -n
exit /b
)
colorful -s "[register] registering " -f 13
colorful -s "%1" -b 8 -f 2 -n
if EXIST "%folder%\cmds\%~n1.bsh" (
FOR /F "tokens=*" %%A IN ('type "%folder%\cmds\_protected.ini"') DO SET %%A
echo !%~n1!
if "!%~n1!"=="protected" (
        
     colorful -s "--------------------------------------------------------------------------------" -f 11 -n
   colorful -s "[register] OVERWRITE %~n1 is already a present command, overwriting..." -f 12 -n
   colorful -s "[register] POST %~n1: .\%~n1.bsh/@bin/func/@overwrite.bsh" -f 12 -n
   colorful -s "[register] ERR %~n1: .\%~n1.bsh is protected. " -f 12 -n
        colorful -s "--------------------------------------------------------------------------------" -f 11 -n
   colorful -s "[register] " -f 13
colorful -s "%1" -b 8 -f 2 
colorful -s " could not be registered." -f 4
   exit/b
)


   colorful -s "[register] OVERWRITE %~n1 is already a present command, overwriting..." -f 12 -n
   colorful -s "[register] POST %~n1: .\%~n1.bsh/@bin/func/@overwrite-self.bsh" -f 12 -n
   colorful -s "[register] RESPONSE %~n1: .\%~n1.bsh is now being overwritten by %1" -f 12 -n
)
FOR /F "tokens=*" %%A IN ('type "%folder%\cmds\_protected.ini"') DO SET %%A
echo !%~n1!
if "!%~n1!"=="protected" (
        
     colorful -s "--------------------------------------------------------------------------------" -f 11 -n
   colorful -s "[register] OVERWRITE %~n1 is already a present command, overwriting..." -f 12 -n
   colorful -s "[register] POST %~n1: .\%~n1.bsh/@bin/func/@overwrite.bsh" -f 12 -n
   colorful -s "[register] ERR %~n1: .\%~n1.bsh is protected. " -f 12 -n
        colorful -s "--------------------------------------------------------------------------------" -f 11 -n
   colorful -s "[register] " -f 13
colorful -s "%1" -b 8 -f 2 
colorful -s " could not be registered." -f 4
   exit/b
)
colorful -s "[register] " -f 10
colorful -s "%1" -b 8 -f 2 
colorful -s " is now usable by sudo with the alias '%~n1'" -f 10
copy "%1" "%folder%/cmds/%~n1.bsh" >nul