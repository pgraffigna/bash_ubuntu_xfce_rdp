#!/bin/bash
KEY=https://packages.microsoft.com/keys/microsoft.asc
REPO=https://packages.microsoft.com/repos/vscode 
PWSH=https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb

echo "[!!] Instalando escritorio XFCE y servicio RDP"
sudo apt-get update
sudo apt-get install -y xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils
sudo apt-get install -y xrdp
sudo adduser xrdp ssl-cert
sudo adduser "$USER" ssl-cert
sudo systemctl enable xrdp --now

echo "[!!] Instalando Powershell"
wget -q "$PWSH" 
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y powershell

echo "[!!] Instalando VS-CODE"
sudo apt-get install -y software-properties-common apt-transport-https wget
wget -q  -O- "$KEY" | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] $REPO stable main" 
sudo apt-get update
sudo apt-get install -y code

echo "[**] Todos los procesos terminaron satisfactoriamente [**]"
