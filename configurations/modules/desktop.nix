# /etc/nixos/configurations/modules/desktop.nix
{ config, pkgs, lib, ... }:

{
  networking = {
    hostName = "demir";
    networkmanager.enable = true;

    firewall = {
      enable = true;
    };
  };

  users.users.mikail = {
    isNormalUser = true;
    description = "Mikail";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  services = {
    displayManager.sddm = {
      enable = true;
    };

    desktopManager.plasma6.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };

    flatpak.enable = true;
    power-profiles-daemon.enable = true;
    printing.enable = true;
  };
}
