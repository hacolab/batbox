@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _TrapPauseNeq
REM - DESC   ) Execute assertion when only debug mode(_DEBUG_MODE_=1)
REM -          if not !%2!==%3, print value and pause
REM - USAGE  ) call _TrapPauseNeq Msg VarName ExpectVal
REM - IN/OUT )
REM -  IN   %1  : Assert message
REM -  IN   %2  : Variable name
REM -  IN   %3  : Expect value
REM ----------------------------------------------------------------------
:_TrapPauseNeq
if "%_DEBUG_MODE_%"=="1" (
    if not "!%~2!"=="%~3" (
        echo [%~1] %2:"!%~2!" vs "%~3" >&2
        REM echo continue press any key >&2
        pause >nul
    )
)
exit /b