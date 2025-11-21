# /etc/nixos/modules/core/packages.nix
{ config, lib, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      # UTILITIES
      curl
      wget
      git
      unzip
      p7zip
      ripgrep
      fd

      # DIAGNOSTICS
      btop
      ncdu
      iotop
      lm_sensors
      pciutils
      usbutils
      lshw
    ];

    plasma6.excludePackages = with pkgs.kdePackages; [
      konsole
      elisa
      gwenview
      okular
    ];
  };

  system.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;
}
