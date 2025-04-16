{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
       bluez
       bluez-tools
    ];

    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
    };
}
