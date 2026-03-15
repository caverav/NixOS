{
  pkgs,
  wallpaper,
  ...
}: let
  theme = import ../tokens.nix;
  catppuccin-gtk = pkgs.catppuccin-gtk.overrideAttrs {
    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "gtk";
      rev = "v1.0.3";
      fetchSubmodules = true;
      hash = "sha256-q5/VcFsm3vNEw55zq/vcM11eo456SYE5TQA3g2VQjGc=";
    };

    postUnpack = "";
  };
in {
  home-manager.sharedModules = [
    ({config, ...}: {
      # Set wallpaper
      services.hyprpaper = {
        enable = true;
        settings = {
          preload = ["${../wallpapers/${wallpaper}}"];
          wallpaper = [",${../wallpapers/${wallpaper}}"];
        };
      };

      dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          font-name = "${theme.fonts.ui} ${toString theme.fonts.size}";
          document-font-name = "${theme.fonts.ui} ${toString theme.fonts.size}";
          monospace-font-name = "${theme.fonts.ui} ${toString theme.fonts.size}";
        };
      };

      home.pointerCursor = {
        gtk.enable = true;
        x11.enable = true;
        package = pkgs.bibata-cursors;
        name = theme.cursor.name;
        size = theme.cursor.size;
      };

      qt = {
        enable = true;
        platformTheme.name = "gtk";
      };

      gtk = {
        enable = true;
        font = {
          name = theme.fonts.ui;
          size = theme.fonts.size;
        };
        theme = {
          name = "catppuccin-mocha-mauve-compact";
          package = catppuccin-gtk.override {
            accents = ["mauve"];
            variant = "mocha";
            size = "compact";
          };
        };
        iconTheme = {
          package = pkgs.adwaita-icon-theme;
          name = "Adwaita";
        };
        gtk3.extraConfig = {
          Settings = ''
            gtk-application-prefer-dark-theme=1
          '';
        };
        gtk4.extraConfig = {
          Settings = ''
            gtk-application-prefer-dark-theme=1
          '';
        };
      };
      xdg.configFile = {
        "gtk-4.0/assets" = {
          source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
          force = true;
        };
        "gtk-4.0/gtk.css" = {
          source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
          force = true;
        };
        "gtk-4.0/gtk-dark.css" = {
          source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
          force = true;
        };
      };
    })
  ];
}
