{
  description = "NixOS Config";

  inputs = {
    nixpkgs-unstable = { 
        url = "github:nixos/nixpkgs/nixos-unstable"; 
    };
    nixpkgs = {
        url = "github:nixos/nixpkgs/nixos-24.11";
    };
    agenix = { 
        url = "github:ryantm/agenix";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, agenix, ... }@inputs: let
    system = "x86_64-linux";
    pkgs-stable = nixpkgs-unstable.legacyPackages.${system};
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
                "devinka" = nixpkgs.lib.nixosSystem {
                    inherit system;
                    specialArgs = {inherit inputs agenix pkgs-unstable;};
                    modules = [
                        ./systems/devinka/configuration.nix
                        ./systems/devinka/programs.nix
                        agenix.nixosModules.default
                    ];
                };
  	        };
	    };
    }
