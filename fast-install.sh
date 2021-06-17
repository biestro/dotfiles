#!/usr/bin/env bash

set -e

sudo dnf update

# all installation
sudo dnf install -y git wget curl i3-gaps i3status feh rofi

# enable RPM fusion repo
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
