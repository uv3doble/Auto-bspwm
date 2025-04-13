# Mi Entorno Automatizado en Parrot OS

Este proyecto proporciona un script y un conjunto de configuraciones para automatizar la instalación y configuración de un entorno de trabajo personalizado sobre Parrot OS. La idea es simplificar el despliegue de herramientas, gestores de ventanas, terminales, fuentes y otros elementos, de modo que, con un solo comando, puedas replicar tu entorno en cualquier máquina sin necesidad de configurarlo manualmente cada vez.

ejecuta sin root, te pedirá root para las acciones que solo lo requieran
./auto-script.sh

## ¿Qué se instala y configura?

- **BSPWM y SXHKD**: Un gestor de ventanas dinámico y su demonio de atajos de teclado.
- **Polybar, Picom y Rofi**: Barra de estado, compositor y launcher para mejorar la usabilidad del entorno.
- **Fuentes NerdFont y Powerlevel10k**: Fuentes y temas de terminal que ofrecen una experiencia visual mejorada.
- **Kitty**: Un emulador de terminal altamente personalizable.
- **ZSH y Plugins**: Shell ZSH con autocompletado, sugerencias y un prompt altamente configurable con Powerlevel10k.
- **Herramientas adicionales (bat, lsd, feh, imagemagick, etc.)**: Para mejorar la productividad y la integración con el sistema.
- **Archivos de configuración personalizados (bspwmrc, sxhkdrc, .zshrc, .p10k.zsh, scripts para polybar, etc.)**: Ajustados para tu entorno, pero adaptables a cualquier usuario gracias al uso de `$HOME` en vez de nombres de usuario fijos.


![image](https://github.com/user-attachments/assets/662ef00c-4832-48ff-af70-2119e5f6f482)

## ¿Cómo funciona?

1. **Ejecución del script**:  
   Simplemente clona este repositorio en tu directorio de trabajo y ejecuta el script principal como usuario normal (no root). Este solicitará permisos administrativos cuando sea necesario (instalación de paquetes, copia de archivos en rutas del sistema, etc.).

2. **Ajuste de rutas dinámicas**:  
   Las configuraciones están preparadas para no depender de un usuario específico. Todas las referencias a rutas de home se han reemplazado por `$HOME` para que se adapten automáticamente al usuario en el que se esté ejecutando el script.

3. **Despliegue rápido del entorno**:  
   El script instalará las dependencias, copiará las configuraciones, ajustará permisos y ubicará todos los archivos necesarios para tener tu entorno en funcionamiento de inmediato, con la misma apariencia y funcionalidades que el entorno original.

![image](https://github.com/user-attachments/assets/66130b4e-23b5-42eb-8a09-50c6eae45a8d)


## Requisitos

- **Parrot OS** u otra distribución basada en Debian.
- **Acceso a sudo**: Para la instalación de paquetes y ajustes del sistema.
- **Conexión a Internet**: Para clonar repositorios y descargar dependencias.

![image](https://github.com/user-attachments/assets/ff2e51ca-40b9-4f55-b082-686d7a6530f1)

## Notas adicionales

- Tras la ejecución del script, es recomendable cerrar sesión y volver a iniciarla para que todos los cambios surtan efecto (debes iniciar el sistema como BSPWM).
- Si deseas personalizar aún más las configuraciones, revisa los archivos `.zshrc`, `.p10k.zsh`, `bspwmrc`, `sxhkdrc` y la carpeta `polybar` para ajustarlos según tus necesidades.

# Guía de Atajos para BSPWM y Kitty

Este documento detalla los atajos de teclado más útiles para gestionar ventanas y terminales en un entorno configurado con **BSPWM** y **Kitty**. Estos atajos están diseñados para maximizar la productividad y la facilidad de uso.

Muchos de estos comandos no los utilizo, tendras que modificar el sxhkdrc para definir los atajos que mas te convengan

## BSPWM

### Manejo de Ventanas

| Acción                                   | Atajo                              |
|------------------------------------------|------------------------------------|                        |
| Redimensionar la ventana actual          | `Windows + Shift + R`              |          |
| Mover la ventana a otra posición/monitor | `Windows + Shift + ← o →`          |
| Desactivar el modo flotante de la ventana| `Windows + T`                      |
| Activar el modo flotante para la ventana | `Windows + S`                      |
| Arrastrar y mover la ventana flotante    | `Windows + Click Izquierdo`        |
| Redimensionar la ventana flotante        | `Windows + Click Derecho`          |
| Maximizar la ventana actual              | `Windows + F`                      |
| Cerrar la ventana activa                 | `Windows + Q`                      |
| Reiniciar BSPWM para aplicar nuevas configuraciones | `Windows + Shift + Q`             |

### Navegación

| Acción                                   | Atajo                              |
|------------------------------------------|------------------------------------|
| Cambiar el enfoque entre ventanas abiertas | `Windows + ↑, ↓, ←, →`             |
| Cambiar al espacio de trabajo correspondiente | `Windows + Números`              |
| Mover la ventana activa al espacio de trabajo seleccionado | `Windows + Shift + Números`     |

### Seguridad

| Acción                                   | Atajo                              |
|------------------------------------------|------------------------------------|
| Desbloquear la pantalla                  | `Windows + Control + Shift + Espacio` |
| Bloquear la pantalla                     | `Windows + Shift + X`              |
| Restablecer todas las configuraciones de BSPWM | `Windows + Escape`              |

### Lanzadores

| Acción                                   | Atajo                              |
|------------------------------------------|------------------------------------|
| Abrir Rofi (lanzador de aplicaciones)    | `Windows + D`                      |
| Abrir el navegador Firefox               | `Windows + Shift + F`              |
| Reiniciar el sistema                     | `Windows + Shift + Q`              |

---

## Kitty

### Manejo de Terminal

| Acción                                   | Atajo                              |
|------------------------------------------|------------------------------------|
| Abrir una nueva ventana de terminal      | ` Shift + Enter`                   |
| Abrir una nueva pestaña                  | `Control + Shift + T`              |
| Cambiar el nombre de la pestaña actual   | `Control + Shift + Alt + T`        |
| Mover la pestaña actual                  | `Control + Shift + .`              |
| Cerrar la pestaña actual                 | `Control + Shift + W`              |
| Alternar el panel actual entre superior e inferior | `Control + Shift + F`    |

### Navegación y Edición

| Acción                                   | Atajo                              |
|------------------------------------------|------------------------------------|
| Moverse entre los paneles de la terminal | `Control + Shift + ↑, ↓, ←, →`     |
| Redimensionar la ventana de la terminal  | `Control + Shift + R`              |
| Hacer zoom en la ventana actual de la terminal | `Control + Shift + Z`           |
| Copiar texto seleccionado                | `Control + Shift + C`              |
| Pegar texto copiado                      | `Control + Shift + V`              |

### Preselector

| Acción                                   | Atajo                              |
|------------------------------------------|------------------------------------|
| Activar la herramienta Preselector       | `Control + Shift + Alt + T`        |
| Mover el Preselector                     | `Control + Windows + Alt + ↑, ↓, ←, →` |
| Ajustar el tamaño del Preselector        | `Control + Windows + Números`      |

