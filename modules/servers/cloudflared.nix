{ pkgs, hostname, ... }: 
let
    cloudflaredTunnels = if hostname == "devinka" then
        {
            services.cloudflared = {
                enable = true;
                tunnels = {
                    "27161a0f-216e-4cd4-a001-a80ac05769ea" = {
                        credentialsFile = "${config.age.secrets.devinka.path}";
                        default = "http_status:500";
                    };
                };
            };
        }
        else 
            null;
in
    cloudflaredTunnels
