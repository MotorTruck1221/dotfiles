{ config, pkgs, agenix, ... }: 
{
    environment.systemPackages = with pkgs; [
    	git
	fish
	neovim
	starship
	fastfetch
	alacritty
	river
	swww
	eww
	thefuck
	wideriver
	bemenu
	ungoogled-chromium
	waybar # For the actual bar, may be replaced with eww at some point
	agenix.packages.${system}.default
	discord
	btop
	xdg-desktop-portal
	xdg-desktop-portal-gtk
	xdg-desktop-portal-wlr
	cava
	pamixer
	pavucontrol
	bluez
	bluez-utils
    ];
}
