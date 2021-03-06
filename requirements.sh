#!/usr/bin/env bash
set -e

############################# INSTALL BEGINS ################################
sudo pacman -S alacritty arc-gtk-theme arc-icon-theme dmenu bspwm rofi dunst catfish lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings lua lxappearance mousepad nano neofetch nitrogen numlockx noto-fonts noto-fonts-emoji gvfs gvfs-afc gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb gzip htop neofetch ntfs-3g pacman-contrib pcmanfm picom sxhkd ttf-dejavu xdg-user-dirs xorg-drivers xdo clipmenu zip

############### FROM AUR ###############
yay -S nerd-fonts-iosevka polybar mint-y-icons

################ Set graphical.target to default, and enable lightdm on start ####################
sudo systemctl enable lightdm
sudo systemctl set-default graphical.target
