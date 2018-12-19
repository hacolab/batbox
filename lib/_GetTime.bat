@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _GetTime
REM - DESC   ) Get date string
REM - USAGE  ) call _GetTime HMS sep retStr
REM - IN/OUT )
REM -  IN   %1  : Get type symbol HMS,HM,MS,H,M,S
REM -  IN   %2  : Separator
REM -  OUT  %3  : 01:56:22,01:56,56:22,01,56,22
REM ----------------------------------------------------------------------
:_GetTime
set full=%time: =0%
set type=%~1
set sep=%~2

if "%type%"=="HMS" (
    set result=!full:~0,8!
    set result=!result::=%sep%!
) else if "%type%"=="HM" (
    set result=!full:~0,2!!sep!!full:~3,2!
) else if "%type%"=="MS" (
    set result=!full:~3,2!!sep!!full:~6,2!
) else if "%type%"=="H" (
    set result=!full:~0,2!
) else if "%type%"=="M" (
    set result=!full:~3,2!
) else if "%type%"=="S" (
    set result=!full:~6,2!
)

endlocal && set %3=%result%
exit /b
