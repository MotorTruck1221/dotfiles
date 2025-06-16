{ config, pkgs, inputs, agenix, lib, ... }:
{
  imports = [
  	./hardware.nix
    ../../modules/servers
  ];

  #age.secrets.devinka.file = ../../secrets/devinka.age;
  #age.identityPaths =  [ "/home/motortruck1221/.ssh/id_ed25519" ];
  #age.secrets.devinka.owner = "cloudflared";
  age.secrets.wireguard.file = ../../secrets/wireguard.age;
  age.identityPaths =  [ "/home/motortruck1221/.ssh/id_ed25519" ];

 #boot.loader.systemd-boot.enable = true;
 #boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
      enable = true;
      device = "/dev/sda";
  };

  networking.defaultGateway = {
    address = "104.36.84.1";
    interface = "enp3s0";
  };
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = false; 
  #networking.useDHCP = lib.mkDefault true;
  system.stateVersion = "24.11";
}
