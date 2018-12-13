@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) StrLen
REM - DESC   ) get string length
REM - USAGE  ) call StrLen SourceStr Length
REM - IN/OUT )
REM -  IN   %1  : source string
REM -  OUT  %2  : string length
REM ----------------------------------------------------------------------
:StrLen
set _StrLen_i=0
set _StrLen_s=%~1
:Loop
if not "%_StrLen_s%"=="" (
    REM echo %_StrLen_i% : %_StrLen_s%
    set /a _StrLen_i=!_StrLen_i!+1
    set _StrLen_s=%_StrLen_s:~1%
    goto :Loop
)
set %2=%_StrLen_i%
set _StrLen_i=
set _StrLen_s=
REM echo !%2!
exit /b 0
