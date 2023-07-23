# DNF flags
echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10'| sudo tee -a /etc/dnf/dnf.conf
echo 'defaultyes=1' | sudo tee -a /etc/dnf/dnf.conf

# Install GNOME base
sudo dnf upgrade -y
sudo dnf install @base-x gnome-shell gnome-terminal gnome-software gnome-tweaks nautilus neofetch -y

# Extras - 'Open in Terminal', user-directories and GNOME extensions connector
sudo dnf install gnome-terminal-nautilus xdg-user-dirs xdg-user-dirs-gtk gnome-browser-connector unzip -y

# intel-undervolt
sudo dnf install intel-undervolt -y

# Virtualization
sudo dnf install @virtualization -y

# Remove GNOME Tour
sudo dnf remove gnome-tour -y

# RPMfusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Flatpak
sudo dnf install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.gnome.TextEditor org.gnome.Extensions org.gnome.Calculator org.gnome.Connections -y
flatpak install com.brave.Browser com.discordapp.Discord com.spotify.Client com.visualstudio.code io.github.shiftey.Desktop org.keepassxc.KeePassXC -y

# Orchis theme
sudo dnf install gnome-themes-extra gtk-murrine-engine sassc -y
git clone https://github.com/vinceliuice/Orchis-theme
cd Orchis-theme
./install.sh -t all -c dark -s compact -l --tweaks solid compact black primary macos submenu --shell 44
cd ~

# Tela icons
git clone https://github.com/vinceliuice/Tela-icon-theme
cd Tela-icon-theme
./install.sh -a
cd ~

# Set graphical target, autologin and reboot
sudo systemctl set-default graphical.target
sudo sed -i '6iAutomaticLoginEnable=True' /etc/gdm/custom.conf
sudo sed -i '7iAutomaticLogin=jcosta' /etc/gdm/custom.conf
reboot