#!/bin/bash

######################################################################################################################
# https://software.opensuse.org//download.html?project=home%3Adrommer%3Aarchlinux&package=acestream-engine

echo '

[home_drommer_archlinux_Arch]
Server = https://download.opensuse.org/repositories/home:/drommer:/archlinux/Arch/$arch' | sudo tee --append /etc/pacman.conf

key=$(curl -fsSL https://download.opensuse.org/repositories/home:drommer:archlinux/Arch/$(uname -m)/home_drommer_archlinux_Arch.key)
fingerprint=$(gpg --quiet --with-colons --import-options show-only --import --fingerprint <<< "${key}" | awk -F: '$1 == "fpr" { print $10 }')

sudo pacman-key --init
sudo pacman-key --add - <<< "${key}"
sudo pacman-key --lsign-key "${fingerprint}"
sudo pacman -Sy home_drommer_archlinux_Arch/acestream-engine
sudo pacman -Sy home_drommer_archlinux_Arch/acestream-launcher