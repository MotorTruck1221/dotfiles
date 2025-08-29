{ config, pkgs, ... }:
{
    virtualisation.oci-containers = {
        backend = "docker";
        containers = {
            incognito = {
                image = "motortruck1221/incognito:latest";
                ports = ["8080:8000"];
                cmd = [
                    "full"
                ];
            };
            epoxy = {
                image = "motortruck1221/wisp-server-rust:latest";
                ports = [];
            };
        };
    };
}
