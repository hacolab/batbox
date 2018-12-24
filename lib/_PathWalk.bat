@echo off
REM ----------------------------------------------------------------------
REM - NAME   ) _PathWalk
REM - DESC   ) Walk sub directories and files, each do callback action
REM - USAGE  ) call _PathWalk path ignores callback
REM - EXMPL  ) call _PathWalk c:\dir\path "\.git \.svn" echo
REM - IN/OUT )
REM -  IN   %1  : Path string
REM -  IN   %2  : Ignore patterns
REM -  IN   %3  : Callback function (arg directory or file path)
REM - ERRSTS ) 0:allways
REM ----------------------------------------------------------------------
:_PathWalk
for /f "usebackq tokens=* delims=" %%a in (`dir /s /b %1^|findstr /v "%~2"`) do (
    call %~3 "%%a"
)
exit /b 0
