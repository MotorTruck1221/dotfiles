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
    xdg.portal = {
      enable = true;
      wlr = {
          enable = true;
      };
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
    environment.systemPackages = with pkgs; [
        river
        swww
        eww
        wideriver
        bemenu
        waybar
        discord
        cava
        pamixer
        pavucontrol
        dunst 
        wl-clipboard
        libnotify
        grim
        slurp
        brightnessctl
        playerctl
        swayidle 
        thunderbird
        weechat
        nheko
        signal-desktop
        ungoogled-chromium
        gimp
        gnome-software
        inkscape
    ];
}
