@echo off
REM ----------------------------------------------------------------------
REM - NAME   ) _TrapMode
REM - DESC   ) Set TrapMode On or Off
REM - USAGE  ) call _TrapMode OnOff
REM - IN/OUT )
REM -  IN   %1  : Set ON or OFF
REM ----------------------------------------------------------------------
:_TrapMode
if "%1"=="ON" (
   set _TRAP_MODE_=%_ON%
) else (
   set _TRAP_MODE_=%_OFF%
)
exit /b
