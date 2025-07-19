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
	   	            specialArgs = {
                        inherit inputs agenix pkgs-unstable;
                        hostname = "voltex";
                    };
	   	            modules = [
                        ./base.nix
	   	                ./systems/voltex
			            agenix.nixosModules.default
	   	            ];
      		    };
                "devinka" = nixpkgs.lib.nixosSystem {
                    inherit system;
                    specialArgs = {
                        inherit inputs agenix pkgs-unstable;
                        hostname = "devinka";
                    };
                    modules = [
                        ./base.nix
                        ./systems/devinka
                        agenix.nixosModules.default
                    ];
                };
                "vps-1" = nixpkgs.lib.nixosSystem {
                    inherit system;
                    specialArgs = {
                        inherit inputs agenix pkgs-unstable;
                        hostname = "vps-1";
                    };
                    modules = [
                        ./base.nix
                        ./systems/vps-1
                        agenix.nixosModules.default
                    ];
                };
  	        };
	    };
    }
