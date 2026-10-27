# RaspTank2 con ROS 2

Adeept RaspTank V4 (Raspberry Pi 4) con **ROS 2 Humble** para clase: nodos
del robot, simulador ligero con RViz, rutas por puntos, visión (cubo rojo,
meta ArUco o un modelo YOLO entrenado) y la misión **coger el cubo y llevarlo
a la meta**. Los alumnos programan con una API sencilla en Python, igual en
simulación que en el robot real.

```bash
./scripts/build_ros2.sh                          # compilar (Ubuntu 22.04 + ROS 2 Humble)
./scripts/sim.sh mision mission:=true autostart:=true
ros2 run rasptank_alumno ej01_avanzar            # en otro terminal (source scripts/ros_env.sh)
```

Aplicación del PC (estado, parada de emergencia, mover, **calibración de la
odometría** manual o automática, simulación): `./scripts/app.sh` —
[tools/app/README.md](tools/app/README.md).

Prácticas para los alumnos: [docs/practicas](docs/practicas/README.md).

En **Windows**: `scripts\instalar_windows.bat` y `menu_rasptank.bat` — [WINDOWS.md](WINDOWS.md).

**Versiones** ([Releases](https://github.com/gbellido-dev/RaspTank2/releases)):
la imagen Docker de la Raspberry Pi (nodos del hardware) y un `.zip` para
Windows que se instala sin internet. En la Pi va el hardware; en el PC, la
visión, la misión, RViz, el simulador, la app y los programas de los alumnos.

Guía completa: **[ROS2.md](ROS2.md)**. Robot real: [docker/README.md](docker/README.md).
Entrenar un modelo: [tools/yolo/README.md](tools/yolo/README.md).


Código original de Adeept (sin ROS 2): [legacy/adeept](legacy/adeept/README.md).
