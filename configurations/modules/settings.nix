# /etc/nixos/configurations/modules/settings.nix
{ config, pkgs, ... }:

{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
