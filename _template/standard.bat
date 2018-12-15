@echo off
setlocal enabledelayedexpansion
REM ###########################################################################
REM # [NAME]    : %~nx0
REM # [VERSION] : 0.01
REM # [USAGE]   : %~nx0 [/?][/V][U]
REM # [DESCRIPTION]
REM #  please write this batch script description...
REM # 
REM # [PARAMS]
REM #   %1      : 
REM # 
REM # [OPTIONS]
REM #   /?      : Show command help
REM #   /V      : Show command version
REM #   /U      : Set output encode 'UTF8'
REM # 
REM ###########################################################################
REM ======================================================================
REM = Environment Configs
REM ======================================================================
REM  Add dependence path to %PATH%
REM ----------------------------------------
set PATH=%~dp0lib;%PATH%

REM  If set 1, enable debug mode
REM ----------------------------------------
set DEBUG_MODE=1


REM ======================================================================
REM = Initial Process
REM ======================================================================
:INIT_PROCESS
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
    ) else if "%OptType%"=="V" (
        goto :SHOW_VERSION
    ) else if "%OptType%"=="U" (
        REM set code page UTF8
        chcp 65001 >nul
    ) else (
        set ErrMsg='%OptType%' is Unknown Option
        goto :ERROR_HELP_EXIT
    )
    shift
    goto :ANALYZE_OPTIONS
)

REM  Params
REM ----------------------------------------
:ANALYZE_PARAMS
if "%~1"=="" (
    REM no given param
    set ErrMsg=No given parameter
    goto :ERROR_HELP_EXIT
) else (
    REM given param
    call _DebugEchoV DebugMsg ParamTemp
    call _AssertNeq AssertNeq ParamTemp OK
    call _AssertEq AssertEq ParamTemp NG
)


REM ======================================================================
REM = Main Process
REM ======================================================================
set ExecCmd[1]=goto :EXIT_SUCCESS
set ExecCmd[2]=call _PrintHelp "%~dpnx0"
set ExecCmd[3]=call _PrintVersion "%~dpnx0"
:MAIN_PROCESS
REM  Select menu command
REM ----------------------------------------
echo.
echo Menu) q:Quit   h:Help  v:Vesion
call _AcceptKey qhv ">" Key

REM  Execute selected command
REM ----------------------------------------
!ExecCmd[%Key%]!
goto :MAIN_PROCESS


REM ======================================================================
REM = Exit Process
REM ======================================================================
REM  Success process exit
REM ----------------------------------------
:EXIT_SUCCESS
exit /b 0

REM  Faild process exit
REM ----------------------------------------
:EXIT_FAILD
exit /b 1


REM ======================================================================
REM = Sub Process
REM ======================================================================
REM  Print usage and exit
REM ----------------------------------------
:SHOW_HELP
call _PrintHelp "%~dpnx0"
goto :EXIT_SUCCESS

REM  Print message and help and exit
REM ----------------------------------------
:ERROR_HELP_EXIT
echo %ErrMsg%
echo.
call _PrintHelp "%~dpnx0"
goto :EXIT_FAILD

REM  Print version and exit
REM ----------------------------------------
:SHOW_VERSION
call _PrintVersion "%~dpnx0"
goto :EXIT_SUCCESS


REM ======================================================================
REM = Common Functions (only used by this command)
REM ======================================================================
REM ----------------------------------------------------------------------
REM - NAME   ) DummyFunc
REM - DESC   ) 
REM - USAGE  ) call :DummyFunc
REM - IN/OUT )
REM -  IN   %1  : 
REM -  OUT  %2  : 
REM ----------------------------------------------------------------------
:DummyFunc
set %2=%1
exit /b
