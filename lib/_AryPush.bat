@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _AryPush
REM - DESC   ) Push value to tail of array
REM - USAGE  ) call _AryPush aryName param1 param2 ....
REM - IN/OUT )
REM -  IN   %1  : Array name
REM -  IN   %2* : Push values to tail of array
REM ----------------------------------------------------------------------
:_AryPush
set _AryPush_name=%1
REM Loop start %2
for %%a in (%*) do (
    if not "%1"=="%%a" (
        set /a %_AryPush_name%.Len=!%_AryPush_name%.Len!+1
        set %_AryPush_name%[!%_AryPush_name%.Len!]=%%a
    )
)
set _AryPush_name=
exit /b