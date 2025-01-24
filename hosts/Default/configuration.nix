{
  pkgs,
  gpuDriver,
  hostname,
  ...
}: {
  imports = [
    ../common.nix
    ../../modules/desktop/hyprland # Enable hyprland window manager
    ../../modules/programs/games

    ../../modules/hardware/video/${gpuDriver}.nix # Enable gpu drivers defined in flake.nix

    ../../modules/hardware/drives
    ./hardware-configuration.nix
  ];

  # Home-manager config
  home-manager.sharedModules = [
    (_: {
      home.packages = with pkgs; [
        okular # pdf viwer
        # gparted
      ];
    })
  ];

  environment.systemPackages = with pkgs; [
    obsidian
    burpsuite
    opencommit
  ];

  networking.hostName = hostname; # Define your hostname.

  # Stream my Language lessons to my devices via vlc media player
  services.minidlna = {
    enable = true;
    openFirewall = true;
    settings = {
      friendly_name = "NixOS-DLNA";
      media_dir = [ # A = Audio, P = Pictures, V, = Videos, PV = Pictures and Videos.
        "/mnt/work/Pimsleur"
        # "A,/mnt/work/Pimsleur/Russian"
      ];
      inotify = "yes";
      log_level = "error";
    };
  };
  users.users.minidlna = {
    extraGroups = ["users"]; # so minidlna can access the files.
  };
}
