@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) LastIndexOfChar
REM - DESC   ) set char last found index in string, search start from left
REM - USAGE  ) call LastIndexOfChar SourceStr SearchChar FoundIndex
REM - IN/OUT )
REM -  IN   %1  : source string
REM -  IN   %2  : target char
REM -  OUT  %3  : out variable name, set found index, 
REM -             start 0, if not found set -1
REM ----------------------------------------------------------------------
:LastIndexOfChar
set _LastIndexOfChar_i=0
set _LastIndexOfChar_s=%~1
set %~3=-1
:Loop
set _LastIndexOfChar_c=%_LastIndexOfChar_s:~0,1%
if not "%_LastIndexOfChar_s%"=="" (
    REM echo %_LastIndexOfChar_i% : %_LastIndexOfChar_s% : %_LastIndexOfChar_c% : %~2
    if "%_LastIndexOfChar_c%"=="%~2" (
        set %~3=%_LastIndexOfChar_i%
    )
    set /a _LastIndexOfChar_i=!_LastIndexOfChar_i!+1
    set _LastIndexOfChar_s=%_LastIndexOfChar_s:~1%
    goto :Loop
)
:LoopEnd
set _LastIndexOfChar_i=
set _LastIndexOfChar_s=
set _LastIndexOfChar_c=
REM echo !%3!
exit /b 0
