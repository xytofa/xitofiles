# /etc/nixos/modules/users/default.nix
{ pkgs, ... }:

{
  users.users.mikail = {
    isNormalUser = true;
    description = "mikail";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
