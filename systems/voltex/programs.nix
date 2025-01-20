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
    ];
}
