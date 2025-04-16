{ config, pkgs, pkgs-unstable, inputs, agenix, ... }:
{
  imports = [
  	./voltex.nix
    ../../modules/desktops
  ];
  age.secrets.secret.file = ../../secrets/voltex.age;
  age.identityPaths =  [ "/home/motortruck1221/.ssh/id_ed25519" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true; 
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
  documentation.man.generateCaches = true;
  security.pam.services.kwallet = {
      name = "kwallet";
      enableKwallet = true;
  };
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [ dejavu_fonts texlivePackages.opensans ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs-unstable.nerd-fonts);
  security.rtkit.enable = true;
  services.pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      alsa = {
          enable = true;
          support32Bit = true;
      };
      jack.enable = true;
  };
  services.greetd = {
      enable = true;
      settings = {
          default_session = {
              command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd river";
              user = "motortruck1221";
          };
      };
  };
  xdg.portal = {
      enable = true;
      wlr = {
          enable = true;
      };
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
