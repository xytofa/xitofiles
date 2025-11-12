# /etc/nixos/modules/system/nix.nix
{ ... }:

{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
    };

    settings = {
      auto-optimise-store = true;
    };
  };
}
