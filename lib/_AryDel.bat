@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _AryDel
REM - DESC   ) Delete array
REM - USAGE  ) call _AryDel
REM - IN/OUT )
REM -  IN   %1  : Delete array name
REM ----------------------------------------------------------------------
:_AryDel
for /l %%a in (1, 1, %1.Len) do (
    set %1[%%a]=
)
set %1.Len=
exit /b