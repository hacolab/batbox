@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _AryEach
REM - DESC   ) call command each of array elements
REM - USAGE  ) call _AryEach AryName CmdName [AddParams]
REM - IN/OUT )
REM -  IN   %1  : Source array name
REM -  IN   %2  : Apply command name, each of array elements
REM -  IN   %3  : Command add parameters or command
REM -             Call format) ApplyCmd ArrayElem AfterParamas
REM ----------------------------------------------------------------------
:_AryEach
set _AryEach_ExitStatus=0
for /l %%z in (1, 1, !%~1.Len!) do (
    %~2 !%~1[%%z]! %~3
    if not "%ERRORLEVEL%"=="0" (
        set _AryEach_ExitStatus=1
    )
)
exit /b %_AryEach_ExitStatus%