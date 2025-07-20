{ config, pkgs, inputs, agenix, lib, ... }:
{
  imports = [
  	./hardware.nix
    ../../modules/servers
  ];

  age.secrets.devinka.file = ../../secrets/devinka.age;
  age.identityPaths =  [ "/home/motortruck1221/.ssh/id_ed25519" ];
  age.secrets.devinka.owner = "cloudflared";  
  sops.age.sshKeyPaths = [ "/home/motortruck1221/.ssh/id_ed25519" ];
  sops.age.keyFile = "/home/motortruck1221/.hidden/key.txt";
  sops.age.generateKey = false;
  sops.secrets = {
      "cloudflared/devinka" = {
          sopsFile = ../../secrets/defaults.yaml;
          format = "yaml";
          mode = "0440";
          owner = "cloudflared";
       };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.networkmanager.enable = true;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = false; 
  #networking.useDHCP = lib.mkDefault true;
  system.stateVersion = "24.11";
}
