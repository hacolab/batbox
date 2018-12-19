@echo off
REM ----------------------------------------------------------------------
REM - NAME   ) _RestartAdmin
REM - DESC   ) Restart command withd amdmin authority(command exit)
REM - USAGE  ) call _RestartAdmin BatFilePath
REM - IN/OUT )
REM ----------------------------------------------------------------------
:_RestartAdmin
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process "%~f1" -Verb Runas" >nul
if "%errorlevel%"=="0" exit
exit /b