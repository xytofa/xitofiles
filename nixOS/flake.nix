{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
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
          ./modules/module/default.nix

          # 6. System State
          ({ config, lib, ... }: {
            nixpkgs.config.allowUnfree = true;
            system.stateVersion = "25.05";
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
