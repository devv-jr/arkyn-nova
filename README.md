<div align="center">

```
 ▄▄▄  ██▄  ██▄  ▄▄▄▄  ██▄
 ██   ██▀  ██▀ ██▄▄  ██▀
 ▀▀▀  ▀▀   ▀▀   ▀▀▀▀  ▀▀
```

# ARKYN NOVA

**Control total. Velocidad inmediata. Cero distracciones.**

[![Debian](https://img.shields.io/badge/Base-Debian_12-A81D33?style=flat-square&logo=debian&logoColor=white)](https://debian.org)
[![i3wm](https://img.shields.io/badge/WM-i3wm-4AF4A8?style=flat-square)](https://i3wm.org)
[![Alacritty](https://img.shields.io/badge/Terminal-Alacritty-3DD4FF?style=flat-square)](https://alacritty.org)
[![Rofi](https://img.shields.io/badge/Launcher-Rofi-A07CFF?style=flat-square)](https://github.com/davatorium/rofi)
[![License](https://img.shields.io/badge/License-GPL--3.0-F4C04A?style=flat-square)](LICENSE)
[![Arch](https://img.shields.io/badge/Arch-x86__64-555555?style=flat-square)]()
[![Status](https://img.shields.io/badge/Status-stable-4AF4A8?style=flat-square)]()

</div>

---

> **ARKYN NOVA** es un entorno Linux minimalista diseñado para productividad diaria sin distracciones.
> Construido sobre Debian 12 y potenciado por i3wm — un sistema que responde antes de que termines de pensar.

---

## 📊 Métricas del sistema

<div align="center">

|  | Valor |
|---|---|
| **RAM en reposo** | ~800 MB |
| **Boot time** | < 3 segundos |
| **Instalación mínima** | 4 GB |
| **Window manager** | i3wm |

</div>

---

## ⚡ Filosofía de diseño

<table>
<tr>
<td width="50%">

### 01 · Control total
Cada proceso, cada componente, cada keybind — bajo tu autoridad. Sin daemons ocultos, sin decisiones tomadas por el sistema.

</td>
<td width="50%">

### 02 · Respuesta inmediata
Tiempos de respuesta que se sienten instantáneos. i3 ocupa kilobytes donde otros gestores ocupan megabytes.

</td>
</tr>
<tr>
<td width="50%">

### 03 · Interfaz limpia
Eliminar lo innecesario no es minimalismo estético — es productividad. Todo elemento visible tiene una función.

</td>
<td width="50%">

### 04 · Base extensible
NOVA no es un sistema terminado. Es una plataforma de partida que el usuario extiende sin límites definidos por terceros.

</td>
</tr>
</table>

---

## 🧱 Stack tecnológico

<table>
<tr>
<td align="center" width="20%">

**🐧 Debian 12**
Base del sistema

</td>
<td align="center" width="20%">

**⬜ i3wm**
Window manager

</td>
<td align="center" width="20%">

**▶ Alacritty**
Terminal emulator

</td>
<td align="center" width="20%">

**◈ Rofi**
App launcher

</td>
<td align="center" width="20%">

**≡ i3bar**
Status bar

</td>
</tr>
<tr>
<td align="center" width="20%">

**🔒 i3lock**
Screen locker

</td>
<td align="center" width="20%">

**🔊 PipeWire**
Audio server

</td>
<td align="center" width="20%">

**🌐 NetworkManager**
Networking

</td>
<td align="center" width="20%">

**🎨 GTK Theme**
Xresources

</td>
<td align="center" width="20%">

**📦 APT**
Package manager

</td>
</tr>
</table>

---

## ✨ Características

<table>
<tr>
<td width="50%">

### 🪟 Gestor de ventanas tiling
i3wm con configuración preajustada para flujos de trabajo de desarrollo. Layouts automáticos, atajos de teclado semánticos, multi-monitor listo desde el primer arranque.

`i3` · `i3bar` · `i3status`

</td>
<td width="50%">

### ⚡ Terminal acelerada
Alacritty con aceleración GPU, renderizado OpenGL y latencia de entrada sub-milisegundo. La terminal más rápida disponible en Linux.

`Alacritty` · `GPU-rendered`

</td>
</tr>
<tr>
<td width="50%">

### 🚀 Lanzador universal
Rofi configurado como launcher, switcher de ventanas y gestor de scripts. Una sola combinación de teclas para acceder a cualquier herramienta del sistema.

`Rofi` · `dmenu-compatible`

</td>
<td width="50%">

### 🛠 Entorno de desarrollo
Toolchain preconfigurado con git, herramientas de compilación esenciales y gestores de paquetes listos desde el primer arranque.

`dev-ready` · `out of the box`

</td>
</tr>
</table>

---

## 🚀 Instalación rápida

```bash
# Descarga el instalador
wget https://arkyn.linux/nova/install.sh

# Verifica el checksum antes de ejecutar
sha256sum install.sh

# Ejecuta la instalación
chmod +x install.sh && sudo ./install.sh

# Reinicia para aplicar cambios
reboot
```

### Requisitos mínimos

| Componente | Mínimo | Recomendado |
|---|---|---|
| **CPU** | x86_64 · 1 GHz | x86_64 · 2+ GHz |
| **RAM** | 1 GB | 4 GB+ |
| **Disco** | 4 GB | 20 GB+ |
| **Video** | VESA | GPU con driver libre |

---

## ⌨️ Atajos esenciales

### Gestión de ventanas

| Atajo | Acción |
|---|---|
| `$mod + Enter` | Nueva terminal |
| `$mod + d` | Abrir launcher (Rofi) |
| `$mod + Shift + q` | Cerrar ventana activa |
| `$mod + f` | Fullscreen |
| `$mod + e` | Toggle split |
| `$mod + h / v` | Split horizontal / vertical |

### Navegación

| Atajo | Acción |
|---|---|
| `$mod + [1-9]` | Cambiar workspace |
| `$mod + Shift + [1-9]` | Mover ventana a workspace |
| `$mod + h / j / k / l` | Navegar entre ventanas |
| `$mod + Shift + r` | Recargar configuración |
| `$mod + Shift + e` | Salir de i3 |

> `$mod` = tecla Super (Win) por defecto. Configurable en `~/.config/i3/config`.

---

## 🗺 Roadmap

```
v1.0  ████████████████████  DONE   Core NOVA — Sistema base estable
v1.1  ████████████████████  DONE   Perfiles de desarrollo pre-instalados
v1.2  ████████░░░░░░░░░░░░  NEXT   ARKYN Config Manager (TUI)
v2.0  ░░░░░░░░░░░░░░░░░░░░  FUTURE NOVA Wayland Edition (Sway/Hyprland)
```

### v1.0 — Lanzamiento ✅
Sistema base funcional con Debian 12, i3wm, Alacritty, Rofi y scripts de configuración iniciales.

### v1.1 — Refinement ✅
Perfiles de desarrollo para web, sistemas y DevOps. Toolchains específicos sin bloat adicional.

### v1.2 — ARKYN Config Manager ⏳
TUI para gestionar dotfiles, temas y perfiles. Una sola herramienta para toda la configuración del sistema.

### v2.0 — NOVA Wayland Edition 🔮
Migración a Sway/Hyprland manteniendo la filosofía NOVA. Mismo control total, protocolo moderno.

---

## 📁 Estructura del proyecto

```
arkyn-nova/
├── config/
│   ├── i3/           # Configuración de i3wm
│   ├── alacritty/    # Configuración de terminal
│   ├── rofi/         # Temas y config de launcher
│   └── gtk/          # Temas GTK
├── scripts/
│   ├── install.sh    # Instalador principal
│   ├── bootstrap.sh  # Setup inicial del sistema
│   └── update.sh     # Actualización de dotfiles
├── themes/           # Temas visuales
├── wallpapers/       # Fondos de pantalla
└── README.md
```

---

## 🤝 Contribuir

Las contribuciones son bienvenidas. Por favor:

1. Haz fork del repositorio
2. Crea una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commitea tus cambios (`git commit -m 'feat: descripción concisa'`)
4. Abre un Pull Request con descripción detallada

---

## 📜 Licencia

Distribuido bajo la **GNU General Public License v3.0**.
Ver [`LICENSE`](LICENSE) para más información.

---

<div align="center">

**ARKYN NOVA** — *Construido para quienes construyen.*

`Debian 12` · `i3wm` · `Alacritty` · `Rofi` · `GPL-3.0`

</div>
