{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs.fishPlugins; [
    autopair
    fzf-fish
    puffer
    colored-man-pages
  ];

  xdg.configFile.fish = {
    source = ./config;
    recursive = true;
  };
}
