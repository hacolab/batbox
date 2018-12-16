@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _StrTrimR
REM - DESC   ) Target char trim right
REM - USAGE  ) call _StrTrimR srcStr trimTarget retStr
REM - IN/OUT )
REM -  IN   %1  : Source string
REM -  IN   %2  : Trim target char
REM -  OUT  %3  : Result trimed string
REM ----------------------------------------------------------------------
:_StrTimeR
set s=%~1
set t=%~2
if "%t%"=="" goto :end
:loop_right
if "%s%"=="" goto :end
if "%s:~-1,1%"=="%t%" (
    set s=%s:~0,-1%
    goto :loop_right
)
:end
endlocal && set %~3=%s%
exit /b 0