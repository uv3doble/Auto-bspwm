#!/usr/bin/env bash

# Detectar el usuario principal
MAIN_USER="$(whoami)"
MAIN_USER_HOME="/home/$MAIN_USER"
PROJECT_DIR="$(pwd)"

# Verificar que no se ejecute como root
if [ "$EUID" -eq 0 ]; then
    echo "No ejecutes este script como root. Ejecuta como usuario normal."
    exit 1
fi

# Asegurar permisos sudo disponibles
sudo -v || { echo "No tienes privilegios sudo."; exit 1; }

############################################
# Instalación y configuración de Bspwm y Sxhkd
############################################
mkdir -p ~/Descargas
cd ~/Descargas || exit

sudo apt update
sudo apt install -y build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev \
libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev

sudo apt install -y bspwm

git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git

cd bspwm
make
sudo make install
cd ..

cd sxhkd
make
sudo make install
cd ..

cd "$PROJECT_DIR" || exit

mkdir -p $MAIN_USER_HOME/.config/{bspwm,sxhkd}

cp bspwmrc $MAIN_USER_HOME/.config/bspwm/
cp sxhkdrc $MAIN_USER_HOME/.config/sxhkd/

sudo apt install -y kitty

mkdir -p $MAIN_USER_HOME/.config/bspwm/scripts
cp bspwm_resize $MAIN_USER_HOME/.config/bspwm/scripts/
chmod +x $MAIN_USER_HOME/.config/bspwm/scripts/bspwm_resize

############################################
# Instalación de la Polybar, Picom y Rofi
############################################
sudo apt install -y polybar
sudo apt install -y libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev \
libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev \
libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev \
meson ninja-build uthash-dev

sudo apt install -y cmake

cd ~/Descargas || exit
git clone https://github.com/yshui/picom
cd picom
meson setup --buildtype=release build
ninja -C build
sudo ninja -C build install

sudo apt install -y rofi

cd "$PROJECT_DIR" || exit

############################################
# Configurando las fuentes, la Kitty e instalación de Feh
############################################
sudo apt install -y zsh

# Copiar fuentes NerdFont
cd "$PROJECT_DIR/Fuentes" || exit
sudo cp * /usr/local/share/fonts/
sudo fc-cache -v

# Eliminar kitty anterior e instalar la nueva versión
sudo apt remove -y kitty

cd "$PROJECT_DIR" || exit
sudo mv kitty /opt/

# Configurar kitty para el usuario
mkdir -p $MAIN_USER_HOME/.config/kitty
cp kitty.conf $MAIN_USER_HOME/.config/kitty/
cp color.ini $MAIN_USER_HOME/.config/kitty/color.ini

# Copiar .zshrc al HOME del usuario principal
cp .zshrc $MAIN_USER_HOME/

sudo apt install -y imagemagick feh

# Crear directorio en Desktop con el nombre del usuario
mkdir -p $MAIN_USER_HOME/Desktop/$MAIN_USER

# Copiar Fondos
cd "$PROJECT_DIR" || exit
cp -r Fondos $MAIN_USER_HOME/Desktop/$MAIN_USER/

# Copiar config de kitty a root
sudo mkdir -p /root/.config/kitty
sudo cp $MAIN_USER_HOME/.config/kitty/* /root/.config/kitty/

############################################
# Despliegue de la Polybar
############################################
cd "$PROJECT_DIR" || exit
cp -r polybar $MAIN_USER_HOME/.config/

# Instalar fuentes de la polybar
sudo cp polybar/fonts/* /usr/share/fonts/truetype/
sudo fc-cache -v

############################################
# Configuración de Picom
############################################
cd "$PROJECT_DIR" || exit
cp -r picom $MAIN_USER_HOME/.config/

############################################
# Configurando la ZSH e instalando Powerlevel10k
############################################
sudo apt install -y zsh-autocomplete zsh-autosuggestions zsh-syntax-highlighting

sudo usermod --shell /usr/bin/zsh root
sudo usermod --shell /usr/bin/zsh $MAIN_USER

# Instalar Powerlevel10k para root
sudo su - root -c "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k"
sudo su - root -c "echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc"

# Instalar Powerlevel10k para MAIN_USER
cd "$PROJECT_DIR" || exit
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $MAIN_USER_HOME/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> $MAIN_USER_HOME/.zshrc

# Copiar y renombrar .p10k-root.zsh a .p10k.zsh en /root/
sudo cp .p10k-root.zsh /root/
sudo mv /root/.p10k-root.zsh /root/.p10k.zsh

cp .p10k.zsh $MAIN_USER_HOME/

# Ajustar link simbólico para root
sudo ln -s -f $MAIN_USER_HOME/.zshrc /root/.zshrc

# Cambiar propietario del completado de bspc
sudo chown root:root /usr/local/share/zsh/site-functions/_bspc

# Copiar zsh-sudo a /usr/share/
sudo cp -r zsh-sudo /usr/share/

############################################
# Instalación de Batcat y Lsd
############################################
sudo dpkg -i "$PROJECT_DIR/bat_0.24.0_amd64.deb"
sudo dpkg -i "$PROJECT_DIR/lsd_1.1.2_amd64.deb"

############################################
# Configurando la Polybar (Scripts)
############################################
cd "$PROJECT_DIR" || exit
cp vpn_status.sh victim_to_hack.sh $MAIN_USER_HOME/.config/bspwm/scripts/
chmod +x $MAIN_USER_HOME/.config/bspwm/scripts/vpn_status.sh
chmod +x $MAIN_USER_HOME/.config/bspwm/scripts/victim_to_hack.sh

# Copiar target a ~/.config/bin/
mkdir -p $MAIN_USER_HOME/.config/bin
cp target $MAIN_USER_HOME/.config/bin/
chmod +x $MAIN_USER_HOME/.config/bin/target

# Ajustar propietarios
chown -R $MAIN_USER:$MAIN_USER $MAIN_USER_HOME/.config
chown -R $MAIN_USER:$MAIN_USER $MAIN_USER_HOME/Desktop/$MAIN_USER
chown $MAIN_USER:$MAIN_USER $MAIN_USER_HOME/.zshrc
chown $MAIN_USER:$MAIN_USER $MAIN_USER_HOME/.p10k.zsh

echo "Instalación y configuración finalizadas con éxito."
echo "Por favor, cierra sesión y vuelve a entrar para aplicar los cambios."
