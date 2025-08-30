{ ... }:
{
    imports = [
        # Core is imported here as to make everyones life slightly easier
        ../core
        ####
        #./agenix.nix
        ./audio.nix
        ./bluetooth.nix
        ./desktop.nix
        ./hypr.nix
        ./misc.nix
        ./fonts.nix
        ./qt.nix
        ./terminal.nix
        ./flatpak.nix
        ./dev.nix
    ];
}
