# /etc/nixos/modules/base.nix
{ config, lib, pkgs, ... }:

{
  imports =
  [
    ./core/core.nix
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
