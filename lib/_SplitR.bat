@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _SplitR
REM - DESC   ) String split by target char, return 2 elements array
REM - USAGE  ) call _SplitR SourceStr SepChar ArrName
REM - Exmpl  ) call _SplitR "A:B:C" : R -> R[1]=A:B R[2]=C R.Len=2
REM - Exmpl  ) call _SplitR "A:B:C" D R -> R[1]= R[2]= R.Len=0
REM - IN/OUT )
REM -  IN   %1  : Source string
REM -  IN   %2  : Seperate char
REM -  OUT  %3  : Output array name
REM -             when given 'A', set to A[1](left),A[2](right),and A.Len
REM ----------------------------------------------------------------------
:_SplitR
if "%~1"=="" (
    set length=0
    goto :func_exit
)

REM Get seperate char posision
call _LastIndexOfChar %1 %2 sepPos

REM if %2 is not found in %1
if "%sepPos%"=="-1" (
    set length=0
    goto :func_exit
) 

REM seperate string
REM Left
set s=%~1
set leftStr=!s:~0,%sepPos%!
REM Right
set /a sepPos=sepPos+1
set rightStr=!s:~%sepPos%!
set length=2

REM exit process
:func_exit
REM echo Left:%leftStr%
REM echo Right:%rightStr%
REM echo Len:%length%
endlocal && set %~3[1]=%leftStr%&& set %~3[2]=%rightStr%&& set %~3.Len=%length%
exit /b 0
