@echo off
setlocal enabledelayedexpansion
call _InitColors

REM Test Main
REM ----------------------------------------
set SrouceText="\C:\path\, dir\"
call _AryNew TestData1 \ : " " +
call _AryNew TestExpect1L "\C:\path\, dir" "\C" "\C:\path\," ""
call _AryNew TestExpect1R "" "\path\, dir\" "dir\" ""
call _AryNew TestExpect1Len 2 2 2 0

for /l %%i in (1, 1, %TestData1.Len%) do (
    call _StrSplitR %SrouceText% !TestData1[%%i]! retAry
    call _TestAssert retAry[1] !TestExpect1L[%%i]! "!TestData1[%%i]!"
    call _TestAssert retAry[2] !TestExpect1R[%%i]!
    call _TestAssert retAry.Len !TestExpect1Len[%%i]!
    REM echo !retAry[1]! @ !retAry[2]! @ !retAry.Len!
)

call _StrSplitR "" "" retAry
call _TestAssert retAry[1] "" "SourceNone"
call _TestAssert retAry[2] ""
call _TestAssert retAry.Len 0

exit /b 0