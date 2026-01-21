{ config, pkgs, lib, inputs, ... }:
{
    imports = [] ++ lib.optional (builtins.pathExists /etc/domains/domains.nix) /etc/domains/domains.nix;
    security.acme = {
        acceptTerms = true;
        defaults = {
            email = "motortruck1221@protonmail.com";
            #server = "https://acme-staging-v02.api.letsencrypt.org/directory";
        };
        certs = {
            "incog.works" = {
                dnsProvider = "cloudflare";
                environmentFile = config.sops.secrets.cloudflare-api.path;
            };
            "nebulaservices.org" = {
                dnsProvider = "cloudflare";
                environmentFile = config.sops.secrets.cloudflare-api.path;
                extraDomainNames = [ "nebulaproxy.io" "rubynetwork.co" ];
            };
        };
    };
}
