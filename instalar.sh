#!/usr/bin/env bash
# Desenvolvido pelo William Santos
# contato: thespation@gmail.com ou https://github.com/thespation
# Traducido y modificado por: Alejandro Fermín https://github.com/lostalejandro

clear
##--------------------------------Funciones utilizadas en el script--------------------------------##
#--Identificar Distribución--#
declare -f VERIF_DISTRIB
function VERIF_DISTRIB()
{	INXI=`inxi -S`
	ID=`lsb_release -i`
	RELEASE=`lsb_release -r`
	if [[ $INXI = *Arch* ]]; then
			inxi -S
			sleep 2s
			echo "#-------------------Sistema soportado, la instalación seguirá------------------#"
			echo ""
			ACTUALIZAR_ARCH
			BSPWM_ARCH
			ZSH_ARCH
			PICOM_ARCH
			APPS_ARCH
			PERSONA
			
		else	
			NOTF_FALLA
			sleep 3
	fi
}

#--Función: Actualizar sistema (base Arch)--#
declare -f ACTUALIZAR_ARCH
function ACTUALIZAR_ARCH(){
			echo "#-----------------------------Actualizar sistema-------------------------------#"
				sudo pacman -Syyuu --noconfirm &&
				clear &&
			echo "#-----------------------------Sistema actualizado------------------------------#"
				sleep 2s
		}
			
#--Función: Instalar base BSPWM (base Arch)--#
declare -f BSPWM_ARCH
function BSPWM_ARCH()
	{
			echo "#----------------------------Instalando base BSPWM-----------------------------#"
				sudo pacman -S bspwm wget curl sxhkd rofi dunst xorg-xsetroot arandr --noconfirm &&
				yay -S polybar ksuperkey --noconfirm &&
				clear &&
			echo "#----------------------------Base BSPWM instalada------------------------------#"
				sleep 2s
	}

#--Función: Base Arch - Instalar ZSH (Terminal)--#
declare -f ZSH_ARCH
function ZSH_ARCH()
	{
			echo "#--------------------------------Habilitar ZSH---------------------------------#"
			echo "#----------------------Escribe exit al terminar ohmyzsh------------------------#"
			sudo pacman -S zsh cargo --noconfirm &&
			chsh -s $(which zsh) &&
			sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &&
			cd &&
			yay -S zsh-autosuggestions zsh-completions zsh-syntax-highlighting \
			zsh-theme-powerlevel10k --noconfirm &&
			cp -rf /tmp/bspyoga/home/.zshrc $HOME &&
			cp -rf /tmp/bspyoga/home/.p10k.zsh $HOME &&
			clear &&
			echo "#--------------------------------ZSH habilitado--------------------------------#"
				sleep 2s
	}

#--Función: Base Arch - Instalar Picom (Compositor)--#
declare -f PICOM_ARCH
function PICOM_ARCH()
	{
			echo "#------------------------------Habilitar PICOM---------------------------------#"
			yay -S picom-jonaburg-git --noconfirm &&
			clear &&
			echo "#------------------------------PICOM habilitado--------------------------------#"
				sleep 2s
	}

#--Función: Instalar aplicaciones complementarias (base Arch)--#
declare -f APPS_ARCH
function APPS_ARCH()
	{
			echo "#------------------------Instalar apps complementarias-------------------------#"
			sudo pacman -S kitty neofetch mousepad chromium mpd mpc \
			ncmpcpp cmatrix ranger xorg-xbacklight gpick light maim \
			bmon thunar htop feh lxappearance nitrogen geany dmenu \
			networkmanager xfconf xsettingsd xfce4-power-manager \
			accountsservice apache colord gst-plugin-gtk scribus \
			gst-plugins-bad noto-fonts-emoji gnome-disk-utility \
			pulseaudio-alsa pulseaudio-bluetooth xdg-desktop-portal-gtk \
			zenity polkit-gnome wireless_tools onboard blueman \
			xarchiver zip gzip unrar unzip tar lz4 cpio binutils \
			thunar-archive-plugin thunar-media-tags-plugin thunar-volman \
			gnome-calculator eog xf86-input-wacom xorg-xinput tmux --noconfirm &&
			yay -S betterlockscreen ly ttf-ms-fonts cava nm-tray \
			bleachbit networkmanager-dmenu-git --noconfirm &&
			sudo systemctl disable mpd &&
			sudo systemctl disable gdm lightdm sddm lxdm &&
			sudo systemctl enable ly &&
			echo "#---------Ejecuta el siguiente comando reemplazando USER por tu usuario--------#"
			echo "#----------------sudo systemctl enable betterlockscreen@$USER------------------#"
				sleep 10s
			clear &&
			echo "#-----------------------Apps complementarias instaladas------------------------#"
				sleep 2s
	}

