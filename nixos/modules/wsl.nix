{
  lib,
  pkgs,
  ...
}: {
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

  # patch fixes https://github.com/microsoft/WSL/issues/8879
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

  # fixes ssh over tailscale
  networking.interfaces.eth0.mtu = 1500;
  # mtu change errors out sshd at boot time when bound only to tailscale
  systemd.services.sshd = {
    overrideStrategy = "asDropin";
    unitConfig.After = lib.mkForce "tailscaled.service";
  };
  # allow wheel to fix mtu manually
  security.sudo.extraRules = [
    {
      groups = ["wheel"];
      commands = [
        {
          command = "/run/current-system/ws/bin/ip link set dev eth0 mtu 1500";
          options = ["SETENV" "NOPASSWD"];
        }
      ];
    }
  ];
}
