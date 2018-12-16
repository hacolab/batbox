@echo off
setlocal enabledelayedexpansion
call _InitColors

REM Test Main
REM ----------------------------------------
call _AryNew TestAry hello world @batbox %1

call _CEcho "[Made array elements]" CS_WHITE
call _AryEcho TestAry

call _TestAssert TestAry[0] "" NewArrayTest
call _TestAssert TestAry[1] hello 
call _TestAssert TestAry[2] world 
REM call _TestAssert TestAry[2] World 
call _TestAssert TestAry[3] @batbox
call _TestAssert TestAry[4] ""
call _TestAssert TestAry.Len 3
exit /b 0

REM Test Helper Functions
REM ----------------------------------------
