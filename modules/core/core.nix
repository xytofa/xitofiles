# /etc/nixos/modules/core/core.nix
{ config, lib, pkgs, ... }:

{
  imports =
  [
    ./system/boot.nix
    ./system/users.nix
    ./system/locale.nix
    ./system/nix.nix

    ./services/daemons.nix

    ./programs/packages.nix
    ./programs/performance.nix
  ];
}
