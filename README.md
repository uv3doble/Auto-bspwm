# Mi Entorno Automatizado en Parrot OS

Este proyecto proporciona un script y un conjunto de configuraciones para automatizar la instalación y configuración de un entorno de trabajo personalizado sobre Parrot OS. La idea es simplificar el despliegue de herramientas, gestores de ventanas, terminales, fuentes y otros elementos, de modo que, con un solo comando, puedas replicar tu entorno en cualquier máquina sin necesidad de configurarlo manualmente cada vez.

## ¿Qué se instala y configura?

- **BSPWM y SXHKD**: Un gestor de ventanas dinámico y su demonio de atajos de teclado.
- **Polybar, Picom y Rofi**: Barra de estado, compositor y launcher para mejorar la usabilidad del entorno.
- **Fuentes NerdFont y Powerlevel10k**: Fuentes y temas de terminal que ofrecen una experiencia visual mejorada.
- **Kitty**: Un emulador de terminal altamente personalizable.
- **ZSH y Plugins**: Shell ZSH con autocompletado, sugerencias y un prompt altamente configurable con Powerlevel10k.
- **Herramientas adicionales (bat, lsd, feh, imagemagick, etc.)**: Para mejorar la productividad y la integración con el sistema.
- **Archivos de configuración personalizados (bspwmrc, sxhkdrc, .zshrc, .p10k.zsh, scripts para polybar, etc.)**: Ajustados para tu entorno, pero adaptables a cualquier usuario gracias al uso de `$HOME` en vez de nombres de usuario fijos.

## ¿Cómo funciona?

1. **Ejecución del script**:  
   Simplemente clona este repositorio en tu directorio de trabajo y ejecuta el script principal como usuario normal (no root). Este solicitará permisos administrativos cuando sea necesario (instalación de paquetes, copia de archivos en rutas del sistema, etc.).

2. **Ajuste de rutas dinámicas**:  
   Las configuraciones están preparadas para no depender de un usuario específico. Todas las referencias a rutas de home se han reemplazado por `$HOME` para que se adapten automáticamente al usuario en el que se esté ejecutando el script.

3. **Despliegue rápido del entorno**:  
   El script instalará las dependencias, copiará las configuraciones, ajustará permisos y ubicará todos los archivos necesarios para tener tu entorno en funcionamiento de inmediato, con la misma apariencia y funcionalidades que el entorno original.

## Requisitos

- **Parrot OS** u otra distribución basada en Debian.
- **Acceso a sudo**: Para la instalación de paquetes y ajustes del sistema.
- **Conexión a Internet**: Para clonar repositorios y descargar dependencias.

## Notas adicionales

- Tras la ejecución del script, es recomendable cerrar sesión y volver a iniciarla para que todos los cambios surtan efecto (especialmente en el shell, BSPWM y Powerlevel10k).
- Si deseas personalizar aún más las configuraciones, revisa los archivos `.zshrc`, `.p10k.zsh`, `bspwmrc`, `sxhkdrc` y la carpeta `polybar` para ajustarlos según tus necesidades.

## Licencia

Este proyecto se distribuye bajo la [licencia que decidas agregar], por lo que puedes modificarlo y adaptarlo a tu gusto.

