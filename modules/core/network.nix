{ hostname, config, ... }:
{
    networking.hostName = "${hostname}";
    services.openssh.enable = true;
    networking.nameservers = [ "1.1.1.1#one.one.one.one" "8.8.8.8" ];
    services.resolved = {
        enable = true;
        settings.Resolve = {
            DNSOverTLS = "true";
            DNSSEC = "true"; 
            Domains = [ "~." ]; 
            FallbackDNS = [ "1.1.1.1#one.one.one.one" "8.8.8.8" ];
        };
    };
    ## The rest of this is system specific you need to specify this in your system config
}
