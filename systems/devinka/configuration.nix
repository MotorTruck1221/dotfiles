{ config, pkgs, inputs, agenix, host, ... }:
{
  imports = [
  	./${host}.nix
  ];
  age.secrets.secret.file = ./secrets/secret.age;
  age.identityPaths =  [ "/home/motortruck1221/.ssh/id_ed25519" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "${host}";
  networking.networkmanager.enable = true;
  time.timeZone = "America/Denver";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  users.users.motortruck1221 = {
    isNormalUser = true;
    description = "MotorTruck1221";
    shell = pkgs.fish;
    passwordFile = config.age.secrets.secret.path;
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "power" ];
    packages = with pkgs; [];
  };
  nixpkgs.config.allowUnfree = true;
  environment.sessionVariables = {
      XDG_CONFIG_HOME = "$HOME/.dotfiles/config";
      STARSHIP_CONFIG = "$HOME/.dotfiles/config/starship.toml";
  };
  programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
  };
  programs.fish.enable = true;
  services.openssh.enable = true;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = false;
  networking.nameservers = [ "1.1.1.1#one.one.one.one" "8.8.8.8" ];
  services.resolved = {
      enable = true;
      dnssec = "true";
      domains = [ "~." ];
      fallbackDns = [ "1.1.1.1#one.one.one.one" "8.8.8.8" ];
      dnsovertls = "true";
  };
  services.cloudflared = {
     enable = true;
     tunnels = {
        "27161a0f-216e-4cd4-a001-a80ac05769ea" = {
              credentialsFile = "${config.age.secrets.secret.path}";
              default = "http_status:500";
          };
      };
  };
  system.stateVersion = "24.11";
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.trusted-users = [ "root" "motortruck1221" ];
  nix.settings.allowed-users = [ "root" "motortruck1221" ];
  virtualisation.docker.enable = true;
}
