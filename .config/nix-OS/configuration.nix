{ config, pkgs, lib, ... }:

{
  imports =
    [
    ./hardware-configuration.nix
    ];

# ------------------------------------------------------------------ #

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    kernelPackages = pkgs.linuxPackages_latest;
    kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.vfs_cache_pressure" = 50;
      "net.ipv4.tcp_congestion_control" = "bbr";
    };
  };



  networking = {
    hostName = "demir";
    networkmanager.enable = true;
    firewall.enable = true;
  };

# ------------------------------------------------------------------ #

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";



  i18n.extraLocaleSettings = {
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



  console.keyMap = "de";

# ------------------------------------------------------------------ #

  users.users.mikail = {
    isNormalUser = true;
    description = "Mikail";
    extraGroups = [ "networkmanager" "wheel" "sudo" ];
    packages = with pkgs; [];
  };

  security.rtkit.enable = true;

# ------------------------------------------------------------------ #

  services = {
    xserver = {
      xkb = {
        layout = "de";
        variant = "";
      };

      enable = true;
      videoDrivers = [ "nvidia" ];
    };



      # ---------- DISPLAY MANAGER
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };



      # ---------- DESKTOP ENVIRONMENT
    desktopManager.plasma6.enable = true;



      # ---------- PIPEWIRE
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



  nix = {
    gc.automatic = true;
    gc.dates = "weekly";

    settings = {
      cores = 2;
      auto-optimise-store = true;
    };
  };

# ----------------------------------------------------------------- #

  nixpkgs.config = {
    allowUnfree = true;
  };



  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      konsole
    ];

    systemPackages = with pkgs; [
      # Essential Tools
      micro
      curl
      wget
      git
      htop

      # System Diagnostics and Utilities
      iotop
      lm_sensors
      pciutils
      usbutils
      unzip
      p7zip
      lshw

      # Hardware/Graphics Utilities
      libva-vdpau-driver
      xwayland

      # Miscellaneous
      fastfetch
      dconf

      # Desktop Applications
      kdePackages.dolphin
      kdePackages.qtstyleplugin-kvantum
      flatpak
      alacritty
      firefox
      vlc
      ffmpeg
      wl-clipboard
      kdePackages.sddm-kcm
    ];
  };



  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.zed-mono
  ];

# ------------------------------------------------------------------ #

  system.stateVersion = "25.05";
}
