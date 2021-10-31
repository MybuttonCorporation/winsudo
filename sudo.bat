
@ECHO OFF
IF NOT EXIST "%~dp0!.bat" (
  if "%1"=="--i" (
    colorful -s "[sudo] -> self-elevating..." -f 13 -n
    install
    colorful -s "[sudo] -> Installation complete; sudo is now usable." -f 13 -n
    exit /b
  ) 
  colorful -s "[sudo] -> You need to install sudo dependencies first." -f 4 -n
    colorful -s "[sudo] -> Run 'sudo --i'" -f 13 -n
  exit /b
)

IF "%~1" == "" (
colorful -s "[sudo] -> No arguements provided." -f 4
exit/b
)

 colorful -s "[sudo] -> Invoking @linux/structure/_sudo.bsh " -f 14 -n
  colorful -s "[sudo] -> Invoking @linux/structure/_bash.run" -f 14 -n
    colorful -s "[sudo] -> Invoking @linux/structure/_registry" -f 14 -n
    echo.
    colorful -s "[sudo] -> Invoking @windir/_sys/sudo.bsh" -f 14 -n
      colorful -s "[sudo] -> Running Command " -f 14 
 colorful -s "%*" -b 8 -f 2 -n
if [%1]==[elevate] (
        colorful -s "[sudo] -> Elevating Terminal" -f 14 -n
      colorful -s "[sudo] -> Invoking elevate.stc" -f 14 
    elevate;
)
if [%1]==[help] (
  color 5
        colorful -s "[sudo] -> Help" -f 14 -n
      colorful -s "[sudo] -> sudo.bin.__help__.display();\n" -f 14 -e -n
    type help
    timeout 1 >Nul
    color 0f
exit/b
)
if NOT "%~9"=="" (
  colorful -s "[sudo] -> parameter limit reached. can not execute '%1' with arguements more than 7." -f 4 -n
exit /b
)


if EXIST "%sudopath%\sudo\cmds\%1.bsh" (
    if exist sudo\ran\%1.bat del sudo\ran\%1.bat
    copy sudo\cmds\%1.bsh sudo\ran\%1.bat >nul

    sudo\ran\%1.bat %2 %3 %4 %5 %6 %7 %8

)
echo. 
colorful -s "[sudo] -> unable to find command." -f 4 -n
exit /b
:eof