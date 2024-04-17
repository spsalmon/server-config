{
  description = "Media server Nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixarr.url = "github:rasmus-kirk/nixarr";
  };

  outputs = { 
    nixpkgs,
    nixarr,
    ...
  }@inputs: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/default/configuration.nix
          nixarr.nixosModules.default
        ];

        specialArgs = { inherit inputs; };
      };
    };
  };
}