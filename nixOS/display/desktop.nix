# /etc/nixos/modules/display/desktop.nix
{ config, pkgs, ... }:

{
  hardware = {
    cpu.intel.updateMicrocode = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      open = false;
      modesetting.enable = true;
      powerManagement.enable = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;
    };
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };

  services = {
    displayManager.sddm.enable = true;

    desktopManager.plasma6 = {
      enable = true;
    };
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    elisa
    gwenview
    okular
  ];
}
