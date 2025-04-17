{ pkgs, ... }:
{
    security.pam.services.hyprlock = {};
    environment.systemPackages = with pkgs; [
        hyprlock
        hyprshot
    ];
}
