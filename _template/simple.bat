@echo off
setlocal enabledelayedexpansion
REM ###########################################################################
REM # [NAME]    : %~nx0
REM # [VERSION] : 0.01
REM # [USAGE]   : %~nx0 [/?]
REM # [DESCRIPTION]
REM #  please write this batch script description...
REM # 
REM # [PARAMS]
REM #   %1      : 
REM # 
REM # [OPTIONS]
REM #   /?      : Show command help
REM # 
REM ###########################################################################
REM ======================================================================
REM = Environment Configs
REM ======================================================================
set PATH=%~dp0..\lib;%PATH%

call _InitBatBox DEBUG_ON COLOR_ON

set ErrMsg=""


REM ======================================================================
REM = Check Command Params 
REM ======================================================================
REM  Options
REM ----------------------------------------
:ANALYZE_OPTIONS
if "%~1"=="" goto :ANALYZE_PARAMS
set ParamTemp=%~1
set OptType=%ParamTemp:~1,1%
if "%ParamTemp:~0,1%"=="/" (
    if "%OptType%"=="?" (
        goto :SHOW_HELP
    ) else (
        set ErrMsg='%OptType%' is Unknown Option
        goto :SHOW_HELP
    )
    shift
    goto :ANALYZE_OPTIONS
)

REM  Params
REM ----------------------------------------
:ANALYZE_PARAMS
REM if not "%~1"=="" (
REM     REM given param
REM     call _TrapVal YourInputParam ParamTemp
REM     call _TrapPauseNeq TrapPauseNeq ParamTemp OK
REM     call _TrapPauseEq TrapPauseEq ParamTemp NG
REM     REM call _CEcho hear %_CS_BLUE%
REM )
REM call _InitColors
REM call _CEcho "[OK]Hello World" %~1 CS_GREEN
REM call _CEcho "[OK]Hello World" CS_RED
REM set param=%~1
REM call _TestAssert param %~1
for /f "usebackq tokens=* delims=" %%i in (`dir /s /b lib\*Test.bat`) do (
    echo ===========================================================
    echo FILE: %%i
    echo ===========================================================
    call %%i
    echo .
)


REM ======================================================================
REM = Main Process
REM ======================================================================
:MAIN_PROCESS
REM  
REM ----------------------------------------


REM  Success process exit
REM ----------------------------------------
:EXIT_SUCCESS
exit /b 0


REM ======================================================================
REM = Sub Process
REM ======================================================================
REM  Print usage and exit
REM ----------------------------------------
:SHOW_HELP
call _PrintHelp "%~dpnx0"
goto :EXIT_SUCCESS
