@echo off
rem Calibracion de la odometria en el terminal:  calibrar_windows.bat [--auto]
call "%~dp0windows\comun.cmd"
pushd "%RT_ROOT%"
%RT_RUN% cmd /d /c scripts\windows\en_ros.cmd ros2 run rasptank_calibration calibrar %*
set "RC=%ERRORLEVEL%"
popd
exit /b %RC%
