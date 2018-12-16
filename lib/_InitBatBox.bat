@echo off
REM ----------------------------------------------------------------------
REM - DESC ) Use color defines
REM - REFS ) http://it-junkbox.cocolog-nifty.com/blog/2011/08/ms-dos-06fd.html
REM ----------------------------------------------------------------------
IF not "%_INIT_BATBOX_%"=="" exit /b
set _INIT_BATBOX_=1

REM Define Constants
set _TRUE=1
set _FALSE=0

set _ON=1
set _OFF=0

set _SUCCESS=0
set _FALID=1

call _TrapMode OFF
for %%a in (%*) do (
    if "%%a"=="COLOR_ON" (
        call _InitColors
    ) else if "%%a"=="DEBUG_ON" (
        call _TrapMode ON
    )
)

REM color index in batbox
