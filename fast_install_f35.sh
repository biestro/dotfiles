#!/bin/sh

# FIRST STEPS
sudo dnf install -y \
	vim vim-X11 git zsh rofi ffmpeg pip xbacklight emacs acpi htop xclip unzip unrar

### rpm fusion (free and nonfree)
sudo dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

### oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### snap
sudo dnf install -y snapd



################
# APPLICATIONS #
################

### Librewolf
sudo rpm --import https://keys.openpgp.org/vks/v1/by-fingerprint/034F7776EF5E0C613D2F7934D29FBD5F93C0CFC3

sudo dnf config-manager --add-repo https://rpm.librewolf.net

sudo dnf update -y

sudo dnf install -y librewolf

### Tor Browser
sudo dnf install -y torbrowser-launcher

### Polybar
sudo dnf install -y polybar

### Cmus
sudo dnf install cmus

### Mpd
sudo dnf install mpd ncmpcpp
mkdir $HOME/.local/share/mpd
# set everything from my config
# sudo systemctl stop mpd.socket (to reset)


### password manager
sudo dnf install -y keepassxc

### bandcamp dl and pywal
pip install bandcamp-downloader pywal

### doom emacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
# for the manual .el files
mkdir $HOME/.emacs.d/lisp/
wget -O $HOME/.emacs.d/lisp/xresources-theme.el https://raw.githubusercontent.com/martenlienen/xresources-theme/master/xresources-theme.el

### zathura
sudo dnf install zathura zathura-pdf-poppler

# zathura-pywal
git clone https://github.com/GideonWolfe/Zathura-Pywal.git && ./Zathura-Pywal/install.sh

# my stuff (doom emacs, replace later with script that clones my repo)
curl https://raw.githubusercontent.com/ModifiedBear/dotfiles/master/.doom.d/config.el --output $HOME/.doom.d/config.el
curl https://raw.githubusercontent.com/ModifiedBear/dotfiles/master/.doom.d/init.el --output $HOME/.doom.d/init.el
curl https://raw.githubusercontent.com/ModifiedBear/dotfiles/master/.doom.d/packages.el --output $HOME/.doom.d/packages.el

# requires for .emacs.d/bin to be on path
doom sync

### signal
sudo snap install signal-desktop

### mpv
sudo dnf install mpv youtube-dl

### mtpfs
# git clone https://github.com/phatina/simple-mtpfs.git && cd simple-mtpfs
# mkdir build
# ./autogen.sh
# cd build
# ../configure
# 
### nautilus and file stuff 
sudo dnf install -y nautilus ranger && sudo dnf remove -y thunar

### rust stuff
git clone https://github.com/rust-analyzer/rust-analyzer.git
cd rust-analyzer
cargo xtask install --server # will install rust-analyzer into $HOME/.cargo/bin

#################
# CUSTOMIZATION #
#################

# oh my zsh theme
# either change .zshrc or clone a .zshrc

### i3 gaps

sudo dnf remove -y i3-gaps
sudo dnf copr enable -y fuhrmann/i3-gaps
sudo dnf install -y i3-gaps

### replace i3 config
# FILE=/home/ar/.config/config
#if [ -f "$FILE" ]; then
#	echo "replacing $FILE."
curl https://raw.githubusercontent.com/ModifiedBear/configFiles/master/.config/i3/config \
	--output $HOME/.config/i3/config
#fi

### alternating layouts (i3)
# dependency:
pip install i3ipc
curl https://raw.githubusercontent.com/olemartinorg/i3-alternating-layout/master/alternating_layouts.py --output alternating_layouts.py

### copy kitty config and theme

curl https://raw.githubusercontent.com/ModifiedBear/configFiles/master/.config/kitty/kitty.conf --output ~/.config/kitty/kitty.conf

curl https://raw.githubusercontent.com/ModifiedBear/configFiles/master/.config/kitty/theme.conf --output ~/.config/kitty/theme.conf

### polybar config
mkdir $HOME/.config/polybar && cd $HOME/.config/polybar
curl https://raw.githubusercontent.com/ModifiedBear/configFiles/master/.config/polybar/cmus.sh --output cmus.sh

curl https://raw.githubusercontent.com/ModifiedBear/configFiles/master/.config/polybar/config --output config

curl https://raw.githubusercontent.com/ModifiedBear/configFiles/master/.config/polybar/launch.sh --output launch.sh

chmod +x $HOME/.config/polybar/launch.sh

### wal
# add wallpaper to repo
# curl wallpaper
# wal -i /path/to/dir

### disable lightdm (from fedora i3 spin)
systemctl disable lightdm.service

### Rofi themes
# change later for my own style
# git clone --depth=1 https://github.com/adi1090x/rofi.git
# cd rofi
# chmod +x setup.sh

### xresources, might not even be useful
curl https://raw.githubusercontent.com/ModifiedBear/dotfiles/master/.Xresources \
	--output .Xresources

# # lock screen
# sudo dnf remove i3lock
# sudo dnf copr -y enable tokariew/i3lock-color
# sudo dnf install -y i3lock-color ImageMagick
# wget https://git.io/JZyxV -O - -q | bash -- system
# get my lock.sh script
# 

### xbacklight stuff for intel
sudo echo \ 
'Section "Device"
 	Identifier  "Intel Graphics"
	Driver      "intel"
	Option      "Backlight"  "intel_backlight"
EndSection' >> /etc/X11/xorg.conf

# adds this:
# Section "Device"
#     Identifier  "Intel Graphics" 
#     Driver      "intel"
#     Option      "Backlight"  "intel_backlight"
# EndSection


### touchpad stuff
sudo echo \
'Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "True"
	Option "Tapping" "on"
	Option "ClickMethod" "clickfinger"
EndSection' >> /etc/X11/xorg.conf.d/40-libinput.conf

### firefox css
# mkdir .mozi
# curl https://raw.githubusercontent.com/andreasgrafen/cascade/main/userChrome.css --output userChrome.css

### volume notification sound
# wget drip.ogg from my repo
# store it somewhere (for now it is .local/share/sounds/drip.ogg)
#

### dunst
mkdir $HOME/.config/dunst
# clone my dunstrc

#########
# FONTS #
#########

### siji font
mkdir .fonts
git clone https://github.com/stark/siji && cd siji
./install.sh -d ~/.fonts

### terminus
# make a directory in my repo for this
### spleen
#git clone https://github.com/fcambus/spleen.git && cd spleen
#sudo dnf install bdftopcf
sudo dnf install terminus-fonts

# FINAL

### update grub (not sure to do this)
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

### download p.kdbx
# curl https://github.com/ModifiedBear/configFiles/blob/master/p.kdbx?raw=true \
#	--output $HOME/Downloads/p.kdbx
# does not work, you have to cline the repo
