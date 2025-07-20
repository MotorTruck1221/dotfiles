{ config, pkgs, ... }:
{
    systemd.services.hproxy = {
        description = "HAProxy";
        after = [ "network.target" ];
        requires = [];
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
            type = "exec";
            ExecStart = "${pkgs.haproxy}/bin/haproxy -f /run/secrets/haproxy";
            Restart = "on-failure";
        };
    };
}
