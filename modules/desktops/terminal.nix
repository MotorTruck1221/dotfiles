{ pkgs, ... }:
{
    programs.fish.enable = true; 
    services.greetd = {
      enable = true;
      settings = {
          default_session = {
              command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd river";
              user = "motortruck1221";
          };
      };
    };
    environment.systemPackages = with pkgs; [
        alacritty
        thefuck
        ranger
        zellij 
        neovim
        starship
    ];
}
