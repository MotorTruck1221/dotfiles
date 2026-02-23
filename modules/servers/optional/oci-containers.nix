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
                image = "motortruck1221/nebula:9.1.1";
                ports = ["6001:8080"];
                volumes = [
                    "${config.sops.secrets.nebula.path}:/app/config.toml"
                    "/var/run/postgresql:/var/run/postgresql:rw"
                ];
            };
            wisp-python = {
                image = "motortruck1221/wisp-server-python:1.0.1";
                ports = ["4000:4000"];
            };
        };
    };
}
