@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _GetDate
REM - DESC   ) Get date string
REM - USAGE  ) call _GetDate YMD sep retStr
REM - IN/OUT )
REM -  IN   %1  : Get type symbol YMD,YM,MD,Y,M,D
REM -  IN   %2  : Separator
REM -  OUT  %3  : 2018/12/20,2018/12,12/20,2018,12,20
REM ----------------------------------------------------------------------
:_GetDate
set full=%date%
set type=%~1
set sep=%~2

if "%type%"=="YMD" (
    set result=!full:/=%sep%!
) else if "%type%"=="YM" (
    set result=!full:~0,4!!sep!!full:~5,2!
) else if "%type%"=="MD" (
    set result=!full:~5,2!!sep!!full:~8,2!
) else if "%type%"=="Y" (
    set result=!full:~0,4!
) else if "%type%"=="M" (
    set result=!full:~5,2!
) else if "%type%"=="D" (
    set result=!full:~8,2!
)

endlocal && set %3=%result%
exit /b
