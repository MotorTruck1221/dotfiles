{ config, pkgs, inputs, agenix, ... }:
{
  imports = [
  	./voltex.nix
  ];
  age.secrets.secret.file = ./secrets/secret.age;
  age.identityPaths =  [ "/home/motortruck1221/.ssh/id_ed25519" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "voltex";
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
    extraGroups = [ "docker" "networkmanager" "wheel" "audio" "video" "power" ];
    packages = with pkgs; [];
  };
    nixpkgs.config = {
        allowUnfree = true;
        permittedInsecurePackages = [
            "olm-3.2.16"
        ];
    };
  environment.sessionVariables = {
      XDG_CONFIG_HOME = "$HOME/.dotfiles/config";
      STARSHIP_CONFIG = "$HOME/.dotfiles/config/starship.toml";
      GIT_CONFIG_GLOBAL = "$HOME/.dotfiles/config/.gitconfig";
  };
  programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
  };
  programs.fish.enable = true;
  programs.river = { 
  	enable = true;
	xwayland.enable = true;
  };
  programs.thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-volman
      ];
  };
  programs.xfconf.enable = true;
  programs.appimage.binfmt = true;
  programs.kdeconnect = {
      enable = true;
      package = pkgs.kdePackages.kdeconnect-kde;
  };
  programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        fuse
        glib
        dbus
        stdenv.cc.cc.lib
        postgresql.dev
        postgresql.lib
      ];
  };
  programs.adb = {
      enable = true;
  };
  services.openssh.enable = true;
  networking.nameservers = [ "1.1.1.1#one.one.one.one" "8.8.8.8" ];
  services.resolved = {
      enable = true;
      dnssec = "true";
      domains = [ "~." ];
      fallbackDns = [ "1.1.1.1#one.one.one.one" "8.8.8.8" ];
      dnsovertls = "true";
  };
  services.tumbler.enable = true;
  services.seatd.enable = true;
  services.flatpak = {
    enable = true;
  };
  systemd.services.flatpak-repo = {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.flatpak ];
      script = ''
        flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      ''; 
  };
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = false;
  system.stateVersion = "24.11";
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.trusted-users = [ "root" "motortruck1221" ];
  nix.settings.allowed-users = [ "root" "motortruck1221" ];
  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;
  documentation.man.generateCaches = false;
  security.pam.services.kwallet = {
      name = "kwallet";
      enableKwallet = true;
  };
}
