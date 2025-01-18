#!/bin/bash
# This script sets up a new machine with all the necessary tools and dotfiles

# Get the sudo password
echo "Enter sudo password:"
sudo echo "Thank you!"
# Install yay (AUR helper)
echo "Setting up yay..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
yay -Syyu

# Enabling multilib, community, ungoogled-chromium and arco linux
echo "Enabling multilib, community, ungoogled-chromium and others..."
sudo cat ./extraRepos.txt >> /etc/pacman.conf
# Install packages
echo "Installing packages..."
sudo pacman -Syy
yay -Syy - < pkglist.txt

