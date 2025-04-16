{ config, pkgs, pkgs-unstable, inputs, agenix, ... }:
{
  imports = [
  	./voltex.nix
    ../../modules/desktops
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;    
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
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = false;
  system.stateVersion = "24.11";
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.trusted-users = [ "root" "motortruck1221" ];
  nix.settings.allowed-users = [ "root" "motortruck1221" ];
  virtualisation.docker.enable = true;
  documentation.man.generateCaches = true;
  security.pam.services = {
    kwallet = {
        name = "kwallet";
        enableKwallet = true;
    };
    hyprlock = {};
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
