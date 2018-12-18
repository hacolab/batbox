@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _GetParams
REM - DESC   ) Get command line options and parameter
REM - USAGE  ) call _GetParams optValName paramValName "%*"
REM - EXP    ) call _GetParams opt prm /a:v1 /A:V2 /+ hello world
REM            opt[A]=V2 opt[+]=1 prm[1]=callhello prm[2]=world
REM - IN/OUT )
REM -  OUT  %1  : Options variable name
REM -  OUT  %2  : Params variable name
REM -  IN   %3* : Params, ignore case and /? unusable
REM ----------------------------------------------------------------------
:_GetParams
set %~2.Len=0
for %%a in ( %~3 ) do (
    set p=%%a
    if "!p:~0,1!"=="/" (
        call :setOpt !p:~1! %~1
    ) else (
        call :setParam !p! %~2
    )
)
exit /b

:setOpt
setlocal enabledelayedexpansion
set t=%~1
set name=%t:~0,1%
if "%t:~1,1%"==":" (
    set val=%t:~2%
) else (
    set val=1
)
endlocal && set %~2[%name%]=%val%
exit /b

:setParam
set /a %~2.Len=%~2.Len+1
set %~2[!%~2.Len!]=%~1
exit /b
