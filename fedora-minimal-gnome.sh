# DNF flags
echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10'| sudo tee -a /etc/dnf/dnf.conf
echo 'defaultyes=1' | sudo tee -a /etc/dnf/dnf.conf

# Install GNOME base
sudo dnf upgrade -y
sudo dnf install @base-x gnome-shell gnome-terminal gnome-tweaks nautilus neofetch -y

# 'Open in Terminal' option for nautilus, user-directories in sidebar and thumbnails
sudo dnf install gnome-terminal-nautilus xdg-user-dirs xdg-user-dirs-gtk -y

# RPMfusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Flatpak
sudo dnf install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.gnome.TextEditor org.gnome.Extensions org.gnome.Calculator org.gnome.Connections -y
flatpak install com.brave.Browser com.discordapp.Discord com.spotify.Client com.visualstudio.code io.github.shiftey.Desktop org.keepassxc.KeePassXC -y

# Virtualization
sudo dnf install @virtualization -y

# End script and reboot
sudo systemctl set-default graphical.target
reboot