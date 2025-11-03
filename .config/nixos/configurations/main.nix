# /etc/nixos/configurations/main.nix
{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/boot.nix
    ./modules/desktop.nix
    ./modules/hardware.nix
    ./modules/locale.nix
    ./modules/settings.nix
    ./modules/packages.nix
  ];

  system.stateVersion = "25.05";
}
