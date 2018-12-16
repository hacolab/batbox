@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _StrTrimL
REM - DESC   ) Target char trim left
REM - USAGE  ) call _StrTrimL srcStr trimTarget retStr
REM - IN/OUT )
REM -  IN   %1  : Source string
REM -  IN   %2  : Trim target char
REM -  OUT  %3  : Result trimed string
REM ----------------------------------------------------------------------
:_StrTimeL
set s=%~1
set t=%~2
if "%t%"=="" goto :end
:loop_left
if "%s%"=="" goto :end
if "%s:~0,1%"=="%t%" (
    set s=%s:~1%
    goto :loop_left
)
:end
endlocal && set %~3=%s%
exit /b 0