@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _PathGetParent
REM - DESC   ) Get parent directory path
REM - USAGE  ) call _PathGetParent path parentPath
REM - IN/OUT )
REM -  IN   %1  : Path string
REM -  OUT  %2  : Parent directory path
REM - ERRSTS ) 0:allways
REM ----------------------------------------------------------------------
:_PathGetParent
call _StrTrimR "%~1" "\" childPath
set childPath=%childPath:~0,-1%
call :GetParentPath %childPath% parentPath
endlocal && set %~2=%parentPath%
exit /b 0

:GetParentPath
set %~2=%~dp1
exit /b
