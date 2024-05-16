{pkgs, ...}: {
  imports = [
    ../../modules
  ];

  home = {
    username = "mm";
    homeDirectory = "/home/mm";

    packages = with pkgs; [
    ];
  };
}
