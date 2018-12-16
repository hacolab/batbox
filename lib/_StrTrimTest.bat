@echo off
setlocal enabledelayedexpansion
call _InitColors

REM Test Main
REM ----------------------------------------
call _AryNew TestData    "    0 123 4  "  " 0923 "  "abceADEAAA"  "0923"  "あいうえおかああ"  ""
call _AryNew TestParam   " "              "0"       "A"           ""      "あ"               ""
call _AryNew TestExpect      "0 123 4"    " 0923 "  "abceADE"     "0923"    "いうえおか"      ""
call _AryNew TestExpectL     "0 123 4  "  " 0923 "  "abceADEAAA"  "0923"    "いうえおかああ"  ""
call _AryNew TestExpectR "    0 123 4"    " 0923 "  "abceADE"     "0923"  "あいうえおか"      ""

call _CEcho "[_StrTrime]" FS_YELLOW
echo ========================================
for /l %%i in (1, 1, %TestData.Len%) do (
    call _StrTrim !TestData[%%i]! !TestParam[%%i]! retStr
    call _TestAssert retStr !TestExpect[%%i]! "No.%%i src:!TestData[%%i]!  trim:!TestParam[%%i]!"
)
echo.

call _CEcho "[_StrTrimeL]" FS_YELLOW
echo ========================================
for /l %%i in (1, 1, %TestData.Len%) do (
    call _StrTrimL !TestData[%%i]! !TestParam[%%i]! retStr
    call _TestAssert retStr !TestExpectL[%%i]! "No.%%i src:!TestData[%%i]!  trim:!TestParam[%%i]!"
)
echo.

call _CEcho "[_StrTrimeR]" FS_YELLOW
echo ========================================
for /l %%i in (1, 1, %TestData.Len%) do (
    call _StrTrimR !TestData[%%i]! !TestParam[%%i]! retStr
    call _TestAssert retStr !TestExpectR[%%i]! "No.%%i src:!TestData[%%i]!  trim:!TestParam[%%i]!"
)
echo.

exit /b 0