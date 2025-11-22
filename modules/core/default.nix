{ ... }:

{
  imports = [
    ./system/machine.nix
    ./system/boot.nix
    ./system/locale.nix
    ./system/nix.nix
    ./system/user.nix

    ./programs/performance.nix
    ./programs/packages.nix

    ./services/daemons.nix
  ];
}
