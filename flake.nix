{
  description = "Media server Nix flake";

  inputs = {
    # Stable, not unstable. Tracking unstable meant a steady drip of option
    # renames, and it eventually outran nixarr entirely: nixpkgs moved default
    # python to 3.14 and added pythonMetadataCheckHook, which nixarr's own
    # python package fails. 26.05 branched near the last known-good pin and
    # has neither problem, while still getting security backports.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    # Fork of nixarr/dev adding the jellyfin 10.11.9/10/11 openapi spec
    # hashes. Upstream's table stops at 10.11.8 and has no fallback, so eval
    # dies on any nixpkgs newer than that -- unstable and both current stable
    # branches included. Drop this back to rasmus-kirk once the PR lands;
    # nothing else in the fork differs.
    nixarr.url = "github:spsalmon/nixarr/jellyfin-openapi-hashes";
    nixarr.inputs.nixpkgs.follows = "nixpkgs";
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