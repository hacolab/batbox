@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _NewAry
REM - DESC   ) Make Array
REM - USAGE  ) call _NewAry AryName Param1 Param2 ....
REM - IN/OUT )
REM -  IN   %1  : Make array name
REM -  IN   %2* : Set params to array
REM ----------------------------------------------------------------------
:_NewAry
set /a %1.Len=0
for %%a in (%*) do (
    set %1[!%1.Len!]=%%a
    set /a %1.Len=!%1.Len!+1
)
if not !%1.Len!==0 (
    REM delete array name
    set %1[0]=
    set /a %1.Len=!%1.Len!-1
)
exit /b