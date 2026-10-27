@echo off
rem Compila el workspace (todo Python: sin compilador de C++).
call "%~dp0windows\comun.cmd"
pushd "%RT_ROOT%\ros2_ws"
%RT_RUN% colcon build --merge-install
set "RC=%ERRORLEVEL%"
popd
exit /b %RC%
