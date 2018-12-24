@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _StrLower
REM - DESC   ) Get lower string
REM - USAGE  ) call _StrLower SourceStr LowerStr
REM - IN/OUT )
REM -  IN   %1  : Source string
REM -  OUT  %2  : Result lower string
REM - ERRSTS ) 0:allways
REM ----------------------------------------------------------------------
:_StrLower
set lower=%~1
for %%a in ( a b c d e f g h i j k l m n o p q r s t u v w x y z ) do (
    set lower=!lower:%%a=%%a!
)
endlocal && set %~2=%lower%
exit /b 0
