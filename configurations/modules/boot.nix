# /etc/nixos/configurations/modules/boot.nix
{ config, pkgs, lib, ... }:

{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };

      efi = {
        canTouchEfiVariables = true;
      };
    };

    kernelPackages = pkgs.linuxPackages_latest;
    kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.vfs_cache_pressure" = 50;
      "net.ipv4.tcp_congestion_control" = "bbr";
    };

    kernelParams = [ "cpufreq.default_govenor=schedutil" ];
  };
}
