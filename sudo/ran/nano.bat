setlocal EnableDelayedExpansion

set "selected_option=Start"
:choose
cls

colorful -s "-> %selected_option% <-" -f 13 -n
colorful -s "[x] Next Option " -f 2 -n
colorful -s "[s] Select " -f 2 -n
choice /cs /c xs /m "> " /N
if "%errorlevel%"=="1" (
    if "%selected_option%"=="Stop" set "selected_option=Start"
    if "%selected_option%"=="Start" set "selected_option=Stop"
    goto choose
)
    if "%selected_option%"=="Stop" (
        taskkill /f /im MybuttonDash.exe
    )
    if "%selected_option%"=="Start" (
        for %%i in ("%~dp0.") do set "folder=%%~fi"
       
        start "NANO" "%folder%\nano-data\MybuttonDash.exe"
        goto choose
    )
    