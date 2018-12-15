@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _AryNew
REM - DESC   ) Make array
REM - USAGE  ) call _AryNew aryName param1 param2 ....
REM - IN/OUT )
REM -  IN   %1  : Make array name
REM -  IN   %2* : Set values to array
REM ----------------------------------------------------------------------
:_AryNew
set %1.Len=0
for %%a in (%*) do (
    set %1[!%1.Len!]=%%a
    set /a %1.Len=!%1.Len!+1
)
if not !%1.Len!==0 (
    REM delete %1(array name)
    set %1[0]=
    set /a %1.Len=!%1.Len!-1
)
exit /b