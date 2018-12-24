@echo off
REM ----------------------------------------------------------------------
REM - NAME   ) _NotifyBell
REM - DESC   ) Ring notification bell. depends on user32.dll
REM - USAGE  ) call _NotifyBell
REM - IN/OUT )
REM - ERRSTS ) 0:allways
REM ----------------------------------------------------------------------
:_NotifyBell
REM echo.
rundll32 user32.dll,MessageBeep
exit /b 0