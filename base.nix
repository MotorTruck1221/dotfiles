# Base packages that don't need to be configured further then this.

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
