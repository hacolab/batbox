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
set PATH=%~dp0lib;%PATH%
set DEBUG_MODE=1
set ERROR_MSG=""


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
        set ERROR_MSG='%OptType%' is Unknown Option
        goto :SHOW_HELP
    )
    shift
    goto :ANALYZE_OPTIONS
)

REM  Params
REM ----------------------------------------
:ANALYZE_PARAMS
if "%~1"=="" (
    REM no given param
    set ERROR_MSG=No given parameter
    goto :ERROR_HELP_EXIT
) else (
    REM given param
    call DebugMsg DebugMsg ParamTemp
    call AssertNeq AssertNeq ParamTemp OK
    call AssertEq AssertEq ParamTemp NG
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
call PrintHelp "%~dpnx0"
goto :EXIT_SUCCESS
