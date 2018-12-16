@echo off
setlocal enabledelayedexpansion
REM ----------------------------------------------------------------------
REM - NAME   ) _TestProcTime
REM - DESC   ) Measurement command processing time
REM - USAGE  ) call _TestProcTime message cmdName execCount
REM - IN/OUT )
REM -  IN   %1  : Message
REM -  IN   %2  : Time measurement command path
REM -  IN   %3  : Command execution count
REM ----------------------------------------------------------------------
:_TestProcTime
echo ===== Measurement Processing Time ===== 
echo [%~1] 
echo ExecCommand       : %~dpnx2 
echo ExecCount         : %~3
for /f "usebackq skip=7 tokens=1,2 delims=:" %%a in (`powershell -ExecutionPolicy Unrestricted -Command "Measure-Command { for ($i=0; $i -lt %~3; $i++) {%~dpnx2} }"`) do (
    echo %%a:%%b
)
exit /b
