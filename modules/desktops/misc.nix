{ pkgs, ... }:
{
    # Matrix
    nixpkgs.config.permittedInsecurePackages = [
        "olm-3.2.16"
    ];
    environment.sessionVariables = {
      XDG_CONFIG_HOME = "$HOME/.dotfiles/config";
      STARSHIP_CONFIG = "$HOME/.dotfiles/config/starship.toml";
      GIT_CONFIG_GLOBAL = "$HOME/.dotfiles/config/.gitconfig";
  };
  programs.mtr.enable = true; # For the bar
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
  };
  programs.xfconf.enable = true;
  programs.appimage.binfmt = true; 
  programs.adb = {
      enable = true;
  };
  services.seatd.enable = true;
}
