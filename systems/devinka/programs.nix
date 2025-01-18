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
	agenix.packages.${system}.default
    ];
}
