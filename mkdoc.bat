@echo off
setlocal enabledelayedexpansion
REM ###########################################################################
REM # [NAME]    : %~nx0
REM # [VERSION] : 0.01
REM # [USAGE]   : %~nx0 [/?][/V][U]
REM # [DESCRIPTION]
REM #  Make documents of bat commands and lib\*.bat
REM # 
REM # [PARAMS]
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
set DOC_FILE=%~dp0doc.txt
del %DOC_FILE% >nul 2>&1

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
        set ERROR_MSG='%OptType%' is Unknown Option
        goto :ERROR_HELP_EXIT
    )
    shift
    goto :ANALYZE_OPTIONS
)

REM  Params
REM ----------------------------------------
:ANALYZE_PARAMS

REM ======================================================================
REM = Main Process
REM ======================================================================
:MAIN_PROCESS
REM  make document of bat commands
REM ----------------------------------------
call FnEach "dir /s /b %~dp0*.bat" "call PrintHelp" ">> ""%DOC_FILE%""" ^
    "echo Error File:"
    REM "echo File: %%%%z"

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
call PrintHelp "%~dpnx0"
goto :EXIT_SUCCESS

REM  Print message and help and exit
REM ----------------------------------------
:ERROR_HELP_EXIT
echo %ERROR_MSG%
echo.
call PrintHelp "%~dpnx0"
goto :EXIT_FAILD

REM  Print version and exit
REM ----------------------------------------
:SHOW_VERSION
call PrintVersion "%~dpnx0"
goto :EXIT_SUCCESS


REM ======================================================================
REM = Common Functions (only used by this command)
REM ======================================================================
REM ----------------------------------------------------------------------
REM - NAME   ) PrintHeader
REM - DESC   ) 
REM - USAGE  ) 
REM - IN/OUT )
REM -  IN   %1  : path each of bat files
REM ----------------------------------------------------------------------
REM :PrintHeader
REM echo ##### %1 >> "%DOC_FILE%"
REM exit /b
