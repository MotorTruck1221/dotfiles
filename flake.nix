{
  description = "User NIX flake";

  inputs = {
    nixpkgs = { 
        url = "github:nixos/nixpkgs/nixos-24.11"; 
    };
    agenix = { 
        url = "github:ryantm/agenix";
    };
  };

  outputs = { self, nixpkgs, agenix, ... }@inputs: let
  	host = "voltex";
	in {
      	    nixosConfigurations = {
	            ${host} = nixpkgs.lib.nixosSystem {
           	    system = "x86_64-linux";
	   	        specialArgs = {inherit inputs agenix host;};
	   	        modules = [
	   	            ./systems/${host}/configuration.nix
			        ./systems/${host}/programs.nix
			        agenix.nixosModules.default
	   	        ];
      		};
  	    };
	};
}
