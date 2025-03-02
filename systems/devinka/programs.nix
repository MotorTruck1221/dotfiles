{ config, pkgs, agenix, ... }: 
{
    environment.systemPackages = with pkgs; [
    	git
	    fish
	    neovim
	    starship
	    fastfetch
	    agenix.packages.${system}.default
    ];
}
