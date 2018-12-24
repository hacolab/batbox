@echo off
REM ----------------------------------------------------------------------
REM - DESC ) Use color defines
REM - REFS ) http://it-junkbox.cocolog-nifty.com/blog/2011/08/ms-dos-06fd.html
REM ----------------------------------------------------------------------
if not "%_INIT_COLOR_%"=="" exit /b
set _INIT_COLOR_=1

REM Color Symbol
REM FC_BLACK
REM FC_RED
REM FC_GREEN
REM FC_YELLOW
REM FC_BLUE
REM FC_PURPLE
REM FC_CYAN
REM FC_WHITE
REM BC_BLACK
REM BC_RED
REM BC_GREEN
REM BC_YELLOW
REM BC_BLUE
REM BC_PURPLE
REM BC_CYAN
REM BC_WHITE
REM FS_BLACK
REM FS_RED
REM FS_GREEN
REM FS_YELLOW
REM FS_BLUE
REM FS_PURPLE
REM FS_CYAN
REM FS_WHITE
REM FU_BLACK
REM FU_RED
REM FU_GREEN
REM FU_YELLOW
REM FU_BLUE
REM FU_PURPLE
REM FU_CYAN
REM FU_WHITE
REM BS_BLACK
REM BS_RED
REM BS_GREEN
REM BS_YELLOW
REM BS_BLUE
REM BS_PURPLE
REM BS_CYAN
REM BS_WHITE
REM BU_BLACK
REM BU_RED
REM BU_GREEN
REM BU_YELLOW
REM BU_BLUE
REM BU_PURPLE
REM BU_CYAN
REM BU_WHITE
REM C_RESET

REM foreground text colors
set _COLOR_CODE[FC_BLACK]=[30m
set _COLOR_CODE[FC_RED]=[31m
set _COLOR_CODE[FC_GREEN]=[32m
set _COLOR_CODE[FC_YELLOW]=[33m
set _COLOR_CODE[FC_BLUE]=[34m
set _COLOR_CODE[FC_PURPLE]=[35m
set _COLOR_CODE[FC_CYAN]=[36m
set _COLOR_CODE[FC_WHITE]=[37m

REM background colors
set _COLOR_CODE[BC_BLACK]=[40m
set _COLOR_CODE[BC_RED]=[41m
set _COLOR_CODE[BC_GREEN]=[42m
set _COLOR_CODE[BC_YELLOW]=[43m
set _COLOR_CODE[BC_BLUE]=[44m
set _COLOR_CODE[BC_PURPLE]=[45m
set _COLOR_CODE[BC_CYAN]=[46m
set _COLOR_CODE[BC_WHITE]=[47m

REM foregrd text colors and strong text
set _COLOR_CODE[FS_BLACK]=[30;1m
set _COLOR_CODE[FS_RED]=[31;1m
set _COLOR_CODE[FS_GREEN]=[32;1m
set _COLOR_CODE[FS_YELLOW]=[33;1m
set _COLOR_CODE[FS_BLUE]=[34;1m
set _COLOR_CODE[FS_PURPLE]=[35;1m
set _COLOR_CODE[FS_CYAN]=[36;1m
set _COLOR_CODE[FS_WHITE]=[37;1m

REM background colors and strong text
set _COLOR_CODE[BS_BLACK]=[40;1m
set _COLOR_CODE[BS_RED]=[41;1m
set _COLOR_CODE[BS_GREEN]=[42;1m
set _COLOR_CODE[BS_YELLOW]=[43;1m
set _COLOR_CODE[BS_BLUE]=[44;1m
set _COLOR_CODE[BS_PURPLE]=[45;1m
set _COLOR_CODE[BS_CYAN]=[46;1m
set _COLOR_CODE[BS_WHITE]=[47;1m

REM foreground t colors and underscore
set _COLOR_CODE[FU_BLACK]=[30;4m
set _COLOR_CODE[FU_RED%]=[31;4m
set _COLOR_COCE[FU_GREEN]=[32;4m
set _COLOR_CODE[FU_YELLOW]=[33;4m
set _COLOR_CODE[FU_BLUE]=[34;4m
set _COLOR_CODE[FU_PURPLE]=[35;4m
set _COLOR_CODE[FU_CYAN]=[36;4m
set _COLOR_CODE[FU_WHITE]=[37;4m

REM background t colors and underscore
set _COLOR_CODE[BU_BLACK]=[40;4m
set _COLOR_CODE[BU_RED%]=[41;4m
set _COLOR_CODE[BU_GREEN]=[42;4m
set _COLOR_CODE[BU_YELLOW]=[43;4m
set _COLOR_CODE[BU_BLUE]=[44;4m
set _COLOR_CODE[BU_PURPLE]=[45;4m
set _COLOR_CODE[BU_CYAN]=[46;4m
set _COLOR_CODE[BU_WHITE]=[47;4m

REM reset color
set _COLOR_CODE[C_RESET]=[0m
set _COLOR_RESET=[0m

REM color code size
set _COLOR_CODE.Len=48
