# DNF flags
echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10'| sudo tee -a /etc/dnf/dnf.conf
echo 'defaultyes=1' | sudo tee -a /etc/dnf/dnf.conf

# Install GNOME base
sudo dnf upgrade -y
sudo dnf install @base-x gnome-shell gnome-terminal gnome-software gnome-tweaks nautilus neofetch -y

# Extras - 'Open in Terminal', user-directories and GNOME extensions connector
sudo dnf install gnome-terminal-nautilus xdg-user-dirs xdg-user-dirs-gtk gnome-browser-connector unzip -y

# Firmware - Intel Wifi (Make sure you have an internet connection)
sudo dnf install iwl7260-firmware -y

# intel-undervolt
sudo dnf install intel-undervolt -y

# auto-cpufreq
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer

# Virtualization
sudo dnf install @virtualization -y

# GNOME
sudo dnf install gnome-extensions-app gnome-calculator gnome-disk-utility gedit -y

# Brave
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser -y

# LibreOffice
sudo dnf install libreoffice-calc libreoffice-impress libreoffice-writer -y

# scrcpy
sudo dnf install scrcpy -y

# VScode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code -y

# Remove GNOME Tour
sudo dnf remove gnome-tour -y

# RPMfusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Flatpak
sudo dnf install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub -y

# Orchis theme
sudo dnf install gnome-themes-extra gtk-murrine-engine sassc -y
# git clone https://github.com/vinceliuice/Orchis-theme
# cd Orchis-theme
# ./install.sh -t all -c dark -s compact -l --tweaks solid compact black primary macos submenu --shell 44
# cd ~

# Tela icons
# git clone https://github.com/vinceliuice/Tela-icon-theme
# cd Tela-icon-theme
# ./install.sh -a
# cd ~

# Theming
git clone https://github.com/NeuronSooup/gnome-topbar-le-dots
git clone https://github.com/rose-pine/gtk

# Set graphical target, autologin and reboot
sudo systemctl set-default graphical.target
sudo sed -i '6iAutomaticLoginEnable=True' /etc/gdm/custom.conf
sudo sed -i '7iAutomaticLogin=jcosta' /etc/gdm/custom.conf
reboot