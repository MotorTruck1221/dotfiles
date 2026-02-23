{ config, pkgs, ... }:
{
    services.postgresql = {
        enable = true;
        authentication = lib.mkOverride 10 ''
            local all all trust
        '';
    };
}
