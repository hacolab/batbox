@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _TrapMsg
REM - DESC   ) Print message for stderr, only trap mode(_TRAP_MODE_=_ON)
REM - USAGE  ) call _TrapMsg message
REM - IN/OUT )
REM -  IN   %1  : Trap message
REM ----------------------------------------------------------------------
:_TrapMsg
if "%_TRAP_MODE_%"=="%_ON%" (
    echo %~1 >&2
)
exit /b
