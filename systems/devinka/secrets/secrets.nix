let
    motortruck1221 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA9K9R015tUVw05TGEz0Ux8oIecbNn04x/FMyDPOBRcO";
    users = [ motortruck1221 ];
in {
    "secret.age".publicKeys = [ motortruck1221 ];
}
