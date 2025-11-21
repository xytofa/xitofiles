# /etc/nixos/modules/home/home.nix
{ config, lib, pkgs, ... }:

{
  imports =
  [
      # Appconf
    ./applications/kitty.nix

      # Deskconf
  ];

  home = {
      username = "mikail";
      homeDirectory = "/home/mikail";
      stateVersion = "25.05";
      packages = with pkgs; [
        # Editors/CLI
        micro
        kitty
        wl-clipboard
        fastfetch
        ffmpeg

        # Browsers/Media
        firefox
        vlc

        # Gaming
        steam
        vesktop
        protontricks
        mangohud
        gamemode
        prismlauncher

        # Fonts
        nerd-fonts.jetbrains-mono
        nerd-fonts.fira-mono
    ];
  };
}
