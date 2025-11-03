# /etc/nixos/configurations/modules/hardware.nix
{ config, pkgs, lib, ... }:

{
  hardware = {
    cpu = {
      intel.updateMicrocode = true;
    };

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      open = false;
      modesetting.enable = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;
      powerManagement.enable = true;
    };
  };
}
