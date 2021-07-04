#!/usr/bin/env bash

set -e

sudo dnf update

# enable RPM fusion repositories
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# enable i3-gaps repo
sudo dnf copr enable fuhrmann/i3-gaps

# all installation
sudo dnf install -y git wget curl i3-gaps i3status rofi polybar
