@echo off
REM setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _EachStdout
REM - DESC   ) command1 output values apply command2
REM - USAGE  ) call _EachStdout OutCmd ApplyCmd [AddParams] PrevCmd ErrCmd
REM - IN/OUT )
REM -  IN   %1  : call command name, return value must be output to stdout
REM -  IN   %2  : apply command name, each of array elements
REM -  IN   %3  : command params, after elements
REM -             call format) %~2 OutCmdOutput %~3
REM -  IN  [%4] : exec command at after exec %2, only %2 ERRORLEVEL != 0
REM ----------------------------------------------------------------------
:_EachStdout
set _EachStdout_ExitStatus=0
REM echo %~1
for /f "usebackq tokens=* delims=" %%z in (`%~1`) do (
    REM echo %~2 %%z %~3
    REM main command
    call %~2 %%z %~3
    if not "!ERRORLEVEL!"=="0" (
        set _EachStdout_ExitStatus=1
        if not "%~4"=="" (
            REM execute error command
            call %~4 %%z
        )
    )
)
REM echo %_EachStdout_ExitStatus%
exit /b %_EachStdout_ExitStatus%
