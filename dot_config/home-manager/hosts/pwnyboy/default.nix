{
  pkgs,
  ...
}: {
  imports = [
    ../../modules
    ../../modules/standalone.nix
  ];

  home = {
    username = "mm";
    homeDirectory = "/home/mm";

    stateVersion = "23.11";
  };

  packages = with pkgs; [
  ];
}
