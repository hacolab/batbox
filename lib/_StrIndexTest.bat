@echo off
setlocal enabledelayedexpansion
call _InitColors

REM Test Main
REM ----------------------------------------
set SrouceText="\C:\path\, dir\"
call _AryNew TestData \ : "," " " + c
call _AryNew TestExpect 0 2 9 10 -1 -1

for /l %%i in (1, 1, %TestData.Len%) do (
    call _StrIndex %SrouceText% !TestData[%%i]! retIndex
    call _TestAssert retIndex "!TestExpect[%%i]!" "!TestData[%%i]!"
)

exit /b 0