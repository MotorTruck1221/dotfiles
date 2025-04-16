{ ... }:
{
    imports = [
        ./misc.nix
        ./network.nix
        ./users.nix
    ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.trusted-users = [ "root" "motortruck1221" ];
  nix.settings.allowed-users = [ "root" "motortruck1221" ];
  documentation.man.generateCaches = true; 
}
