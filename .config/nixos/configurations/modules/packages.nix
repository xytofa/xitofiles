# /etc/nixos/configurations/modules/packages.nix
{ config, pkgs, lib, ... }:

{
  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      konsole
      elisa
      gwenview
      okular
    ];

    systemPackages = with pkgs; [
      # Core Utilities
      micro
      curl
      wget
      git
      htop
      wl-clipboard
      alacritty

      # Diagnostics
      iotop
      lm_sensors
      pciutils
      usbutils
      unzip
      p7zip
      lshw
      fastfetch
      dconf

      # Graphics & Media
      libva-vdpau-driver
      xwayland
      firefox
      vlc
      ffmpeg

      # Gaming
      steam
      protontricks
      mangohud
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.zed-mono
  ];
}
