{ pkgs, ... }:
{
    programs.river = { 
  	    enable = true;
	    xwayland.enable = true;
    };
    programs.thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-volman
      ];
    };
    services.tumbler.enable = true;
    programs.kdeconnect = {
      enable = true;
      package = pkgs.kdePackages.kdeconnect-kde;
  };
}
