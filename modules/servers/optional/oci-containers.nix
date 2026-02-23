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
            wisp-python = {
                image = "motortruck1221/wisp-server-python:1.0.0";
                ports = ["4000:4000"];
            };
        };
    };
}
