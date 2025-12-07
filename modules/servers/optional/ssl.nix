{ config, pkgs, ... }:
{
    security.acme = {
        acceptTerms = true;
        defaults = {
            email = "motortruck1221@protonmail.com";
            #server = "https://acme-staging-v02.api.letsencrypt.org/directory";
        };
        certs."incog.works" = {
            dnsProvider = "cloudflare";
            environmentFile = config.sops.secrets.cloudflare-api.path;
        };
        certs."nebulaservices.org" = {
            dnsProvider = "cloudflare";
            environmentFile = config.sops.secrets.cloudflare-api.path;
        };
    };
}
