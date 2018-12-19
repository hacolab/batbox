@echo off
setlocal enabledelayedexpansion
REM ###########################################################################
REM # [NAME]    : %~nx0
REM # [VERSION] : 0.01
REM # [USAGE]   : %~nx0 [-h]
REM # [DESCRIPTION]
REM #  Batch script description...
REM #
REM # [PARAMS]
REM #   %1      :
REM #
REM # [OPTIONS]
REM #   /h      : Show command help
REM #
REM ###########################################################################
REM ======================================================================
REM = Environment Configs
REM ======================================================================
set PATH=%~dp0..\lib;%PATH%

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

REM  Params
REM ----------------------------------------
:ANALYZE_PARAMS
echo Param Count: %Params.Len%
call _AryEcho Params

REM ======================================================================
REM = Main Process
REM ======================================================================
:MAIN_PROCESS
echo.
echo Menu) q:Quit  h:Help  v:Version  b:Bell  c:ColorEcho  A:GoAdmin
call _AcceptKey qhvbcA ">" key
if %key%==q goto :EXIT_SUCCESS
if %key%==h call _PrintHelp "%~f0"
if %key%==v call _PrintVersion "%~f0"
if %key%==b call _NotifyBell
if %key%==c call _CEcho "hello world" FS_RED
if %key%==A call _RestartAdmin "%~f0"
goto :MAIN_PROCESS


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
call _PrintHelp "%~f0"
goto :EXIT_SUCCESS
