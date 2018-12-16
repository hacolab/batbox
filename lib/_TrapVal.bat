@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _TrapVal
REM - DESC   ) Print "VarName:Value" for stderr, only debug mode(_TRAP_MODE_=_ON)
REM - USAGE  ) call _TrapVal [message] VarName
REM - IN/OUT )
REM -  IN  [%1] : Header message
REM -  IN   %2  : Variable name
REM ----------------------------------------------------------------------
:_TrapVal
if "%_TRAP_MODE_%"=="%_ON%" (
    if "%~2"=="" (
        echo %1:!%1! >&2
    ) else (
        echo [%1] %2:!%2! >&2
    )
)
exit /b
