let
  voltex = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEEgb26a9qWgruSrlDabs4SxV3nN18h+i15pFSAKnZhx";
  devinka = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA9K9R015tUVw05TGEz0Ux8oIecbNn04x/FMyDPOBRcO";
  systems = [ voltex devinka ];
in {
    "voltex.age".publicKeys = [ voltex ];
    "wireguard.age".publicKeys = systems;
    "devinka.age".publicKeys = systems;
}
