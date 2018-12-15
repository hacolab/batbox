@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _TrapMsg
REM - DESC   ) Print message when only debug mode(_DEBUG_MODE_=1)
REM - USAGE  ) call _TrapMsg message
REM - IN/OUT )
REM -  IN   %1  : Trap message
REM ----------------------------------------------------------------------
:_TrapMsg
if "%_DEBUG_MODE_%"=="%_TRUE_%" (
    echo %~1 >&2
)
exit /b
