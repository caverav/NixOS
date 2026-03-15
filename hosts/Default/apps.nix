{pkgs, ...}: {
  home-manager.sharedModules = [
    (_: {
      home.packages = with pkgs; [
        kdePackages.okular
      ];
    })
  ];

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
    dive

    gpu-screen-recorder
  ];
}