#--Función: Usar personalizaciones para: fonts, configs, iconos, temas, polybar, dunst y rofi--#
declare -f PERSONA
function PERSONA()
	{
			echo "#---------Copiar personalizaciones (iconos, temas, fonts, fondos, etc)---------#"
				cd /tmp/bspyoga &&
				sudo cp -r /tmp/bspyoga/etc/* /etc
				sudo cp -r /tmp/bspyoga/fonts/* /usr/share/fonts
				sudo cp -r /tmp/bspyoga/icons/* /usr/share/icons
				sudo cp -r /tmp/bspyoga/themes/* /usr/share/themes
				sudo cp -rf /tmp/bspyoga/backgrounds /usr/share
				sudo cp -rf /tmp/bspyoga/home/.config/kitty /root/.config
				cp -rf /tmp/bspyoga/home/.config/* ~/.config
				cp -rf /tmp/bspyoga/home/.oh-my-zsh $HOME
				cp -rf /tmp/bspyoga/home/.vim $HOME
				cp -rf /tmp/bspyoga/home/.Xresources.d $HOME
				cp -rf /tmp/bspyoga/home/.xsettingsd $HOME
				cp -rf /tmp/bspyoga/home/.Xresources $HOME
				cp -rf /tmp/bspyoga/home/.bash_profile $HOME
				cp -rf /tmp/bspyoga/home/.bashrc $HOME
				cp -rf /tmp/bspyoga/home/.hidden $HOME
				cp -rf /tmp/bspyoga/home/.p10k.zsh $HOME
				cp -rf /tmp/bspyoga/home/.vimrc $HOME
				cp -rf /tmp/bspyoga/home/.zprofile $HOME
				cp -rf /tmp/bspyoga/home/.gtkrc-2.0 $HOME
				cp -rf /tmp/bspyoga/home/.xsettingsd $HOME
				cp -rf /tmp/bspyoga/home/.dmrc $HOME
				cp -rf /tmp/bspyoga/home/.fehbg $HOME
				cp -rf /tmp/bspyoga/home/.zshrc $HOME
				cp -rf /tmp/bspyoga/home/.xinitrc $HOME
				cp -rf /tmp/bspyoga/home/.xservercc $HOME
				
			clear &&
			echo "#---------------------Personalizaciones principales copiadas-------------------#"
				sleep 3s
			clear
			NOTF_SUCESS
	}
	
#--Función: Notificar operacion exitosa--#
declare -f NOTF_SUCESS
function NOTF_SUCESS()
	{
		zenity --info --width 300 --text "Instalación exitosa. Para que todo funcione correctamente, es recomendable que reinicie su sistema."
	}
	
#--Función: Notificar Falha na operação--#
declare -f NOTF_FALLA
function NOTF_FALLA()
	{
		clear
			echo "#----------------------------Sistema no soportado------------------------------#"
			echo "#--------Este script fue diseñado para correr en las siguientes distros:-------#"		
			echo "#-----------------------------------ArchLinux----------------------------------#"
			echo "#-En caso que esté usando- una de las mencionadas, debe tener 'inxi' instalado-#"
	}
		
##--------------------------------Funciones utilizadas en el script--------------------------------##
	clear
			echo "#------------------Este asistente instalará bspwm en su máquina----------------#"
	VERIF_DISTRIB
