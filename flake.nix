# /etc/nixos/flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
        url = "github:nix-community/home-manager/release-25.05";
        inputs.nixpkgs.follows = "nixpkgs";
      };

    stylix = {
        url = "github:nix-community/stylix/release-25.05";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };


  outputs = { self, nixpkgs, home-manager, stylix, ... }: {
    nixosConfigurations = {
      demir = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./modules/machine.nix
          ./modules/base.nix
          stylix.nixosModules.stylix
        ];
      };
    };

    homeConfigurations = {
      demir = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        modules = [
          ./modules/home/home.nix
          stylix.homeModules.stylix
        ];
      };
    };
  };
}
