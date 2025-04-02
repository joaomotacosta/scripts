# Start with Fedora Custom Operating System + NetworkManager Submodules
# Ethernet connection recommended to speed up install process

# DNF flags
echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=20'| sudo tee -a /etc/dnf/dnf.conf
echo 'defaultyes=1' | sudo tee -a /etc/dnf/dnf.conf

# GNOME
sudo dnf upgrade -y
sudo dnf install gnome-shell ptyxis gnome-software gnome-tweaks gnome-extensions-app gnome-calculator gnome-disk-utility gedit nautilus fastfetch gnome-browser-connector unzip -y
sudo dnf remove gnome-tour -y

# Hardware
sudo dnf install @hardware-support -y
sudo dnf install fwupdmgr intel-undervolt -y
sudo dnf copr enable sneexy/python-validity -y
sudo dnf install open-fprintd fprintd-clients fprintd-clients-pam python3-validity -y
sudo validity-sensors-firmware
sudo python3 /usr/share/python-validity/playground/factory-reset.py
sudo systemctl enable python3-validity
sudo authselect enable-feature with-fingerprint
sudo authselect apply-changes

# Battery
sudo dnf install tlp tlp-rdw powertop -y
sudo dnf remove tuned tuned-ppd -y
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
sudo systemctl enable tlp.service
sudo systemctl mask system-rdfkill.service systemd-rfkill.socket
sudo tlp start
sudo powertop --auto-tune

# RPMfusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Flatpak
sudo dnf install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub -y

# Set graphical target and reboot
sudo systemctl set-default graphical.target
reboot
