{ hostname, config, ... }:
{
    networking.hostName = "${hostname}";
    networking.networkmanager.enable = true;
    services.openssh.enable = true;
    networking.nameservers = [ "1.1.1.1#one.one.one.one" "8.8.8.8" ];
    services.resolved = {
        enable = true;
        dnssec = "true";
        domains = [ "~." ];
        fallbackDns = [ "1.1.1.1#one.one.one.one" "8.8.8.8" ];
        dnsovertls = "true";
    };
    networking.wg-quick.interfaces.wg0.configFile = "${config.age.secrets.wireguard.path}";
    ## The rest of this is system specific you need to specify this in your system config
}
