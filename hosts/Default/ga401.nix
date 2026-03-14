{ lib, ... }:

{
  imports = [
    ../../common/cpu/amd
    ../../common/cpu/amd/pstate.nix
    ../../common/gpu/amd
    ../../common/gpu/nvidia/prime.nix
    ../../common/gpu/nvidia/ampere
    ../../common/pc/laptop
    ../../common/pc/laptop/ssd
  ];

  hardware.nvidia = {
    # Enable DRM kernel mode setting
    # This will also cause "PCI-Express Runtime D3 Power Management" to be enabled by default
    modesetting.enable = lib.mkDefault true;

    dynamicBoost.enable = lib.mkForce false;

    prime = {
      amdgpuBusId = "PCI:4:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  services = {
    asusd.enable = lib.mkDefault true;

    udev.extraHwdb = ''
      evdev:name:*:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
       KEYBOARD_KEY_ff31007c=f20    # fixes mic mute button
       KEYBOARD_KEY_ff3100b2=home   # Set fn+LeftArrow as Home
       KEYBOARD_KEY_ff3100b3=end    # Set fn+RightArrow as End
    '';
  };

  powerManagement.cpuFreqGovernor = "powersave";

  systemd.services.laptop-stability-cap = {
    description = "Apply conservative laptop stability limits";
    wantedBy = [ "multi-user.target" ];
    after = [ "multi-user.target" ];
    serviceConfig.Type = "oneshot";
    script = ''
      if [ -w /sys/firmware/acpi/platform_profile ]; then
        echo balanced > /sys/firmware/acpi/platform_profile || true
      fi

      if [ -w /sys/devices/system/cpu/cpufreq/boost ]; then
        echo 0 > /sys/devices/system/cpu/cpufreq/boost || true
      fi
    '';
  };
}
