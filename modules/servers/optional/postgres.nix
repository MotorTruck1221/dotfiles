{ config, pkgs, ... }:
{
    services.postgresql = {
        enable = true;
        authentication = pkgs.lib.mkOverride 10 ''
            local all all trust
        '';
    };
}
