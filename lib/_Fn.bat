@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _Fn
REM - DESC   ) set command output value to variable
REM - USAGE  ) call _Fn CmdName RetVal
REM - IN/OUT )
REM -  IN   %1  : Call command name, return value must be output to stdout
REM -  OUT  %2  : Output variable name
REM -             When command output is multiple lines, set first output
REM ----------------------------------------------------------------------
:_Fn
set _Fn_n=1
for /f "usebackq tokens=* delims=" %%z in (`%~1`) do (
    set %~2=%%z
    set _Fn_n=0
    goto :end
)
:end
exit /b %_Fn_n%
