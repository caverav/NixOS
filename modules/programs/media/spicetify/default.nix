{spicetify-nix, ...}: {
  home-manager.sharedModules = [
    ({
      pkgs,
      ...
    }: let
      spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
    in {
      # import the flake's module for your system
      imports = [spicetify-nix.homeManagerModules.default];

      # configure spicetify :)
      programs.spicetify = {
        enable = true;
        theme = spicePkgs.themes.catppuccin;
        colorScheme = "mocha";

        enabledExtensions = with spicePkgs.extensions; [
          adblock
          shuffle # shuffle+ (special characters are sanitized out of ext names)
          # fullAppDisplay
          # hidePodcasts
        ];
      };
    })
  ];
}
