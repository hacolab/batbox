@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _DebugEchoV
REM - DESC   ) Print Variable "Name:Value" when only debug mode(DEBUG_MODE=1)
REM - USAGE  ) call _DebugEchoV [DebugMsg] VarName
REM - IN/OUT )
REM -  IN  [%1] : Header message
REM -  IN   %2  : Variable name
REM ----------------------------------------------------------------------
:_DebugEchoV
if "%DEBUG_MODE%"=="1" (
    if "%~2"=="" (
        echo %1:!%1! >&2
    ) else (
        echo [%1] %2:!%2! >&2
    )
)
exit /b
