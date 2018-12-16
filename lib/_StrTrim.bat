@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _StrTrim
REM - DESC   ) Target char trim left right
REM - USAGE  ) call _StrTrim srcStr trimTarget retStr
REM - IN/OUT )
REM -  IN   %1  : Source string
REM -  IN   %2  : Trim target char
REM -  OUT  %3  : Result trimed string
REM ----------------------------------------------------------------------
:_StrTime
set s=%~1
set t=%~2
if "%t%"=="" goto :end
:loop_left
if "%s%"=="" goto :end
if "%s:~0,1%"=="%t%" (
    set s=%s:~1%
    goto :loop_left
)
:loop_right
if "%s%"=="" goto :end
if "%s:~-1,1%"=="%t%" (
    set s=%s:~0,-1%
    goto :loop_right
)
:end
endlocal && set %~3=%s%
exit /b 0