{ config, lib, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      home-manager

      # Editors/CLI
      micro
      wl-clipboard
      fastfetch
      ffmpeg
      lf

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
