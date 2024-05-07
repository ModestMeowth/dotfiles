{
  lib,
  pkgs,
  ...
}: {
  system.stateVersion = "24.05";

  imports = [
    ./common.nix
    ../overlays/systemd-wslfix.nix
  ];

  wsl = {
    enable = true;
    wslConf = {
      interop.appendWindowsPath = true;
    };
    startMenuLaunchers = true;
  };

  systemd.package = pkgs.systemd-wslfix;

  # fixes ssh over tailscale
  networking.interfaces.eth0.mtu = 1500;
  # allow wheel to fix mtu manually
  security.sudo.extraRules = [
    {
      groups = ["wheel"];
      commands = [
        {
          command = "/run/current-system/sw/bin/ip link set dev eth0 mtu 1500";
          options = ["SETENV" "NOPASSWD"];
        }
      ];
    }
  ];
}
