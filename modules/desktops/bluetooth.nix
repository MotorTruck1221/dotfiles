{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
       bluez
       bluez-tools
       blueman
    ];

    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
    };
}
