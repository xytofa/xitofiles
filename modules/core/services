# /etc/nixos/modules/core/services/daemons.nix
{ config, lib, pkgs, ... }:

{
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };

    flatpak.enable = true;
    dbus.enable = true;

    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
    };

    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };

  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
    hostName = "demir";
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };
}
