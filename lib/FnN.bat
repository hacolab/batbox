@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) FnN
REM - DESC   ) set command output values to array
REM - USAGE  ) call FnN CmdName ArrName
REM - IN/OUT )
REM -  IN   %1  : call command name, return value must be output to stdout
REM -  OUT  %2  : output array name
REM -             when given 'A', set to A[0],A[1],...
REM -  OUT  %3  : output array length
REM ----------------------------------------------------------------------
:FnN
set _FnN_n=0
for /f "usebackq tokens=* delims=" %%z in (`%~1`) do (
    set %~2[!_FnN_n!]=%%z
    set /a _FnN_n=_FnN_n+1
)
set %~3=%_FnN_n%
exit /b 0
