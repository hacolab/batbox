@echo off
setlocal enabledelayedexpansion
call _InitColors

REM Test Main
REM ----------------------------------------
set TestData1=0123456789ABCDEFG
call _AryNew TestParamPos1   0 0   0  -1 -1 -1  -3      10      10      10
call _AryNew TestParamSize1  0 1   2   0  1  2   2     100      -1 
call _AryNew TestExpect1    "" 0  01  ""  G  G  EF  ABCDEFG ABCDEF ABCDEFG

echo Source: %TestData1%
for /l %%i in (1, 1, %TestParamPos1.Len%) do (
    call _StrSub %TestData1% "!TestParamPos1[%%i]!" !TestParamSize1[%%i]! retStrSub
    call _TestAssert retStrSub !TestExpect1[%%i]! "No.%%i  start:!TestParamPos1[%%i]! len:!TestParamSize1[%%i]!"
)

exit /b 0