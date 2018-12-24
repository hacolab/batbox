@echo off
REM ----------------------------------------------------------------------
REM - NAME   ) _PathWalkDir
REM - DESC   ) Walk sub directories, each do callback action
REM - USAGE  ) call _PathWalkDir path ignores callback
REM - EXMPL  ) call _PathWalkDir c:\dir\path "\.git \.svn" echo
REM - IN/OUT )
REM -  IN   %1  : Path string
REM -  IN   %2  : Ignore patterns
REM -  IN   %3  : Callback function (arg dir path)
REM - ERRSTS ) 0:allways
REM ----------------------------------------------------------------------
:_PathWalkDir
for /f "usebackq tokens=* delims=" %%a in (`dir /s /b /a:d "%~1"^|findstr /v "%~2"`) do (
    call %~3 "%%a"
)
exit /b 0
