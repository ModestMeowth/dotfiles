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
  age = {
    identityPaths = [
      "/home/mm/.ssh/id_ed25519"
    ];
  };
}
