@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _IndexOfChar
REM - DESC   ) Set char found index in string, search start from left
REM - USAGE  ) call _IndexOfChar SourceStr SearchChar FoundIndex
REM - IN/OUT )
REM -  IN   %1  : Source string
REM -  IN   %2  : Target char
REM -  OUT  %3  : Out variable name, set found index,
REM -             start 1, if not found set -1
REM ----------------------------------------------------------------------
:_IndexOfChar
set i=0
set s=%~1
set ret=-1
:loop
set c=%s:~0,1%
if not "%s%"=="" (
    REM echo %i% : %s% : %c% : %~2
    if "%c%"=="%~2" (
        set ret=%i%
        goto :loop_end
    )
    set /a i=!i!+1
    set s=%s:~1%
    goto :loop
)
:loop_end
REM echo !%3!
setlocal && set %~3=%ret%
exit /b 0
