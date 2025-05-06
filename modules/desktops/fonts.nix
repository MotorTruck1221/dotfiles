{ pkgs, pkgs-unstable, ... }:
{
    fonts.enableDefaultPackages = true;
    fonts.packages = with pkgs; [ 
        dejavu_fonts 
        texlivePackages.opensans 
        league-spartan
    ] 
    ++ 
    builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs-unstable.nerd-fonts);
}
