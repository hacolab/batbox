@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _PrintVersion
REM - DESC   ) Print Version this command. 
REM -          Print only start of line is "REM # [VERSION]" in this file
REM - USAGE  ) call _PrintVersion BatFilePath
REM - IN/OUT )
REM -  IN   %1  : bat file path you want to print version
REM ----------------------------------------------------------------------
:_PrintVersion
for /f "tokens=2 delims=:" %%a in ('findstr /b /c:"REM # [VERSION]" ^<"%~1"') do (
    set ver=%%a
    echo !ver:~1!
)
exit /b
