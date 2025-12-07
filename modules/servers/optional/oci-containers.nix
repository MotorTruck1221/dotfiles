{ config, pkgs, ... }:
{
    virtualisation.oci-containers = {
        backend = "docker";
        containers = {
            incognito = {
                image = "motortruck1221/incognito:latest";
                ports = ["6000:8000"];
                cmd = [
                    "standalone"
                ];
            };
            nebula = {
                image = "motortruck1221/nebula:latest";
                ports = ["6001:8080"];
            };
            epoxy = {
                image = "motortruck1221/wisp-server-rust:latest";
                ports = ["4000:4000"];
            };
        };
    };
}
