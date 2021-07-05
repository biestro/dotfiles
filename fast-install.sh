#!/usr/bin/env bash

# for fedora 34

set -e

sudo dnf update

# enable RPM fusion repositories
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \ 
https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# enable i3-gaps repo
sudo dnf copr enable fuhrmann/i3-gaps

# some installation
sudo dnf install -y git wget curl i3-gaps i3status \ 
rofi polybar python3 python3-pip xclip xbacklight htop

# for alternating layout
pip3 install i3ipc 

# make xorg.conf
sudo touch /etc/X11/xorg.conf
echo \
"Section \"Device\"
        Identifier  "Intel Graphics"
        Driver      "intel"
        Option      "Backlight"  "intel_backlight"
EndSection" >> /etc/X11/xorg.conf
# end make xorg.conf

# polybar
# git clone my stuff (add polybar
# chmod +x ~/.config/polybar/launch.sh
# add fonts:
# SIJI:
# git clone https://github.com/stark/siji && cd siji
# ./install.sh

# alternating layout
# git clone https://github.com/olemartinorg/i3-alternating-layout.git && cd i3-alternating-layout
# chmod +x alternating_layouts.py

# chromium
sudo dnf config-manager -y --add-repo https://download.opensuse.org/repositories/home:/ungoogled_chromium/Fedora_34/home:ungoogled_chromium.repo
sudo dnf install -y ungoogled-chromium

# tlp
sudo dnf install tlp
sudo tlp start

# vim
sudo dnf install vimx
sudo mv /usr/bin/vimx /usr/bin/vim
# add my source
