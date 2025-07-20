{ config, pkgs, ... }:
{
    systemd.services.hproxy = {
        description = "HAProxy";
        after = [ "network.target" "sops-nix.service" ];
        requires = [ "sops-nix.service" ];
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
            ExecStart = "${pkgs.haproxy}/bin/haproxy -f /run/secrets/haproxy";
        };
    };
}
