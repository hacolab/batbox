@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _CEcho
REM - DESC   ) Echo colorful text
REM - USAGE  ) Call _CEcho string [subStr] colorSymbol
REM - IN/OUT )
REM -  IN   %1  : Echo string
REM -  IN  [%2] : Substring with coloring echo (default: %1 all)
REM -  IN   %3  : Color Symbol (Cx_COLORNAME :See _InitColors.bat)
REM - TODO!  ) Support case-insensitive
REM ----------------------------------------------------------------------
:_CEcho
set echoText=%~1
if not "%~3"=="" (
    call :Replace echoText "%~2" "!_COLOR_CODE[%~3]!%~2!_COLOR_RESET!"
) else (
    set echoText=!_COLOR_CODE[%~2]!!echoText!!_COLOR_RESET!
)
echo %echoText%
exit /b

:Replace
set allStr=!%~1!
set beforeStr=%~2
set afterStr=%~3
set %~1=!allStr:%~2=%~3!
exit /b