# /etc/nixos/modules/core/system/users.nix
{ config, lib, pkgs, ... }:

{
  users.users.mikail = {
    isNormalUser = true;
    description = "Mikail";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
