{ pkgs, ... }:
{
    environment.SystemPackages = [
       bluez
       bluez-tools
    ];

    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
    };
}
