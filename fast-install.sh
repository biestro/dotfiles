#!/usr/bin/env bash

set -e

sudo dnf update

# enable RPM fusion repositories
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \ 
https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# enable i3-gaps repo
sudo dnf copr enable fuhrmann/i3-gaps

# some installation
sudo dnf install -y git wget curl i3-gaps i3status \ 
rofi polybar python3 python3-pip xclip xbacklight

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
