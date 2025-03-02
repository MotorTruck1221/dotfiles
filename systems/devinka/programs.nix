{ config, pkgs, agenix, ... }: 
{
    environment.systemPackages = with pkgs; [
    	git
	    fish
	    neovim
	    starship
	    fastfetch
        thefuck
        rbenv
        cloudflared
	    agenix.packages.${system}.default
    ];
}
