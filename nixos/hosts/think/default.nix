{pkgs, ...}: {
  networking.hostName = "think";

  imports = [
    ./hardware.nix
    ../../modules
    ../../modules/secureboot.nix
    ../../modules/gpu.nix
    ../../modules/pipewire.nix
    ../../modules/gnome.nix
  ];

  environment.systemPackages = with pkgs; [
    wezterm
    firefox-bin
    fontpreview
  ];
}
