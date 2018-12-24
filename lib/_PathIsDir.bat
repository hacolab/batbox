@echo off
REM ----------------------------------------------------------------------
REM - NAME   ) _PathIsDir
REM - DESC   ) does exist directory
REM - USAGE  ) call _PathIsDir pathStr [isFile]
REM - IN/OUT )
REM -  IN   %1  : path string
REM -  OUT [%2] : directory=TRUE, file=FALSE, not exist path=FALSE
REM - ERRSTS ) 0:is directory  1:is not directory or does not exist
REM ----------------------------------------------------------------------
:_PathIsDir
if exist "%~1\" (
    goto :is_dir
)
:is_not_dir
if not "%~2"=="" (
    set %~2=FALSE
)
exit /b 1

:is_dir
if not "%~2"=="" (
    set %~2=TRUE
)
exit /b 0
