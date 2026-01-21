{
  description = "MotorTruck1221's NixOS Config";

  inputs = {
    nixpkgs-unstable = { 
        url = "github:nixos/nixpkgs/nixos-unstable"; 
    };
    nixpkgs = {
        url = "github:nixos/nixpkgs/nixos-25.11";
    };
    sops-nix = {
        url = "github:Mic92/sops-nix";
    };
    private-domains = {
        url = "git+ssh://git@github.com:/motortruck1221/private-flakes?dir=domains";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, sops-nix, ... }@inputs: let
    system = "x86_64-linux";
    pkgs-unstable = import nixpkgs-unstable {inherit system; config.allowUnfree = true;};
	in {
      	    nixosConfigurations = {
	            "voltex" = nixpkgs.lib.nixosSystem {
                    inherit system;
	   	            specialArgs = {
                        inherit inputs pkgs-unstable;
                        hostname = "voltex";
                    };
	   	            modules = [
                        ./base.nix
	   	                ./systems/voltex
                        sops-nix.nixosModules.default
	   	            ];
      		    };
                "devinka" = nixpkgs.lib.nixosSystem {
                    inherit system;
                    specialArgs = {
                        inherit inputs pkgs-unstable;
                        hostname = "devinka";
                    };
                    modules = [
                        ./base.nix
                        ./systems/devinka
                        sops-nix.nixosModules.default
                    ];
                };
                "vps-1" = nixpkgs.lib.nixosSystem {
                    inherit system;
                    specialArgs = {
                        inherit inputs pkgs-unstable;
                        hostname = "vps-1";
                    };
                    modules = [
                        ./base.nix
                        ./systems/vps-1
                        sops-nix.nixosModules.default
                    ];
                };
  	        };
	    };
    }
