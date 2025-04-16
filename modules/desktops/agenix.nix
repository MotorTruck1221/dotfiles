{ hostname, ... }:
{
    age.secrets.${hostname}.file = ../../secrets/${hostname}.age;
    age.identityPaths =  [ "/home/motortruck1221/.ssh/id_ed25519" ];
}
