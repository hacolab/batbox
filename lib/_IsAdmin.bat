@echo off
REM ----------------------------------------------------------------------
REM - NAME   ) _IsAdmin
REM - DESC   ) Check executio with admin permission
REM - USAGE  ) call _IsAdmin [return]
REM - IN/OUT )
REM -  OUT  [%1] : Has admin permission (Yes:1, No:0)
REM ----------------------------------------------------------------------
:_IsAdmin
openfiles >nul 2>&1
if "%errorlevel%"=="0" (
    if not "%~1"=="" (
        set %~1=1
    )
    exit /b 0
) else (
    if not "%~1"=="" (
        set %~1=0
    )
    exit /b 1
)