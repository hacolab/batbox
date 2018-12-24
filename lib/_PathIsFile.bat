@echo off
REM ----------------------------------------------------------------------
REM - NAME   ) _PathIsFile
REM - DESC   ) does exist file
REM - USAGE  ) call _PathIsFile pathStr [isDir]
REM - IN/OUT )
REM -  IN   %1  : path string
REM -  OUT [%2] : file=TRUE, directory=FALSE, not exist path=FALSE
REM - ERRSTS ) 0:is file  1:is not file or does not exist
REM ----------------------------------------------------------------------
:_PathIsFile
if exist "%~1" (
    if not exist "%~1\" (
        goto :is_file
    )
)
:is_not_file
if not "%~2"=="" (
    set %~2=FALSE
)
exit /b 1

:is_file
if not "%~2"=="" (
    set %~2=TRUE
)
exit /b 0
