#!/bin/bash
# Chaotic AUR Setup
pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
mv /etc/pacman.conf /etc/pacman.conf.bak
cp configs/system/pacman/pacman.conf /etc/pacman.conf
pacman -S yay git linux-xanmod-linux-bin-x64v2 linux-xanmod-linux-headers-bin-x64v2 efibootmgr --needed
mv configs/system/dracut/dracut-install /usr/share/libalpm/scripts
chattr +i /usr/share/libalpm/scripts/dracut-install
find /boot -maxdepth 1 -type f -delete
mkdir -p /efi/EFI/artix/
pacman -S intel-ucode dracut broadcom-wl-dkms


