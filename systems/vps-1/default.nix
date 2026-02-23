{ config, pkgs, inputs, agenix, lib, ... }:
{
  imports = [
  	./hardware.nix
    ../../modules/servers
    ../../modules/servers/optional/oci-containers.nix
    ../../modules/servers/optional/haproxy.nix
    ../../modules/servers/optional/ssl.nix
    ../../modules/servers/optional/postgres.nix
  ];

  sops.age.sshKeyPaths = [ "/home/motortruck1221/.ssh/id_ed25519" ];
  sops.age.keyFile = "/home/motortruck1221/.hidden/key.txt";
  sops.age.generateKey = false;
  sops.secrets = {
      haproxy = {
          format = "binary";
          sopsFile = ../../secrets/haproxy.cfg;
          mode = "0440";
          #owner = "haproxy";
          #group = "haproxy";
      };
      nebula = {
          format = "binary";
          sopsFile = ../../secrets/nebula.toml;
      };
      cloudflare-api = {
          format = "dotenv";
          sopsFile = ../../secrets/cloudflare.env;
      };
  };

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
        nftables.enable = true;
        firewall = {
            enable = true;
            allowedTCPPorts = [ 80 443 22 ];
            allowedUDPPorts = [];
            extraInputRules = ''
                ip saddr 149.56.128.250 tcp dport { 5234, 5235 } ct state new accept
              '';
            # Disables the ability to ping the server
            allowPing = false;
        };
    }; 

    system.stateVersion = "24.11";
}
