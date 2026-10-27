@echo off
rem Shared variables of the Windows launchers (no setlocal: they reach the caller).
for %%R in ("%~dp0..\..") do set "RT_ROOT=%%~fR"
set "RT_MANIFEST=%RT_ROOT%\tools\windows\pixi.toml"
set "RT_PIXI=pixi"
if exist "%RT_ROOT%\windows\pixi.exe" set "RT_PIXI=%RT_ROOT%\windows\pixi.exe"
rem RT_RUN runs a command inside the ROS 2 environment.
set "RT_ENV=%RT_ROOT%\tools\windows\.pixi\envs\default"
set "RT_RUN="%RT_PIXI%" run --manifest-path "%RT_MANIFEST%""
rem Offline install from a release: environment unpacked in windows\env.
if not exist "%RT_ROOT%\windows\activate.bat" goto domain
set "RT_ENV=%RT_ROOT%\windows\env"
set "RT_RUN=call "%RT_ROOT%\scripts\windows\con_env.cmd""
:domain
rem Simulation: 41, like RobotMK2. For a real robot set its domain first:
rem   set ROS_DOMAIN_ID=10
if not defined ROS_DOMAIN_ID set "ROS_DOMAIN_ID=41"
exit /b 0
