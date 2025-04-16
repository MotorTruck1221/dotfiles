{ pkgs, pkgs-unstable, ... }:
{
    fonts.enableDefaultPackages = true;
    fonts.packages = with pkgs; [ 
        dejavu_fonts 
        texlivePackages.opensans 
    ] 
    ++ 
    builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs-unstable.nerd-fonts);
}
