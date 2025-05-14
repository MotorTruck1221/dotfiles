{ pkgs, pkgs-unstable, ... }:
{
    environment.systemPackages = 
    (with pkgs; [
        gcc 
        clang
        (python3.withPackages(python-pkgs: with python-pkgs; [
            distutils
            setuptools
            pip
        ]))
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
        android-studio
        watchman
        bundix
        zig
        sqlite
        rbenv
        libpcap
        postgresql
        postgresql.dev
        postgresql.lib
        libxml2
        libxslt
        pkg-config
        go
    ]);
}
