@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _StrSub
REM - DESC   ) Get Substring (use set Var=%Var:~n,m%)
REM - USAGE  ) call _StrLen srcStr length retSubStr
REM - IN/OUT )
REM -  IN   %1  : Source string
REM -  IN   %2  : Start index (start 0)
REM - [IN]  %3  : Substr length (default all)
REM -  OUT  %4  : Result substring
REM ----------------------------------------------------------------------
:_StrSub
set srcStr=%~1
if "%~4"=="" (
    set retVar=%~3
    set retStr=!srcStr:~%~2!
) else (
    set retVar=%~4
    set retStr=!srcStr:~%~2,%~3!
)
endlocal && set %retVar%=%retStr%
exit /b 0
