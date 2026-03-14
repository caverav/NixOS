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
    ./ga401.nix
  ];

  nix.settings = {
    cores = 4;
    max-jobs = 2;
  };

  hardware.bluetooth = {
    enable = true;
  };

  # Home-manager config
  home-manager.sharedModules = [
    (_: {
      home.packages = with pkgs; [
        kdePackages.okular
        # gparted
      ];
    })
  ];

  # Enable common container config files in /etc/containers
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  environment.systemPackages = with pkgs; [
    obsidian
    openvpn
    opencommit
    vscode
    texliveFull
    zathura
    mupdf
    windsurf
    neovim

    (flameshot.override { enableWlrSupport = true; })
    burpsuite
    sqlmap
    ffuf
    snyk

    podman
    podman-compose
    dive # look into docker image layers

    hyprpanel
    libgtop
    dart-sass
    upower
    gpustat
    # power-profiles-daemon
    gpu-screen-recorder
    hyprsunset
  ];
  
  services.envfs.enable = true;

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

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
