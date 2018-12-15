@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _AssertEq
REM - DESC   ) Execute assertion when only debug mode(DEBUG_MODE=1)
REM -          if !%2!==%3, print value and pause
REM - USAGE  ) call _AssertEq Msg VarName ExpectVal
REM - IN/OUT )
REM -  IN   %1  : assert message
REM -  IN   %2  : variable name
REM -  IN   %3  : expect value
REM ----------------------------------------------------------------------
:_AssertEq
if "%DEBUG_MODE%"=="1" (
    if "!%~2!"=="%~3" (
        echo [%~1] %2:"!%~2!" vs "%~3" >&2
        REM echo continue press any key >&2
        pause >nul
    )
)
exit /b
