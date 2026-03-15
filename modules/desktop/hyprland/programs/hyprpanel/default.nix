{
  config,
  pkgs,
  wallpaper,
  ...
}: let
  theme = import ../../../../themes/tokens.nix;
  inherit (theme) colors fonts layout;
in {
  home-manager.sharedModules = [
    ({config, ...}: {
      home.packages = with pkgs; [
        hyprpanel
        libgtop
        dart-sass
        gpustat
        hyprsunset
        alacritty
      ];

      xdg.configFile."hyprpanel/config.json".text = builtins.toJSON {
        "bar.customModules.storage.paths" = ["/"];
        "bar.customModules.updates.pollingInterval" = 1440000;
        "bar.launcher.icon" = "";
        "bar.clock.format" = "%a %H:%M";
        "bar.media.show_active_only" = true;
        "bar.network.truncation_size" = 12;
        "bar.notifications.show_total" = true;
        "bar.volume.label" = false;
        "bar.bluetooth.label" = false;
        "bar.windowtitle.label" = true;
        "bar.workspaces.workspaces" = 5;
        "bar.workspaces.show_numbered" = false;
        "bar.workspaces.hideUnoccupied" = false;
        "bar.workspaces.monitorSpecific" = false;
        "bar.workspaces.numbered_active_indicator" = "color";
        "bar.workspaces.showApplicationIcons" = true;
        "bar.workspaces.showWsIcons" = true;
        "bar.workspaces.applicationIconEmptyWorkspace" = "";

        "theme.font.name" = fonts.ui;
        "theme.font.label" = fonts.uiMedium;
        "theme.font.size" = fonts.panelSize;

        "theme.bar.floating" = true;
        "theme.bar.location" = "top";
        "theme.bar.transparent" = true;
        "theme.bar.opacity" = 72;
        "theme.bar.background" = "${colors.bg}b8";
        "theme.bar.border_radius" = "${toString layout.panelRadius}px";
        "theme.bar.outer_spacing" = "${toString layout.panelOuterSpacing}px";
        "theme.bar.margin_top" = "${toString layout.panelMargin}px";
        "theme.bar.margin_bottom" = "0px";
        "theme.bar.margin_sides" = "${toString layout.panelOuterSpacing}px";
        "theme.bar.dropdownGap" = "4.8em";

        "theme.bar.buttons.style" = "default";
        "theme.bar.buttons.monochrome" = true;
        "theme.bar.buttons.spacing" = "0.5em";
        "theme.bar.buttons.radius" = "20px";
        "theme.bar.buttons.padding_x" = "1.2rem";
        "theme.bar.buttons.padding_y" = "0.58rem";
        "theme.bar.buttons.background" = "${colors.bgSoft}c6";
        "theme.bar.buttons.text" = colors.text;
        "theme.bar.buttons.icon" = colors.cyan;
        "theme.bar.buttons.hover" = "#162033";
        "theme.bar.buttons.notifications.background" = "#10182ad8";
        "theme.bar.buttons.notifications.hover" = colors.surfaceMuted;
        "theme.bar.buttons.notifications.icon" = colors.cyan;
        "theme.bar.buttons.notifications.total" = colors.lavender;
        "theme.bar.buttons.workspaces.active" = colors.cyan;
        "theme.bar.buttons.workspaces.available" = "#25324a";
        "theme.bar.buttons.workspaces.occupied" = "#5e81ac";
        "theme.bar.buttons.workspaces.hover" = "#1b2840";

        "theme.bar.menus.opacity" = 95;
        "theme.bar.menus.monochrome" = false;
        "theme.bar.menus.background" = "${colors.bgSoft}fc";
        "theme.bar.menus.cards" = "${colors.surfaceStrong}fa";
        "theme.bar.menus.card_radius" = "24px";
        "theme.bar.menus.border.size" = "1px";
        "theme.bar.menus.border.color" = colors.pink;
        "theme.bar.menus.border.radius" = "26px";
        "theme.bar.menus.label" = colors.textWarm;
        "theme.bar.menus.text" = colors.text;
        "theme.bar.menus.popover.background" = colors.surfaceHover;
        "theme.bar.menus.popover.text" = colors.textBright;
        "theme.bar.menus.listitems.active" = "#6c5b7b";
        "theme.bar.menus.icons.active" = colors.sky;
        "theme.bar.menus.switch.enabled" = colors.teal;
        "theme.bar.menus.check_radio_button.active" = colors.pink;
        "theme.bar.menus.buttons.default" = colors.surfaceActive;
        "theme.bar.menus.buttons.active" = colors.mauve;
        "theme.bar.menus.iconbuttons.active" = colors.blue;
        "theme.bar.menus.progressbar.foreground" = colors.sky;
        "theme.bar.menus.slider.primary" = colors.pink;
        "theme.bar.menus.tooltip.background" = "#6c7086";
        "theme.bar.menus.tooltip.text" = colors.textBright;
        "theme.bar.menus.dropdownmenu.background" = colors.surfaceActive;
        "theme.bar.menus.dropdownmenu.text" = colors.textBright;
        "theme.bar.menus.menu.media.background.color" = "#2f3149fa";
        "theme.bar.menus.menu.media.card.color" = colors.surfaceActive;
        "theme.bar.menus.menu.media.card.tint" = 90;

        "theme.notification.opacity" = 84;
        "theme.notification.background" = "#0b1020d8";
        "theme.notification.border" = colors.border;
        "theme.notification.border_radius" = "24px";
        "theme.notification.label" = colors.cyan;
        "theme.notification.labelicon" = colors.cyan;
        "theme.notification.text" = colors.text;
        "theme.notification.actions.background" = "#162033";
        "theme.notification.actions.text" = colors.bg;

        "theme.osd.enable" = true;
        "theme.osd.orientation" = "vertical";
        "theme.osd.location" = "left";
        "theme.osd.margins" = "0px 0px 0px 16px";
        "theme.osd.radius" = "24px";
        "theme.osd.bar_color" = colors.cyan;
        "theme.osd.bar_overflow_color" = colors.mauve;
        "theme.osd.bar_container" = colors.surface;
        "theme.osd.icon" = colors.bg;
        "theme.osd.icon_container" = colors.cyan;
        "theme.osd.label" = colors.cyan;
        "theme.osd.muted_zero" = true;

        "menus.clock.weather.unit" = "metric";
        "menus.dashboard.powermenu.confirmation" = false;
        "menus.dashboard.shortcuts.left.shortcut1.icon" = "";
        "menus.dashboard.shortcuts.left.shortcut1.command" = "rofi -show drun";
        "menus.dashboard.shortcuts.left.shortcut1.tooltip" = "Apps";
        "menus.dashboard.shortcuts.left.shortcut2.icon" = "󰄀";
        "menus.dashboard.shortcuts.left.shortcut2.command" = "${config.xdg.configHome}/hypr/scripts/screenshot.sh s";
        "menus.dashboard.shortcuts.left.shortcut2.tooltip" = "Screenshot";
        "menus.dashboard.shortcuts.left.shortcut3.icon" = "󰖔";
        "menus.dashboard.shortcuts.left.shortcut3.command" = "hyprsunset -t 3500";
        "menus.dashboard.shortcuts.left.shortcut3.tooltip" = "Warm Light";
        "menus.dashboard.shortcuts.left.shortcut4.icon" = "󰍃";
        "menus.dashboard.shortcuts.left.shortcut4.command" = "hyprlock";
        "menus.dashboard.shortcuts.left.shortcut4.tooltip" = "Lock";
        "menus.dashboard.shortcuts.right.shortcut1.icon" = "󰍹";
        "menus.dashboard.shortcuts.right.shortcut1.command" = "${config.xdg.configHome}/hypr/scripts/displaymode.sh";
        "menus.dashboard.shortcuts.right.shortcut1.tooltip" = "Displays";
        "menus.dashboard.shortcuts.right.shortcut2.icon" = "󱂬";
        "menus.dashboard.shortcuts.right.shortcut2.command" = "${config.xdg.configHome}/hypr/scripts/quickshell-toggle.sh";
        "menus.dashboard.shortcuts.right.shortcut2.tooltip" = "QuickShell";

        "wallpaper.enable" = false;
        "wallpaper.image" = "${../../../../themes/wallpapers/${wallpaper}}";
      };
    })
  ];
}
