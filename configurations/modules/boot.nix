# /etc/nixos/configurations/modules/boot.nix
{ config, pkgs, lib, ... }:

{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };

      efi = {
        canTouchEfiVariables = true;
      };
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };
}
