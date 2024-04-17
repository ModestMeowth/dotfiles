{
  lib,
  pkgs,
  ...
}: {
  networking.hostName = "think";

  imports = [
    ./hardware.nix
    ../../modules
    ../../modules/secureboot.nix
    ../../modules/gpu.nix
    ../../modules/pipewire.nix
    ../../modules/gnome.nix
    ../../modules/ssh.nix
    ../../modules/k3s.nix
  ];

  environment.systemPackages = with pkgs; [
    wezterm
    firefox-bin
    fontpreview
  ];

  services = {
    fwupd.enable = true;
    openssh.listenAddresses = [
      {addr = "100.91.249.96";}
      {addr = "fd7a:115c:a1e0::2501:f960";}
    ];
  };

  systemd.services.sshd = {
    overrideStrategy = "asDropin";
    unitConfig.After = lib.mkForce "tailscaled.service";
  };
}
