{ config, pkgs, ... }:

{
  # 1. User Settings
  home.username = "mikail";
  home.homeDirectory = "/home/mikail";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
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
}
