@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _TestAssert
REM - DESC   ) Execute assertion when only debug mode(DEBUG_MODE=1)
REM -          if !%2!==%3, print OK and errorlevel is 0
REM -          else, print NG and errorlevel is 1
REM - USAGE  ) call _TestAssert VarName ExpectVal [message]
REM - IN/OUT )
REM -  IN   %1  : variable name
REM -  IN   %2  : expect value
REM -  IN  [%3] : test description message
REM ----------------------------------------------------------------------
:_TestAssert
if not "%~3%"=="" (
    call _CEcho "[%~3]" FS_WHITE
)
if "!%~1!"=="%~2" (
    call _CEcho " [OK](%1) EvsA^: '%~2' vs '!%~1!'" OK FS_GREEN
    set retVal=0
) else (
    call _CEcho " [NG](%1) EvsA^: '%~2' vs '!%~1!'" NG FS_RED
    set retVal=1
)
exit /b %retVal%
