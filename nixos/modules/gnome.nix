{pkgs, ...}: {
  imports = [
    ./gdm.nix
  ];

  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-tour
      gedit
    ])
    ++ (with pkgs.gnome; [
      gnome-music
      epiphany
      geary
      totem
      iagno
      hitori
      atomix
    ]);
}
