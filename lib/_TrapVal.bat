@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _TrapVal
REM - DESC   ) Print Variable "Name:Value" when only debug mode(_DEBUG_MODE_=1)
REM - USAGE  ) call _TrapVal [message] VarName
REM - IN/OUT )
REM -  IN  [%1] : Header message
REM -  IN   %2  : Variable name
REM ----------------------------------------------------------------------
:_TrapVal
if "%_DEBUG_MODE_%"=="%_TRUE_%" (
    if "%~2"=="" (
        echo %1:!%1! >&2
    ) else (
        echo [%1] %2:!%2! >&2
    )
)
exit /b
