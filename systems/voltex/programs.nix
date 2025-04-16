{ config, pkgs, pkgs-unstable, agenix, ... }: 
{
    environment.systemPackages = 
    (with pkgs; [
	    neovim
	    starship
	    alacritty
	    river
	    swww
	    eww
	    thefuck
	    wideriver
	    bemenu
	    waybar # For the actual bar, may be replaced with eww at some point
	    discord
	    cava
	    pamixer
	    pavucontrol
	    zellij
        ranger
        dunst
        hyprlock
        openresty
        nginx
        distrobox
        kdePackages.krdc
        libsForQt5.krdc
        hyprshot
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
    ])
    
    ++

    (with pkgs-unstable; [
        android-studio
        watchman
        bundix
        zig
        sqlite
        rbenv
        libpcap
        postgresql
        postgresql.dev
        postgresql.lib
        libxml2
        libxslt
        pkg-config 
    ]);
}
