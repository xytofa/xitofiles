# /etc/nixos/flake.nix

{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.05";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };



  outputs =
  { self,
    nixpkgs,
    home-manager,
    ... }:

  {
    nixosConfigurations = {
      demir = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./modules/core/default.nix
        ];
      };
    };


    homeConfigurations = {
      mikail = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        modules = [
          ./modules/home/default.nix
        ];
      };
    };
  };
}
