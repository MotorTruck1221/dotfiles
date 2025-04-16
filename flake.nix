{
  description = "MotorTruck1221's NixOS Config";

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

  outputs = { self, nixpkgs, nixpkgs-unstable, agenix, ... }@inputs: let
    system = "x86_64-linux";
    pkgs-unstable = import nixpkgs-unstable {inherit system; config.allowUnfree = true;};
	in {
      	    nixosConfigurations = {
	            "voltex" = nixpkgs.lib.nixosSystem {
                    inherit system;
                    hostname = "voltex";
	   	            specialArgs = {inherit inputs agenix pkgs-unstable hostname;};
	   	            modules = [
                        ./base.nix
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
