{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        kdePackages.krdc
        #libsForQt5.krdc
    ];
}
