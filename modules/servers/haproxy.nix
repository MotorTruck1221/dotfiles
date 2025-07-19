{ config, pkgs, ... }:
{
    services.haproxy = {
        enable = true;
        config = "${config.age.secrets.haproxy-cfg.path}"
    };
}
