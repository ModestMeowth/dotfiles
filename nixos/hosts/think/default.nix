{pkgs, ...}: {
  networking.hostName = "think";

  imports = [
    ./hardware.nix
    ../../modules
    ../../modules/hyprland.nix
    ../../modules/secureboot.nix
  ];

  environment.systemPackages = with pkgs; [
    wezterm
    firefox-bin
    fontpreview
  ];
}
