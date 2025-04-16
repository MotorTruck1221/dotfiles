{ config, pkgs, pkgs-unstable, inputs, agenix, ... }:
{
  imports = [
  	./voltex.nix
    ../../modules/desktops
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;  
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = false;
  system.stateVersion = "24.11";
}
