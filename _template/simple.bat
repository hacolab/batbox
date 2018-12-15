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
set DEBUG_MODE=1
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
if not "%~1"=="" (
    REM given param
    call _DebugEchoV DebugMsg ParamTemp
    call _AssertNeq AssertNeq ParamTemp OK
    call _AssertEq AssertEq ParamTemp NG
    echo hear:%~dp0
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
