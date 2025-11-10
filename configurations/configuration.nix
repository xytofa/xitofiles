# this is the current config file i am and will use as it is simpler
{ config, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
  
    loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };
  };

  security.rtkit.enable = true;

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
    ];
  };
  
  hardware = {
    cpu = {
      intel.updateMicrocode = true;
    };

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      open = false;
      modesetting.enable = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;
      powerManagement.enable = true;
    };
  };
  
  time.timeZone = "Europe/Berlin";
  console.keyMap = "de";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };
  
  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      konsole
      elisa
      gwenview
      okular
    ];

    systemPackages = with pkgs; [
      # Core Utilities
      curl
      wget
      git
      htop
      unzip
      p7zip

      # Diagnostics
      iotop
      lm_sensors
      pciutils
      usbutils
      lshw
      dconf

      # Graphics & Media Dependencies
      libva-vdpau-driver
      xwayland
      ffmpeg
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.zed-mono
  ];
  
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
