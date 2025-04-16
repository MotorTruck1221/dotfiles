{ pkgs, ... }:
{
    users.users.motortruck1221 = {
        isNormalUser = true;
        description = "MotorTruck1221";
        shell = pkgs.fish;
        extraGroups = [ "audio" "docker" "networkmanager" "wheel" "audio" "video" "power" ];
        packages = with pkgs; [];
    };
}
