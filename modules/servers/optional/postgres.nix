{ config, pkgs, ... }:
{
    services.postgresql = {
        enable = true;
        ensureDatabases = [ "nebula" ];
        authentication = pkgs.lib.mkOverride 10 ''
            local all all trust
        '';
    };
}
