{ config, pkgs, pkgs-unstable, inputs, agenix, lib, ... }:
{
  imports = [
  	./hardware.nix
    ../../modules/desktops
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;  
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.useDHCP = lib.mkDefault true;
  networking.firewall.enable = false;
  system.stateVersion = "24.11";
}
