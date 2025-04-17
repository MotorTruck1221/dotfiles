# Base packages that don't need to be configured further then this.

{ config, pkgs, agenix, ... }:
{
    environment.systemPackages = 
    with pkgs; [
        git
        git-lfs
        fish
        fastfetch
        agenix.packages.${system}.default
        btop
        curl
        wget
        zip
        unzip
        gnutar
        gzip 
        openssl
        ranger
        upx
        dust
        jq
        pydf 
    ]; 
}
