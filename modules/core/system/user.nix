# /etc/nixos/modules/core/system/user.nix
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
