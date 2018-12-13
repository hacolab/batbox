@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) IndexOfChar
REM - DESC   ) set char found index in string, search start from left
REM - USAGE  ) call IndexOfChar SourceStr SearchChar FoundIndex
REM - IN/OUT )
REM -  IN   %1  : source string
REM -  IN   %2  : target char
REM -  OUT  %3  : out variable name, set found index, 
REM -             start 0, if not found set -1
REM ----------------------------------------------------------------------
:IndexOfChar
set _IndexOfChar_i=0
set _IndexOfChar_s=%~1
set %~3=-1
:Loop
set _IndexOfChar_c=%_IndexOfChar_s:~0,1%
if not "%_IndexOfChar_s%"=="" (
    REM echo %_IndexOfChar_i% : %_IndexOfChar_s% : %_IndexOfChar_c% : %~2
    if "%_IndexOfChar_c%"=="%~2" (
        set %~3=%_IndexOfChar_i%
        goto :LoopEnd
    )
    set /a _IndexOfChar_i=!_IndexOfChar_i!+1
    set _IndexOfChar_s=%_IndexOfChar_s:~1%
    goto :Loop
)
:LoopEnd
set _IndexOfChar_i=
set _IndexOfChar_s=
set _IndexOfChar_c=
REM echo !%3!
exit /b 0
