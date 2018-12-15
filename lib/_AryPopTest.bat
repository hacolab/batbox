@echo off
setlocal enabledelayedexpansion
call _InitColors

REM Test Main
REM ----------------------------------------
call _CEcho "[Made array elements]" %_CS_WHITE%
call _AryNew TestAry 0 1 2 ABC DEFG
call _AryEcho TestAry

call _CEcho "[Poped array elements]" %_CS_WHITE%
call _AryPop TestAry popVal1
call _AryPop TestAry popVal2 popVal3 popVal4
call _AryEcho TestAry

call _TestAssert TestAry[0] "" NewPushTest
call _TestAssert TestAry[1] 0
call _TestAssert TestAry[2] ""
call _TestAssert TestAry[3] ""
call _TestAssert TestAry[4] ""
call _TestAssert TestAry[5] ""
call _TestAssert TestAry.Len 1
call _TestAssert popVal1 DEFG
call _TestAssert popVal2 ABC
call _TestAssert popVal3 2
call _TestAssert popVal4 1

call _AryPop TestAry popVal5
call _TestAssert TestAry[1] ""
call _TestAssert TestAry.Len 0

call _AryPop TestAry popVal6
call _TestAssert TestAry[0] ""
call _TestAssert popVal6 ""
call _TestAssert TestAry.Len 0
exit /b 0

REM Test Helper Functions
REM ----------------------------------------
