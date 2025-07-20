{ config, pkgs, ... }:
{
    systemd.services.hproxy = {
        description = "HAProxy";
        after = [ "network.target" ];
        requires = [];
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.haproxy}/bin/haproxy -db -f /run/secrets/haproxy";
            Restart = "on-failure";
        };
    };
}
