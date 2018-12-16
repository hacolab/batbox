@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _StrRepeat
REM - DESC   ) Make repeat string
REM - USAGE  ) call _StrRepeat repeatStr count retStr
REM - IN/OUT )
REM -  IN   %1  : Source string
REM -  IN   %2  : Repeat count
REM -  OUT  %3  : retrun str
REM ----------------------------------------------------------------------
:_StrRepeat
set s=%1
set retStr=
for /l %%i in (1, 1, %~2) do (
    set retStr=!retStr!%s%
)
endlocal && set %3=%retStr%
exit /b 0
