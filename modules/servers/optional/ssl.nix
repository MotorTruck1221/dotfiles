{ config, pkgs, lib, inputs, ... }:
let
    nebulaDomains = if builtins.pathExists /etc/domains/nebula.nix then import /etc/domains/nebula.nix else [];
in
{
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
                extraDomainNames = [ "nebulaproxy.io" "rubynetwork.co" ] ++ nebulaDomains;
            };
        };
    };
}
