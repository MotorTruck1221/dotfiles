{ config, pkgs, pkgs-unstable, inputs, agenix, lib, ... }:
{
  imports = [
  	./hardware.nix
    ../../modules/desktops
  ];  
  age.secrets.wireguard.file = ../../secrets/wireguard.age;
  age.identityPaths =  [ "/home/motortruck1221/.ssh/id_ed25519" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;  
  networking.networkmanager.enable = true;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  #networking.useDHCP = lib.mkDefault true;
  networking.wg-quick.interfaces.wg0.configFile = "${config.age.secrets.wireguard.path}";
  networking.firewall.enable = false;
  system.stateVersion = "24.11";
}
