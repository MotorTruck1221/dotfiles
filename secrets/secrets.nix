let
  voltex = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEEgb26a9qWgruSrlDabs4SxV3nN18h+i15pFSAKnZhx";
  devinka = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA9K9R015tUVw05TGEz0Ux8oIecbNn04x/FMyDPOBRcO";
  vps-1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP1fXlwKwcbfpzjk9ogpf6cMsk4pCRvUrwVaBGhOlEB3";
  systems = [ voltex devinka vps-1 ];
in {
    "voltex.age".publicKeys = [ voltex ];
    "wireguard.age".publicKeys = systems;
    "devinka.age".publicKeys = systems;
    "haproxy.cfg.age".publicKeys = systems;
}
