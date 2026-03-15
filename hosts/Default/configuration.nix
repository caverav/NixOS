{
  pkgs,
  gpuDriver,
  hostname,
  ...
}: {
  imports = [
    ../common.nix
    ./apps.nix
    ./containers.nix
    ./services.nix
    ../../modules/desktop/hyprland # Enable hyprland window manager
    ../../modules/programs/games

    ../../modules/hardware/video/${gpuDriver}.nix # Enable gpu drivers defined in flake.nix

    ../../modules/hardware/drives
    ./hardware-configuration.nix
    ./ga401.nix
  ];

  nix.settings = {
    cores = 4;
    max-jobs = 2;
  };

  networking.hostName = hostname; # Define your hostname.
}
