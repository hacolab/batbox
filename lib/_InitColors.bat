@echo off
REM ----------------------------------------------------------------------
REM - DESC ) Use color defines
REM - REFS ) http://it-junkbox.cocolog-nifty.com/blog/2011/08/ms-dos-06fd.html
REM ----------------------------------------------------------------------
if not "%_INIT_COLOR_%"=="" exit /b

set _INIT_COLOR_=1

REM color index in batbox
set _CF_BLACK=1
set _CF_RED=2
set _CF_GREEN=3
set _CF_YELLOW=4
set _CF_BLUE=5
set _CF_PURPLE=6
set _CF_AQUA=7
set _CF_WHITE=8
set _CB_BLACK=9
set _CB_RED=10
set _CB_GREEN=11
set _CB_YELLOW=12
set _CB_BLUE=13
set _CB_PURPLE=14
set _CB_AQUA=15
set _CB_WHITE=16
set _CS_BLACK=17
set _CS_RED=18
set _CS_GREEN=19
set _CS_YELLOW=20
set _CS_BLUE=21
set _CS_PURPLE=22
set _CS_AQUA=23
set _CS_WHITE=24
set _CU_BLACK=25
set _CU_RED=26
set _CU_GREEN=27
set _CU_YELLOW=28
set _CU_BLUE=29
set _CU_PURPLE=30
set _CU_AQUA=31
set _CU_WHITE=32
set _C_RESET=33

REM foreground text colors
set _COLOR_CODE[%_CF_BLACK%]=[30m
set _COLOR_CODE[%_CF_RED%]=[31m
set _COLOR_CODE[%_CF_GREEN%]=[32m
set _COLOR_CODE[%_CF_YELLOW%]=[33m
set _COLOR_CODE[%_CF_BLUE%]=[34m
set _COLOR_CODE[%_CF_PURPLE%]=[35m
set _COLOR_CODE[%_CF_AQUA%]=[36m
set _COLOR_CODE[%_CF_WHITE%]=[37m

REM background colors
set _COLOR_CODE[%_CB_BLACK%]=[40m
set _COLOR_CODE[%_CB_RED%]=[41m
set _COLOR_CODE[%_CB_GREEN%]=[42m
set _COLOR_CODE[%_CB_YELLOW%]=[43m
set _COLOR_CODE[%_CB_BLUE%]=[44m
set _COLOR_CODE[%_CB_PURPLE%]=[45m
set _COLOR_CODE[%_CB_AQUA%]=[46m
set _COLOR_CODE[%_CB_WHITE%]=[47m

REM foreground text colors and strong text
set _COLOR_CODE[%_CS_BLACK%]=[32;1m
set _COLOR_CODE[%_CS_RED%]=[31;1m
set _COLOR_CODE[%_CS_GREEN%]=[32;1m
set _COLOR_CODE[%_CS_YELLOW%]=[33;1m
set _COLOR_CODE[%_CS_BLUE%]=[34;1m
set _COLOR_CODE[%_CS_PURPLE%]=[35;1m
set _COLOR_CODE[%_CS_AQUA%]=[36;1m
set _COLOR_CODE[%_CS_WHITE%]=[37;1m

REM foreground text colors and underscore
set _COLOR_CODE[%_CU_BLACK%]=[30;4m
set _COLOR_CODE[%_CU_RED%]=[31;4m
set _COLOR_CODE[%_CU_GREEN%]=[32;4m
set _COLOR_CODE[%_CU_YELLOW%]=[33;4m
set _COLOR_CODE[%_CU_BLUE%]=[34;4m
set _COLOR_CODE[%_CU_PURPLE%]=[35;4m
set _COLOR_CODE[%_CU_AQUA%]=[36;4m
set _COLOR_CODE[%_CU_WHITE%]=[37;4m

REM reset color
set _COLOR_CODE[%_C_RESET%]=[0m
set _COLOR_RESET=[0m

REM color code last index 
set _COLOR_CODE.Len=33
