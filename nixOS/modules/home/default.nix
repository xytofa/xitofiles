# /etc/nixos/modules/home/default.nix

{ pkgs, ... }:

{
  users.users.mikail = {
    isNormalUser = true;
    description = "Mikail";
    extraGroups = [ "networkmanager" "wheel" ];

    packages = with pkgs; [
      # Editors/CLI
      micro
      alacritty
      wl-clipboard
      fastfetch

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
      nerd-fonts.zed-mono
    ];
  };
}
