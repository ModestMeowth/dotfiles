{pkgs, ...}: {
  imports = [
    ../../modules
    ../../modules/gtk.nix
  ];

  home = {
    username = "mm";
    homeDirectory = "/home/mm";

    packages = with pkgs; [
      wezterm
    ];
  };
}
