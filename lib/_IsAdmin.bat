@echo off
REM ----------------------------------------------------------------------
REM - NAME   ) _IsAdmin
REM - DESC   ) Check executio with admin permission
REM - USAGE  ) call _IsAdmin [return]
REM - IN/OUT )
REM -  OUT [%1] : Has admin permission (Yes:TRUE, No:FALSE)
REM - ERRSTS ) 0:admin  1:not admin
REM ----------------------------------------------------------------------
:_IsAdmin
openfiles >nul 2>&1
if "%errorlevel%"=="0" (
    goto :is_admin
)
:is_not_admin
if not "%~1"=="" (
    set %~1=FALSE
)
exit /b 1

:is_admin
if not "%~1"=="" (
    set %~1=TRUE
)
exit /b 0
