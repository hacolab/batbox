@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) SplitL2
REM - DESC   ) string split by target char, return 2 elements array
REM - USAGE  ) call SplitL2 SourceStr SepChar ArrName
REM - Exmpl  ) call SplitR2 "A:B:C" R -> R[0]=A R[1]=B:C
REM - IN/OUT )
REM -  IN   %1  : source string
REM -  IN   %2  : seperate char
REM -  OUT  %3  : output array name
REM -             when given 'A', set to A[0](left), A[1](right)
REM ----------------------------------------------------------------------
:SplitL2
call IndexOfChar %1 %2 _SplitL2_i

REM if %2 is not found in %1
if "%_SplitL2_i%"=="-1" (
    set %~3[0]=%~1
    goto :NotFoundExit
)

REM seperate string
REM Left
set _SplitL2_s=%~1
set %~3[0]=!_SplitL2_s:~0,%_SplitL2_i%!

REM Right
set /a _SplitL2_i=_SplitL2_i+1
set %~3[1]=!_SplitL2_s:~%_SplitL2_i%!

REM echo i: %_SplitL2_i%
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
set _SplitL2_i=
set _SplitL2_s=
exit /b
