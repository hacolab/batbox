@echo off
setlocal enabledelayedexpansion
call _InitColors

REM Test Main
REM ----------------------------------------
call _CEcho "[Made array elements]" CS_WHITE
call _AryNew TestAry 0 1 2
call _AryEcho TestAry

call _CEcho "[Pushed array elements]" CS_WHITE
call _AryPush TestAry 3
call _AryPush TestAry
call _AryPush TestAry 4 5 6 hey +
call _AryPush TestAry
call _AryEcho TestAry

call _TestAssert TestAry[0] "" NewPushTest
call _TestAssert TestAry[1] 0 
call _TestAssert TestAry[2] 1
call _TestAssert TestAry[3] 2
call _TestAssert TestAry[4] 3
call _TestAssert TestAry[5] 4
call _TestAssert TestAry[6] 5
call _TestAssert TestAry[7] 6
call _TestAssert TestAry[8] hey
call _TestAssert TestAry[9] +
call _TestAssert TestAry[10] ""
call _TestAssert TestAry.Len 9
exit /b 0

REM Test Helper Functions
REM ----------------------------------------
