@echo off
REM ----------------------------------------------------------------------
REM - DESC ) Use color defines
REM ----------------------------------------------------------------------
if not "%_INIT_BATBOX_%"=="" exit /b
set _INIT_BATBOX_=1

REM Define Constants
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

exit /b