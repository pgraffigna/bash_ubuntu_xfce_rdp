#!/bin/bash

#Colores
greenColor="\e[0;32m\033[1m"
redColor="\e[0;31m\033[1m"
yellowColor="\e[0;33m\033[1m"
endColor="\033[0m\e[0m"

trap ctrl_c INT
function ctrl_c(){
        echo -e "\n${redColor}Programa Terminado ${endColor}"
        exit 0
}

#Variables
VS_KEY=https://packages.microsoft.com/keys/microsoft.asc
VS_REPO=https://packages.microsoft.com/repos/vscode 
POWER=https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb

echo -e "${yellowColor}Instalando escritorio XFCE y servicio RDP ${endColor}"
sudo apt update && sudo apt install -y xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils xrdp

echo -e "${yellowColor}Configurando XRDP ${endColor}"
sudo adduser xrdp ssl-cert
sudo adduser "$USER" ssl-cert
sudo systemctl enable xrdp --now

echo -e "${yellowColor}Instalando Powershell ${endColor}"
wget -q "$POWER" 
sudo dpkg -i packages-microsoft-prod.deb
sudo apt update && sudo apt install -y powershell

echo -e "${yellowColor}Instalando VSCODE ${endColor}"
sudo apt install -y software-properties-common apt-transport-https wget
wget -q  -O- "$VS_KEY" | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] $VS_REPO stable main" 
sudo apt update && sudo apt install -y code

echo -e "${greenColor}Todos los procesos terminaron correctamente!! ${endColor}"
