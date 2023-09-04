#!/bin/bash

# Alterar hostname
echo 'WSVM01' | sudo tee -a /etc/hostname

# Configuração DNF
echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'defaultyes=1' | sudo tee -a /etc/dnf/dnf.conf

# Instalação RPMfusion
dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Instalação Flatpak
dnf install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Instalação ambiente gráfico (GNOME)
dnf install @base-x gnome-shell gnome-terminal nautilus -y

# Instalação ferramentas necessárias
dnf install firefox unzip -y

# Iniciar cockpit
systemctl enable --now cockpit.socket
firewall-cmd --add-service=cockpit

# Transferir versão mais recente do GoPhish (0.12.1)
curl -LO "https://github.com/gophish/gophish/releases/download/v0.12.1/gophish-v0.12.1-linux-64bit.zip"

# Extrair para pasta gophish
mkdir gophish
mv gophish-v0.12.1-linux-64bit.zip gophish
cd gophish
unzip gophish-v0.12.1-linux-64bit.zip

# Tornar o gophish executável
chmod +x gophish
echo 'GoPhish está pronto a correr!'

# Reiniciar
echo 'A reiniciar em 5 segundos...'
sleep 5 && shutdown -r now