@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _SplitR
REM - DESC   ) String split by target char, return 2 elements array
REM - USAGE  ) call _SplitR SourceStr SepChar ArrName
REM - Exmpl  ) call _SplitR "A:B:C" : R -> R[0]=A:B R[1]=C R.Len=2
REM - Exmpl  ) call _SplitR "A:B:C" + R -> R[1]=A:B:C R.Len=1
REM - IN/OUT )
REM -  IN   %1  : Source string
REM -  IN   %2  : Seperate char
REM -  OUT  %3  : Output array name
REM -             when given 'A', set to A[1](left),A[2](right),and A.Len
REM ----------------------------------------------------------------------
:_SplitR
if "%~1"=="" (
    endlocal && set %~3[1]=&& set %~3[2]=&& set %~3.Len=0
    exit /b 0
)

REM Get seperate char posision
call _LastIndexOfChar %1 %2 sepPos

REM if %2 is not found in %1
if "%sepPos%"=="-1" (
    set leftStr=%~1
    set length=1
) else (
    REM seperate string
    REM Left
    set s=%~1
    set leftStr=!s:~0,%sepPos%!
    REM Right
    set /a sepPos=sepPos+1
    set rightStr=!s:~%sepPos%!
    set length=2
)

REM exit process
endlocal && set %~3[1]=%leftStr%&& set %~3[2]=%rightStr%&& set %~3.Len=%length%
exit /b 0
