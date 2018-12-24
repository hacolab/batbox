@echo off
setlocal enabledelayedexpansion
REM ###########################################################################
REM # [NAME]    : %~nx0
REM # [VERSION] : 0.01
REM # [USAGE]   : %~nx0 [/h]
REM # [DESCRIPTION]
REM #  Make new batbox project
REM #
REM # [PARAMS]
REM #
REM # [OPTIONS]
REM #   /h      : Show command help
REM #   /v      : Show command version
REM #
REM ###########################################################################
REM ======================================================================
REM = Environment Configs
REM ======================================================================
set BatBoxRoot=%~dp0
set PATH=%BatBoxRoot%lib;%PATH%
set PJRoot=%BatBoxRoot%src\
set CmdRoot=%BatBoxRoot%cmd\
set TemplateDir=%BatBoxRoot%_template\

REM init batbox
call _InitBatBox DEBUG_ON COLOR_ON
set Template[s]=simple.bat
set Template[i]=interactive.bat

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

REM ======================================================================
REM = Main Process
REM ======================================================================
REM input project type
REM ----------------------------------------
:INPUT_PJ_NAME
echo.
echo Please input new project name.
call _AcceptStr.bat "^[0-9a-zA-Z\-_]*$" ">" NewPJName || goto :INPUT_PJ_NAME
set NewPJDir=%PJRoot%%NewPJName%\
if exist "%NewPJDir%" (
    call _CEcho "'%NewPJName%' is exist project name. please input other name." FS_RED
    goto :INPUT_PJ_NAME
)

REM Select project type
REM ----------------------------------------
:SELECT_PJ_TYPE
echo.
echo Select Project Template) s:simple  i:interactive
call _AcceptKey si ">" PJType

echo.
echo ------------------------------------------------------------
call _CEcho " NewPJName: %NewPJName%" "NewPJName:" FS_WHITE
call _CEcho " Template: !Template[%PJType%]!" "Template:" FS_WHITE
echo ------------------------------------------------------------
echo.
call _AcceptKey yn "Do you want to make new project with this?(y/n)>" YesNo
if "%YesNo%"=="n" (
    echo.
    call _CEcho "cancel make new project." FC_YELLOW
    goto :EXIT_SUCCESS
)

REM Make new project files
REM ----------------------------------------
echo.
mkdir %NewPJDir%
set MainScript=%NewPJDir%Main.bat
for /f "usebackq skip=2 tokens=1* delims=]" %%a in (`find /n /v "" %TemplateDir%!Template[%PJType%]!`) do (
    set line=%%b
    if not "!line!"=="" (
        set line=!line:@SRCDIR@=%%~dp0..\src\%NewPJName%!
    )
    echo.!line!>> %MainScript%
)
mklink /h %CmdRoot%%NewPJName%.bat %MainScript%

echo.
call _CEcho "complete make new project." FC_CYAN

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

REM  Print version and exit
REM ----------------------------------------
:SHOW_VERSION
call _PrintVersion "%~f0"
goto :EXIT_SUCCESS