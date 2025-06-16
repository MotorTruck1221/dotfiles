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
  
    networking = {
        interfaces.enp3s0.ipv4.addresses = [{
            address = "104.36.87.114";
            prefixLength =  22;	
        }]; 
        defaultGateway = {
            address = "104.36.84.1";
            interface = "enp3s0";
        };
        firewall = {
            enable = true;
            allowedTCPPorts = [ 80 443 22 ];
            allowedUDPPorts = [];
        };
    };
    system.stateVersion = "24.11";
}
