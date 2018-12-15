@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _FnN
REM - DESC   ) Set command output lines to array
REM - USAGE  ) call _FnN CmdName ArrName
REM - IN/OUT )
REM -  IN   %1  : Command name, return value must be output to stdout
REM -  OUT  %2  : Output array name
REM -             When given 'A', set to A[0],A[1],...,and A.Len
REM ----------------------------------------------------------------------
:_FnN
set %~2.Len=0
for /f "usebackq tokens=* delims=" %%z in (`%~1`) do (
    set /a %~2.Len=!%2.Len!+1
    set %~2[!%~2.Len!]=%%z
)
exit /b 0
