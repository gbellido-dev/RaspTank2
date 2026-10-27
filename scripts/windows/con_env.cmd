@echo off
rem Like "pixi run" for the environment unpacked from a release (windows\env).
setlocal
call "%RT_ROOT%\windows\activate.bat" >nul
%*
exit /b %ERRORLEVEL%
