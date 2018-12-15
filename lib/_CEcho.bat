@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _CEcho
REM - DESC   ) colorful string echo
REM - USAGE  ) call _CEcho string withColorStr colorIndex
REM - IN/OUT )
REM -  IN   %1  : echo all string
REM -  IN   %2  : color string
REM -  IN   %2* : color index (_Cx_COLORNAME :see _InitColors.bat)
REM ----------------------------------------------------------------------
:_CEcho
set echoText=%~1
set colorCode=!_COLOR_CODE[%3]!
set echoText=!echoText:%~2=%colorCode%%~2%_COLOR_RESET%!
echo %echoText%
exit /b