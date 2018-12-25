@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) PrintHelp
REM - DESC   ) Print Help this command.
REM -          Print only start of line is "REM # " in target file
REM - USAGE  ) call PrintHelp BatFilePath
REM - IN/OUT )
REM -  IN   %1  : File path you want to print help
REM ----------------------------------------------------------------------
:PrintHelp
for /f "tokens=1,2* delims=#" %%a in ('findstr /b /c:"REM #" ^<"%~1"') do (
    if not "%%b"=="" (
        set lineText=%%b
        REM replace batch filename
        set lineText=!lineText:%%~nx0=%~nx1!
        echo.!lineText!
    ) else (
        echo.
    )
)
exit /b