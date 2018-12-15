@echo off
setlocal enabledelayedexpansion

REM Test Main
REM ----------------------------------------
call _NewAry TestData "" AB+s ‚ ‚¢‚¤‚¦o‚¨
call _NewAry TestExpect 0 4 6

for /l %%i in (1, 1, %TestData.Len%) do (
    call _StrLen !TestData[%%i]! retStrLen
    call _TestAssert retStrLen !TestExpect[%%i]! "!TestData[%%i]!"
)

exit /b 0