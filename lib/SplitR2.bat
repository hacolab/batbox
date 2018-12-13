@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) SplitR2
REM - DESC   ) string split by target char, return 2 elements array
REM - USAGE  ) call SplitR2 SourceStr SepChar ArrName
REM - Exmpl  ) call SplitR2 "A:B:C" R -> R[0]=A:B R[1]=C
REM - IN/OUT )
REM -  IN   %1  : source string
REM -  IN   %2  : seperate char
REM -  OUT  %3  : output array name
REM -             when given 'A', set to A[0](left), A[1](right)
REM ----------------------------------------------------------------------
:SplitR2
call LastIndexOfChar %1 %2 _SplitR2_i

REM if %2 is not found in %1
if "%_SplitR2_i%"=="-1" (
    set %~3[0]=%~1
    goto :NotFoundExit
)

REM seperate string
REM Left
set _SplitR2_s=%~1
set %~3[0]=!_SplitR2_s:~0,%_SplitR2_i%!

REM Right
set /a _SplitR2_i=_SplitR2_i+1
set %~3[1]=!_SplitR2_s:~%_SplitR2_i%!

REM echo i: %_SplitR2_i%
REM echo i0: !%~3[0]!
REM echo i1: !%~3[1]!

REM exit process
:FoundExit
call :ClearVar
exit /b 0

:NotFoundExit
call :ClearVar
exit /b 1

:ClearVar
set _SplitR2_i=
set _SplitR2_s=
exit /b
