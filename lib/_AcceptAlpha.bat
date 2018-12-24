@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _AcceptAlpha
REM - DESC   ) Accept user input string
REM - USAGE  ) call _AcceptAlpha "Prompt>" ValName
REM - IN/OUT )
REM -  IN   %1  : Print message
REM -  OUT  %2  : User input string
REM - ERRSTS ) 0:allow user input  1:not allow user input
REM ----------------------------------------------------------------------
:_AcceptAlpha
set /p inputStr="%~1"
echo %inputStr%| findstr /r "^[a-zA-Z]*$" >nul 2>&1
if errorlevel 1 (
    endlocal && set %~2=%inputStr%
    exit /b 1
) else (
    endlocal && set %~2=%inputStr%
    exit /b 0
)