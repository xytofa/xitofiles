# /etc/nixos/flake.nix
{
  description = "xitoflake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }: {

    nixosConfigurations.demir = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./configurations/configuration.nix

        ({ config, pkgs, ... }: {
          nixpkgs.config.allowUnfree = true;
          system.stateVersion = "25.05";
        })
      ];
    };
  };
}
