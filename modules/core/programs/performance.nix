# /etc/nixos/modules/core/programs/performance.nix
{ config, lib, pkgs, ... }:

{
  hardware = {
    cpu.intel.updateMicrocode = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      open = false;
      modesetting.enable = true;
      powerManagement.enable = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.production; # Using the latest stable package
    };
  };
}
