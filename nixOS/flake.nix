{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
        url = "github:nix-community/home-manager/release-25.05";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      demir = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          # 1. Mandatory
          ./machine.nix

          # 2. Core Modules
          ./modules/system/boot.nix
          ./modules/system/locale.nix
          ./modules/system/nix.nix

          # 3. Hardware & Display
          ./modules/display/desktop.nix

          # 4. Services
          ./modules/services/core.nix
          ./modules/services/audio.nix

          # 5. User Configuration
          ./modules/home/default.nix

          # 6. Home Manager
          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.users.mikail = import ./modules/home/user.nix;
          }

          # 7. System State
          ({ config, lib, pkgs, ... }: {
            system.stateVersion = "25.05";
            nixpkgs.config.allowUnfree = true;
            environment.systemPackages = with pkgs; [
                # UTILITIES
              curl
              wget
              git
              htop
              unzip
              p7zip

                # DIAGNOSTICS
              iotop
              lm_sensors
              pciutils
              usbutils
              lshw
              dconf
            ];
          })
        ];
      };
    };
  };
}
