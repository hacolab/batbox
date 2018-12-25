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
REM set directories
set BATBOX_ROOT=%~dp0..\
set CMD_DIR=%BATBOX_ROOT%cmd\
set BIN_DIR=%BATBOX_ROOT%bin\
set LIB_DIR=%BATBOX_ROOT%lib\
set SRC_DIR=%BATBOX_ROOT%src\@SRCDIR@
set CONFIG_DIR=%CMD_DIR%_config\@SRCDIR@
set CACHE_DIR=%CMD_DIR%_cache\@SRCDIR@
set TEMP_DIR=%CMD_DIR%_temp\@SRCDIR@

REM append path
set PATH=%LIB_DIR%;%SRC_DIR%;%BIN_DIR%;%PATH%

REM ======================================================================
REM = Initalization
REM ======================================================================
REM init batbox
call _InitBatBox DEBUG_ON COLOR_ON

REM make use directories
if not exist "%CONFIG_DIR%" mkdir "%CONFIG_DIR%" >nul 2>&1
if not exist "%CACHE_DIR%"  mkdir "%CACHE_DIR%"  >nul 2>&1
if not exist "%TEMP_DIR%"   mkdir "%TEMP_DIR%"   >nul 2>&1

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