{pkgs, ...}: {
  imports = [./display-manager.nix];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };

  environment.systemPackages = with pkgs; [
    foot
    brightnessctl
    hypridle
    hyprlock
    wl-clipboard
    clipman
    wlsunset
    wofi
    waybar
    xdg-utils
  ];
}
