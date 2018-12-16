@echo off
REM ----------------------------------------------------------------------
REM - DESC ) Use color defines
REM - REFS ) http://it-junkbox.cocolog-nifty.com/blog/2011/08/ms-dos-06fd.html
REM ----------------------------------------------------------------------
IF not "%_INIT_BATBOX_%"=="" exit /b

set _INIT_BATBOX_=1
set _TRUE_=1
set _FALSE_=0

set _DEBUG_MODE_=%_FALSE_%

for %%a in (%*) do (
    if "%%a"=="COLOR_ON" (
        call _InitColors
    ) else if "%%a"=="DEBUG_ON" (
        call _TrapMode _TRUE_
    )
)

REM color index in batbox
