{ pkgs, pkgs-unstable, ... }:
{
    programs.fish.enable = true; 
    services.greetd = {
      enable = true;
      settings = {
          default_session = {
              command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd river";
              user = "motortruck1221";
          };
      };
    };
    environment.systemPackages = 
    (with pkgs; [
        alacritty
        pay-respects
        ranger
        zellij 
        starship
    ])
    ++
    (with pkgs-unstable; [
        neovim
    ]);
}
