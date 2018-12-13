@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) Fn
REM - DESC   ) set command output value to variable
REM - USAGE  ) call Fn CmdName RetVal
REM - IN/OUT )
REM -  IN   %1  : call command name, return value must be output to stdout
REM -  OUT  %2  : output variable name
REM -             when command output is multiple lines, set first output
REM ----------------------------------------------------------------------
:Fn
set _Fn_n=1
for /f "usebackq tokens=* delims=" %%z in (`%~1`) do (
    set %~2=%%z
    set _Fn_n=0
    goto :end
)
:end
exit /b %_Fn_n%
