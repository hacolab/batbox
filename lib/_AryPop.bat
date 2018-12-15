@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _AryPop
REM - DESC   ) Pop value fomr tail of array
REM - USAGE  ) call _AryPop aryName popedName1 popdName2 ....
REM - IN/OUT )
REM -  IN   %1  : Array name
REM -  OUT  %2* : Pop values from tail of array
REM ----------------------------------------------------------------------
:_AryPop
set _AryPop_name=%1
REM Loop start %2
for %%a in (%*) do (
    if "!%_AryPop_name%.Len!"=="0" (
        goto :exit_func
    )
    if not "%1"=="%%a" (
        call :PopValue %_AryPop_name%[!%_AryPop_name%.Len!] %%a
        set /a %_AryPop_name%.Len=!%_AryPop_name%.Len!-1
    )
)
:exit_func
set _AryPop_name=
exit /b

:PopValue
set %2=!%1!
set %1=
exit /b
