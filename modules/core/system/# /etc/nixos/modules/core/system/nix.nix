# /etc/nixos/modules/core/system/users.nixos
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
