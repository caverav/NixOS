{...}: {
  home-manager.sharedModules = [
    (_: {
      xdg.configFile."wlogout/icons".source = ./icons;
      programs.wlogout = {
        enable = true;
        layout = [
          # {
          #   label = "lock";
          #   action = "${pkgs.hyprlock}/bin/hyprlock";
          #   text = "Lock";
          #   keybind = "l";
          # }
          # {
          #   label = "hibernate";
          #   action = "systemctl hibernate";
          #   text = "Hibernate";
          #   keybind = "h";
          # }
          {
            label = "logout";
            action = "hyprctl dispatch exit 0";
            # action = "killall -9 Hyprland sleep 2";
            text = "Exit";
            keybind = "e";
          }
          {
            label = "shutdown";
            action = "systemctl poweroff";
            text = "Shutdown";
            keybind = "s";
          }
          {
            label = "suspend";
            action = "systemctl suspend";
            text = "Suspend";
            keybind = "u";
          }
          {
            label = "reboot";
            action = "systemctl reboot";
            text = "Reboot";
            keybind = "r";
          }
        ];
        style = ''
          window {
            font-family: "JetBrainsMono Nerd Font";
            font-size: 14pt;
            color: #cdd6f4; /* text */
            background-color: rgba(17, 17, 27, 0.72);
          }

          button {
            background-repeat: no-repeat;
            background-position: center;
            background-size: 24%;
            border: 1px solid rgba(180, 190, 254, 0.14);
            border-radius: 22px;
            background-color: rgba(30, 30, 46, 0.52);
            margin: 12px;
            box-shadow: inset 0 1px 0 rgba(205, 214, 244, 0.04);
            transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out, border-color 0.2s ease-in-out;
          }

          button:hover {
            background-color: rgba(49, 50, 68, 0.85);
            border-color: rgba(203, 166, 247, 0.4);
          }

          button:focus {
            background-color: rgba(203, 166, 247, 0.95);
            color: #11111b;
            border-color: rgba(137, 180, 250, 0.9);
          }
          #lock {
            background-image: image(url("icons/lock.png"));
          }
          #lock:focus {
            background-image: image(url("icons/lock-hover.png"));
          }

          #logout {
            background-image: image(url("icons/logout.png"));
          }
          #logout:focus {
            background-image: image(url("icons/logout-hover.png"));
          }

          #suspend {
            background-image: image(url("icons/sleep.png"));
          }
          #suspend:focus {
            background-image: image(url("icons/sleep-hover.png"));
          }

          #shutdown {
            background-image: image(url("icons/power.png"));
          }
          #shutdown:focus {
            background-image: image(url("icons/power-hover.png"));
          }

          #reboot {
            background-image: image(url("icons/restart.png"));
          }
          #reboot:focus {
            background-image: image(url("icons/restart-hover.png"));
          }
        '';
      };
    })
  ];
}
