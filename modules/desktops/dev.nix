{ pkgs-unstable, ... }:
{
    environment.systemPackages = with pkgs-unstable; [
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
    ];
}
