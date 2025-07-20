{ config, pkgs, pkgs-unstable, inputs, agenix, sops-nix, lib, ... }:
{
  imports = [
  	./hardware.nix
    ../../modules/desktops
  ];  
  age.secrets.wireguard.file = ../../secrets/wireguard.age;
  age.identityPaths =  [ "/home/motortruck1221/.ssh/id_ed25519" ];

  sops.age.sshKeyPaths = [ "/home/motortruck1221/.ssh/id_ed25519" ];
  sops.age.keyFile = "/home/motortruck1221/.dotfiles/secrets/keys.txt";
  sops.age.generateKey = false;
  sops.secrets = {
      wireguard = {
          format = "binary";
          sopsFile = ../../secrets/wireguard.txt;
      };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;  
  networking.networkmanager.enable = true;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  #networking.useDHCP = lib.mkDefault true;
  networking.wg-quick.interfaces.wg0 = {
      configFile = "${config.sops.secrets.wireguard.path}";
      autostart = false;
  };
  networking.firewall.enable = false;
  system.stateVersion = "24.11";
}
