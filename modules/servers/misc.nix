{ pkgs, ... }:
{
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };
    programs.mtr.enable = true;
    programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
    };
  virtualisation.docker.enable = true;
}
