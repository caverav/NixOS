{...}: {
  hardware.bluetooth.enable = true;
  services.envfs.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  services.minidlna = {
    enable = true;
    openFirewall = true;
    settings = {
      friendly_name = "NixOS-DLNA";
      media_dir = [
        "/mnt/work/Pimsleur"
      ];
      inotify = "yes";
      log_level = "error";
    };
  };

  users.users.minidlna.extraGroups = ["users"];
}
