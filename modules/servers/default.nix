{ ... }:
{
    imports = [
        ## Import our core stuff here to make everyones life easy
        ../core
        ####
        ./misc.nix
        ./cloudflared.nix
        ./haproxy.nix
        ./oci-containers.nix
    ];
  programs.fish.enable = true;
  services.openssh.enable = true;
}
