@echo off
setlocal enabledelayedexpansion
REM initial defines
call _InitColors

REM Test messages
set COLOR_NAME[0]=BLACK
set COLOR_NAME[1]=RED
set COLOR_NAME[2]=GREEN
set COLOR_NAME[3]=YELLOW
set COLOR_NAME[4]=BLUE
set COLOR_NAME[5]=PUPLE
set COLOR_NAME[6]=AQUA
set COLOR_NAME[7]=WHITE
set DECO_MODE[0]=FGCOLOR
set DECO_MODE[1]=BGCOLOR
set DECO_MODE[2]=FGaSTRG
set DECO_MODE[3]=FGaUNDR
set DECO_MODE[4]=RESET

REM Test Data
if "%~1"=="" (
    set SourceText=ABCabcDEFGHIJKLMNABCDefg
) else (
    set SourceText=%1
)
if "%~2"=="" (
    set ColorText=AB
) else (
    set ColorText=%2
)

REM Test Doing
call :DoTest "%SourceText%" "%ColorText%"
exit /b

REM Main Test Functions
:DoTest
echo LEN:%_COLOR_CODE.Len%
for /l %%i in (1, 1, %_COLOR_CODE.Len%) do (
    call :GetColorName %%i colorName
    call _CEcho %%i:!colorName! !colorName! %%i
    call _CEcho "  Target:%~2 from %~1" "%~2" %%i
)
call _CEcho REDCOLOR COLOR 2
echo normal echo

call _CEcho REDCOLOR COLOR 2
call _CEcho RESETCOLOR COLOR _C_RESET
exit /b

REM Test Helper Functions
:GetColorName
setlocal enabledelayedexpansion
set /a Idx=%1-1
set /a nameIdx=%Idx%%%8
set /a modeIdx=%Idx%/8
set colorName=!COLOR_NAME[%nameIdx%]!_!DECO_MODE[%modeIdx%]!
REM echo %nameIdx%-%modeIdx% : %colorName%
endlocal && set %2=%colorName%
exit /b 0
