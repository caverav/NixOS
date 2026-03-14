{wallpaper, ...}: {
  home-manager.sharedModules = [
    (_: {
      programs.hyprlock = {
        enable = true;
        settings = {
          general = {
            hide_cursor = true;
          };

          background = [
            {
              monitor = "";
              color = "rgb(17, 17, 27)";
              path = "${../../../../themes/wallpapers/${wallpaper}}";

              new_optimizations = true;
              blur_size = 6;
              blur_passes = 3;
              noise = 0.008;
              contrast = 1.000;
              brightness = 0.9000;
              vibrancy = 0.1800;
              vibrancy_darkness = 0.0;
            }
          ];

          input-field = [
            {
              monitor = "";
              size = "320, 58";
              outline_thickness = 2;
              outer_color = "rgb(137, 180, 250)";
              inner_color = "rgba(17, 17, 27, 0.72)";
              font_color = "rgb(205, 214, 244)";
              fail_color = "rgb(237, 135, 150)";
              fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
              fail_transition = 300;
              fade_on_empty = false;
              placeholder_text = "<i>unlock</i>";
              dots_size = 0.2;
              dots_spacing = 0.64;
              dots_center = true;
              rounding = 18;
              check_color = "rgb(166, 227, 161)";
              position = "0, 120";
              halign = "center";
              valign = "bottom";
            }
          ];

          label = [
            {
              monitor = "";
              # text = "cmd[update:1000] echo \"<b><big> $(date +\"%H:%M:%S\") </big></b>\"";
              text = "$TIME";
              font_size = 72;
              font_family = "JetBrains Mono Nerd Font 10";
              color = "rgb(205, 214, 244)";
              position = "0, 0";
              valign = "center";
              halign = "center";
            }
            {
              monitor = "";
              text = "welcome back, <span text_transform=\"capitalize\" weight=\"bold\">$USER</span>";
              color = "rgb(180, 190, 254)";
              font_size = 18;
              font_family = "JetBrains Mono Nerd Font 10";
              position = "0, 72";
              halign = "center";
              valign = "center";
            }
            {
              monitor = "";
              text = "layout  $LAYOUT";
              color = "rgb(137, 180, 250)";
              font_size = 14;
              font_family = "JetBrains Mono Nerd Font 10";
              position = "0, 34";
              halign = "center";
              valign = "bottom";
            }
            /*
               {
              monitor = "";
              text = "Enter your password to unlock.";
              color = "rgb(198, 160, 246)";
              font_size = 14;
              font_family = "JetBrains Mono Nerd Font 10";
              position = "0, 60";
              halign = "center";
              valign = "bottom";
            }
            */
          ];
        };
      };
    })
  ];
}
