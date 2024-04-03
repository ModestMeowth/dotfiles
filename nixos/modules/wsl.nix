{pkgs, ...}: {
  system.stateVersion = "24.05";

  imports = [
    ./common.nix
  ];

  wsl = {
    enable = true;
    wslConf = {
      interop.appendWindowsPath = true;
    };
    startMenuLaunchers = true;
  };

  nixpkgs.overlays = [
    (final: prev:
      with final; {
        systemd-wslfix = final.systemd.overrideAttrs ({patches, ...}: {
          patches =
            patches
            ++ [
              ../patches/systemd-wslfix.patch
            ];
        });
      })
  ];

  systemd.package = pkgs.systemd-wslfix;
}
