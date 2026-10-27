@echo off
rem Instala ROS 2 Humble (RoboStack, con Pixi) y compila el RaspTank.
rem Con internet: descarga el entorno (~3 GB). Sin internet: usa el paquete de
rem una release (windows\environment.tar y windows\pixi-unpack.exe).
rem No hace falta Visual Studio.
call "%~dp0windows\comun.cmd"
if exist "%RT_ROOT%\windows\environment.tar" goto offline
where pixi >nul 2>nul
if not errorlevel 1 goto have_pixi
if exist "%RT_ROOT%\windows\pixi.exe" goto have_pixi
echo Descargando pixi.exe en windows\ ...
if not exist "%RT_ROOT%\windows" mkdir "%RT_ROOT%\windows"
powershell.exe -NoProfile -Command "Invoke-WebRequest -UseBasicParsing -Uri 'https://github.com/prefix-dev/pixi/releases/latest/download/pixi-x86_64-pc-windows-msvc.exe' -OutFile '%RT_ROOT%\windows\pixi.exe'"
if errorlevel 1 goto failed
set "RT_PIXI=%RT_ROOT%\windows\pixi.exe"
:have_pixi
echo Instalando el entorno de ROS 2 (tarda unos minutos)...
"%RT_PIXI%" install --manifest-path "%RT_MANIFEST%"
if errorlevel 1 goto failed
goto build
:offline
if exist "%RT_ROOT%\windows\activate.bat" goto build
echo Instalando el entorno de ROS 2 sin internet (windows\environment.tar)...
"%RT_ROOT%\windows\pixi-unpack.exe" --output-directory "%RT_ROOT%\windows" --shell cmd "%RT_ROOT%\windows\environment.tar"
if errorlevel 1 goto failed
:build
call "%~dp0compilar_windows.bat"
if errorlevel 1 goto failed
echo.
echo Listo. Prueba: scripts\sim_windows.bat   o   scripts\app_windows.bat
exit /b 0
:failed
echo.
echo ERROR: la instalacion no ha terminado. Revisa el mensaje anterior.
exit /b 1
