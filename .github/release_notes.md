## Qué descargar

| Dónde | Qué | Cómo |
|---|---|---|
| **Raspberry Pi 4** (el robot) | Imagen Docker `{{IMAGE}}:{{VERSION}}` (nodos del hardware) | `git clone --branch {{VERSION}} https://github.com/gbellido-dev/RaspTank2.git`, luego `export RASPTANK_VERSION={{VERSION}}` y `docker compose -f docker/compose.yaml pull` ([docker/README.md](https://github.com/gbellido-dev/RaspTank2/blob/{{VERSION}}/docker/README.md)) |
| **PC con Windows** | `RaspTank2-{{VERSION}}-windows.zip`: código y entorno de ROS 2, se instala **sin internet** | Descomprime en una carpeta sin espacios (p. ej. `C:\RaspTank2`) y ejecuta `scripts\instalar_windows.bat`; después, `menu_rasptank.bat` ([WINDOWS.md](https://github.com/gbellido-dev/RaspTank2/blob/{{VERSION}}/WINDOWS.md)) |
| **PC con Ubuntu 22.04** | Código fuente | ROS 2 Humble y `./scripts/build_ros2.sh` ([ROS2.md](https://github.com/gbellido-dev/RaspTank2/blob/{{VERSION}}/ROS2.md)) |

En la Pi van los nodos que tocan el hardware (orugas, vigilante de motores,
gobernador, brazo, sensores, LED y cámara). En el PC, la visión, la misión,
RViz, el simulador, la app y los programas de los alumnos. Los dos con el mismo
`ROS_DOMAIN_ID`.

Usa la misma versión en la Pi y en el PC.
