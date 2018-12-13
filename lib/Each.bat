@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) Each
REM - DESC   ) call command each of array elements
REM - USAGE  ) call Each AryName ArySize CmdName [AddParams]
REM - IN/OUT )
REM -  IN   %1  : source array name
REM -  IN   %2  : source array size
REM -  IN   %3  : apply command name, each of array elements
REM -  IN   %4  : command add parameters or command
REM -             call format) call ApplyCmd OutCmdOutput AfterParamas
REM ----------------------------------------------------------------------
:Each
set /a _Each_End=%2-1
set _Each_ExitStatus=0
for /l %%z in (0, 1, %_Each_End%) do (
    %~3 !%~1[%%z]! %~4
    if not "%ERRORLEVEL%"=="0" (
        set _Each_ExitStatus=1
    )
)
set _Each_End=
exit /b %_Each_ExitStatus%