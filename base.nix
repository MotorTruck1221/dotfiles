# Base packages that don't need to be configured further then this.

{ config, pkgs, ... }:
{
    environment.systemPackages = 
    with pkgs; [
        git
        git-lfs
        fish
        fastfetch
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
