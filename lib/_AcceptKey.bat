@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _AcceptKey
REM - DESC   ) Accept user press key
REM - USAGE  ) call _AcceptKey abBc "Prompt>" KeyValName
REM -          if user press key is 'B', set B to KeyValName
REM - IN/OUT )
REM -  IN   %1  : Accept keys (case-sensitive)
REM -  IN   %2  : Print message
REM -  OUT  %3  : User press key charator
REM - ERRSTS ) 0:allways
REM ----------------------------------------------------------------------
:_AcceptKey
set keys=%~1
choice /N /CS /C %keys% /M "%~2"
set /a n=%ERRORLEVEL%-1
set pressedKey=!keys:~%n%,1!
endlocal && set %~3=%pressedKey%
exit /b 0