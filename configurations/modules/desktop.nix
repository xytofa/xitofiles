# /etc/nixos/configurations/modules/desktop.nix
{ config, pkgs, ... }:

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
  };

  services = {

    displayManager = {
      cosmic-greeter.enable = true;
      };

    desktopManager = {
      cosmic.enable = true;
      };

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
