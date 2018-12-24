@echo off
setlocal enabledelayedexpansion
REM ###########################################################################
REM # [NAME]    : %~nx0
REM # [VERSION] : 0.01
REM # [USAGE]   : %~nx0 [/h][/v]
REM # [DESCRIPTION]
REM #  Batch script description...
REM #
REM # [PARAMS]
REM #   %1      :
REM #
REM # [OPTIONS]
REM #   /h      : Show command help
REM #   /v      : Show command version
REM #
REM ###########################################################################
REM ======================================================================
REM = Environment Configs
REM ======================================================================
set PATH=@SRCDIR@;%~dp0..\lib;%PATH%

REM init batbox
call _InitBatBox DEBUG_ON COLOR_ON

REM ======================================================================
REM = Check Command Params
REM ======================================================================
call _GetParams Opts Params "%*"

REM  Options
REM ----------------------------------------
:ANALYZE_OPTIONS
if defined Opts[h] goto :SHOW_HELP
if defined Opts[v] goto :SHOW_VERSION

REM  Params
REM ----------------------------------------
:ANALYZE_PARAMS
echo Param Count: %Params.Len%
call _AryEcho Params

REM ======================================================================
REM = Main Process
REM ======================================================================
:MAIN_PROCESS
call _CEcho "hello world" FS_GREEN

REM  Success process exit
REM ----------------------------------------
:EXIT_SUCCESS
exit /b 0

REM ======================================================================
REM = Sub Process
REM ======================================================================
REM  Print help and exit
REM ----------------------------------------
:SHOW_HELP
call _PrintHelp "%~f0"
goto :EXIT_SUCCESS

REM  Print version and exit
REM ----------------------------------------
:SHOW_VERSION
call _PrintVersion "%~f0"
goto :EXIT_SUCCESS