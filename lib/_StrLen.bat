@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _StrLen
REM - DESC   ) Get string length
REM - USAGE  ) call _StrLen SourceStr Length
REM - IN/OUT )
REM -  IN   %1  : Source string
REM -  OUT  %2  : String length
REM ----------------------------------------------------------------------
:_StrLen
set i=0
set s=%~1
:Loop
if not "%s%"=="" (
    REM echo %i% : %s%
    set /a i=!i!+1
    set s=%s:~1%
    goto :Loop
)
endlocal && set %2=%i%
exit /b 0
