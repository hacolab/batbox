@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _Each
REM - DESC   ) call command each of array elements
REM - USAGE  ) call _Each AryName CmdName [AddParams]
REM - IN/OUT )
REM -  IN   %1  : Source array name
REM -  IN   %2  : Apply command name, each of array elements
REM -  IN   %3  : Command add parameters or command
REM -             Call format) ApplyCmd ArrayElem AfterParamas
REM ----------------------------------------------------------------------
:_Each
set _Each_ExitStatus=0
for /l %%z in (1, 1, !%~1.Len!) do (
    %~2 !%~1[%%z]! %~3
    if not "%ERRORLEVEL%"=="0" (
        set _Each_ExitStatus=1
    )
)
exit /b %_Each_ExitStatus%