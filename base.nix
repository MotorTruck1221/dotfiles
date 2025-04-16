# Everything that I need for a base system. This is then built upon it depending on if it is a desktop/server

{ config, pkgs, pkgs-unstable, agenix, ... }:
{
    environment.systemPackages = 
    (with pkgs; [
        git
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
        gcc
        clang
        openssl
        ranger
        upx
        dust
        jq
        pydf
    ])

    ++

    (with pkgs-unstable; [
        jdk
        zlib
        zlib.dev
        deno
        nodejs
        nodePackages.pnpm
        zig
        gnumake
        ruby.devEnv
        (python3.withPackages(python-pkgs: with python-pkgs; [
            distutils
            setuptools
            pip
        ]))
    ]);
}
