{pkgs, ...}: {
  home-manager.sharedModules = [
    (_: {
      home.packages = with pkgs; [
        warp-terminal
        alacritty
      ];
    })
  ];
}
