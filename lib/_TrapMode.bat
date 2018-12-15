@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _TrapMode
REM - DESC   ) Print message "Name:Value" when only debug mode(_DEBUG_MODE_=1)
REM - USAGE  ) call _TrapMode TrapOnOff
REM - IN/OUT )
REM -  IN   %1  : Trap mode on or off (_TRUE_ or _FALSE_)
REM ----------------------------------------------------------------------
:_TrapMode
if "!%1!"=="%_TRUE_%" (
   set _DEBUG_MODE_=%_TRUE_%
) else (
   set _DEBUG_MODE_=%_TRUE_%
)
exit /b
