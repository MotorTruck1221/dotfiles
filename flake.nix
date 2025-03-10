{
  description = "NixOS Config";

  inputs = {
    nixpkgs = { 
        url = "github:nixos/nixpkgs/nixos-unstable"; 
    };
    nixpkgs-stable = {
        url = "github:nixos/nixpkgs/nixos-24.11";
    };
    agenix = { 
        url = "github:ryantm/agenix";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, agenix, ... }@inputs: let
    system = "x86_64-linux";
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
	in {
      	    nixosConfigurations = {
	            "voltex" = nixpkgs.lib.nixosSystem {
                    inherit system;
	   	            specialArgs = {inherit inputs agenix pkgs-stable;};
	   	            modules = [
	   	                ./systems/voltex/configuration.nix
			            ./systems/voltex/programs.nix
			            agenix.nixosModules.default
	   	            ];
      		    };
  	        };
	    };
    }
