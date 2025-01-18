let
    motortruck1221 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEEgb26a9qWgruSrlDabs4SxV3nN18h+i15pFSAKnZhx";
    users = [ motortruck1221 ];
in {
    "secret.age".publicKeys = [ motortruck1221 ];
}
