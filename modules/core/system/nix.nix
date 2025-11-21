# /etc/nixos/modules/core/system/nix.nix
{ config, lib, pkgs, ... }:

{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" ];
      substituters = [ "https://cache.nixos.org" ];
    };
  };
}
