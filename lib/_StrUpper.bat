@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _StrUpper
REM - DESC   ) Get upper string
REM - USAGE  ) call _StrUpper SourceStr UpperStr
REM - IN/OUT )
REM -  IN   %1  : Source string
REM -  OUT  %2  : Result upper string
REM - ERRSTS ) 0:allways
REM ----------------------------------------------------------------------
:_StrUpper
set lower=%~1
for %%a in ( A B C D E F G H I J K L M N O P Q R S T U V W X Y Z ) do (
    set lower=!lower:%%a=%%a!
)
endlocal && set %~2=%lower%
exit /b 0
