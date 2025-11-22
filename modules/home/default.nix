{ ... }:

{
  imports = [
    ./settings/user.nix
    ./settings/packages.nix
    ./settings/applications/kitty.nix
  ];

  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "25.05";
}
