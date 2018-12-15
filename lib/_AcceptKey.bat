@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _AcceptKey
REM - DESC   ) wait user press aceept key
REM - USAGE  ) call _AcceptKey abBc "Prompt>" KeyValName
REM -          if user press key is 'B', set 3 to KeyValName
REM - IN/OUT )
REM -  IN   %1  : accept keys (case-sensitive)
REM -  IN   %2  : print message
REM -  OUT  %3  : user press key number (order of %1, start 1)
REM ----------------------------------------------------------------------
:_AcceptKey
choice /N /CS /C %~1 /M "%~2"
set %~3=%ERRORLEVEL%
exit /b 0
