{
  pkgs,
  config,
  ...
}: {
  home = {
    username = "mm";
    homeDirectory = "/home/mm";

    stateVersion = "23.11";
  };

  imports = [
    ../../profiles/base
    ../../shell/bitwarden
  ];
}
