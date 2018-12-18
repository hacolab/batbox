@echo off
REM ----------------------------------------------------------------------
REM - NAME   ) _RestartWithAdmin
REM - DESC   ) Restart command withd amdmin authority(command exit)
REM - USAGE  ) call _RestartWithAdmin BatFilePath
REM - IN/OUT )
REM ----------------------------------------------------------------------
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process "%~f1" -Verb Runas" >nul
if "%errorlevel%"=="0" exit
exit /b