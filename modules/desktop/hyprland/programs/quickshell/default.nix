{
  inputs,
  pkgs,
  wallpaper,
  terminal,
  ...
}: let
  theme = import ../../../../themes/tokens.nix;
  inherit (theme) fonts;
  caelestiaPackage = inputs.caelestia-shell.packages.${pkgs.system}.with-cli;
in {
  home-manager.sharedModules = [
    inputs.caelestia-shell.homeManagerModules.default
    ({config, lib, ...}: {
      home.activation.caelestiaWallpaperState = lib.hm.dag.entryAfter ["writeBoundary"] ''
        mkdir -p "${config.xdg.stateHome}/caelestia/wallpaper"
        printf '%s\n' "${config.home.homeDirectory}/NixOS/modules/themes/wallpapers/${wallpaper}" > "${config.xdg.stateHome}/caelestia/wallpaper/path.txt"
      '';
      home.activation.caelestiaSchemeState = lib.hm.dag.entryAfter ["writeBoundary"] ''
        ${config.programs.caelestia.cli.package}/bin/caelestia scheme set -n catppuccin -f mocha >/dev/null 2>&1 || \
          ${config.programs.caelestia.cli.package}/bin/caelestia scheme set -n catppuccin >/dev/null 2>&1 || true
      '';

      programs.caelestia = {
        enable = true;
        package = caelestiaPackage;
        cli.enable = true;
        settings = {
          appearance = {
            transparency = {
              enabled = true;
              base = 0.82;
              layers = 0.32;
            };
            rounding.scale = 1.0;
            spacing.scale = 0.95;
            padding.scale = 0.95;
            font = {
              family = {
                sans = "Rubik";
                mono = fonts.ui;
                material = "Material Symbols Rounded";
                clock = "Rubik";
              };
              size.scale = 1.0;
            };
          };
          general = {
            logo = "nixos";
            apps = {
              terminal = [terminal];
              audio = ["pavucontrol"];
              playback = ["mpv"];
              explorer = ["thunar"];
            };
          };
          background = {
            enabled = true;
            wallpaperEnabled = true;
            desktopClock = {
              enabled = false;
              position = "top-left";
              background = {
                enabled = true;
                opacity = 0.55;
                blur = true;
              };
              shadow = {
                enabled = true;
                opacity = 0.55;
                blur = 0.35;
              };
            };
          };
          bar = {
            persistent = true;
            showOnHover = false;
            workspaces = {
              shown = 5;
              perMonitorWorkspaces = true;
              showWindows = true;
              activeIndicator = true;
              occupiedBg = false;
              activeLabel = "󰮯";
              occupiedLabel = "󰮯";
              label = "  ";
            };
            status = {
              showAudio = false;
              showMicrophone = false;
              showKbLayout = false;
              showNetwork = true;
              showWifi = true;
              showBluetooth = true;
              showBattery = true;
              showLockStatus = true;
            };
            tray = {
              background = false;
              compact = false;
              recolour = false;
            };
            entries = [
              {id = "logo"; enabled = true;}
              {id = "workspaces"; enabled = true;}
              {id = "spacer"; enabled = true;}
              {id = "activeWindow"; enabled = true;}
              {id = "spacer"; enabled = true;}
              {id = "tray"; enabled = true;}
              {id = "clock"; enabled = true;}
              {id = "statusIcons"; enabled = true;}
              {id = "power"; enabled = true;}
            ];
          };
          border = {
            thickness = 8;
            rounding = 22;
          };
          dashboard = {
            enabled = true;
            showOnHover = true;
          };
          launcher = {
            actionPrefix = ">";
            actions = [
              {
                name = "Calculator";
                icon = "calculate";
                description = "Do simple math equations";
                command = ["autocomplete" "calc"];
                enabled = true;
                dangerous = false;
              }
              {
                name = "Scheme";
                icon = "palette";
                description = "Change the current colour scheme";
                command = ["autocomplete" "scheme"];
                enabled = true;
                dangerous = false;
              }
              {
                name = "Variant";
                icon = "colors";
                description = "Change the scheme flavour";
                command = ["autocomplete" "variant"];
                enabled = true;
                dangerous = false;
              }
              {
                name = "Wallpaper";
                icon = "image";
                description = "Change the current wallpaper";
                command = ["autocomplete" "wallpaper"];
                enabled = true;
                dangerous = false;
              }
              {
                name = "Dark";
                icon = "dark_mode";
                description = "Force dark mode";
                command = ["setMode" "dark"];
                enabled = true;
                dangerous = false;
              }
            ];
          };
          lock.recolourLogo = false;
          paths.wallpaperDir = "${config.home.homeDirectory}/NixOS/modules/themes/wallpapers";
          services.useTwelveHourClock = false;
        };
      };

      xdg.configFile."caelestia/shell.json".force = true;
      xdg.configFile."caelestia/theme-note.txt".text = ''
        Managed by Home Manager. Preferred flavour: Catppuccin Mocha.
      '';
    })
  ];
}
