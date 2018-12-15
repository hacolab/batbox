@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _AryEcho
REM - DESC   ) Echo array elements for stdout
REM - USAGE  ) call _AryEcho AryName ....
REM - IN/OUT )
REM -  IN   %1  : Array name
REM ----------------------------------------------------------------------
:_AryEcho
REM echo Len: !%1.Len!
for /l %%i in (1, 1, !%1.Len!) do (
    echo !%1[%%i]!
)
exit /b