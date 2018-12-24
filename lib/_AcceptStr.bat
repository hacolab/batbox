@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _AcceptStr
REM - DESC   ) Accept user input string
REM - USAGE  ) call _AcceptStr [AllowPattern] "Prompt>" ValName
REM - IN/OUT )
REM -  IN  [%1] : Allow string pattern
REM -  IN   %2  : Print message
REM -  OUT  %3  : User input string
REM - ERRSTS ) 0:allow user input  1:not allow user input
REM ----------------------------------------------------------------------
:_AcceptStr
if "%~3"=="" (
    set /p inputStr="%~1"
    endlocal && set %~2=!inputStr!
    exit /b 0
)

set pattern=%~1
set /p inputStr="%~2"
echo %inputStr%| findstr /r "%pattern%" >nul 2>&1
if errorlevel 1 (
    endlocal && set %~3=%inputStr%
    exit /b 1
) else (
    endlocal && set %~3=%inputStr%
    exit /b 0
)