# /etc/nixos/modules/services/core.nix

{ ... }:

{
  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
  };

  services.dbus.enable = true;
  security.polkit.enable = true;
  security.rtkit.enable = true;
}
