@echo off
setlocal enabledelayedexpansion

REM Test Main
REM ----------------------------------------
set SrouceText="\C:\path\, dir\"
call _NewAry TestData \ : "," " " + c
call _NewAry TestExpect 14 2 9 10 -1 -1

for /l %%i in (1, 1, %TestData.Len%) do (
    call _LastIndexOfChar %SrouceText% !TestData[%%i]! retIndex
    call _TestAssert retIndex "!TestExpect[%%i]!" "!TestData[%%i]!"
)

exit /b 0